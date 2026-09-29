<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Orders"%>
<%@page import="Controller.OrdersTest"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }

    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
    String search = request.getParameter("search");

    List<Orders> list = OrdersTest.read();

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat display = new SimpleDateFormat("dd-MM-yyyy");

    Map<String, Double> dailyMap = new LinkedHashMap<>();
    Map<String, Integer> orderCountMap = new LinkedHashMap<>();

    double totalRevenue = 0;
    double todayTotal = 0;
    double monthTotal = 0;
    double yearTotal = 0;

    Calendar today = Calendar.getInstance();

    Date from = null;
    Date to = null;

    try {
        if (fromDate != null && !fromDate.isEmpty()) from = sdf.parse(fromDate);
        if (toDate != null && !toDate.isEmpty()) to = sdf.parse(toDate);
    } catch (Exception e) {}

    for (Orders o : list) {

        Date orderDate = o.getOrderDate();
        if (orderDate == null) continue;

        Calendar cal = Calendar.getInstance();
        cal.setTime(orderDate);

        boolean valid = true;

        if (from != null && orderDate.before(from)) valid = false;
        if (to != null && orderDate.after(to)) valid = false;

        if (search != null && !search.trim().isEmpty()) {
            String s = search.toLowerCase();

            String name = o.getName()!=null ? o.getName().toLowerCase() : "";
            String city = o.getCity()!=null ? o.getCity().toLowerCase() : "";
            String state = o.getState()!=null ? o.getState().toLowerCase() : "";

            if (!(name.contains(s) || city.contains(s) || state.contains(s))) {
                valid = false;
            }
        }

        if (!valid) continue;

        String date = display.format(orderDate);
        double amount = (double)o.getTotal();

        totalRevenue += amount;

        // Daily map
        dailyMap.put(date, dailyMap.getOrDefault(date, 0.0) + amount);
        orderCountMap.put(date, orderCountMap.getOrDefault(date, 0) + 1);

        // Today
        if (today.get(Calendar.DATE) == cal.get(Calendar.DATE) &&
            today.get(Calendar.MONTH) == cal.get(Calendar.MONTH) &&
            today.get(Calendar.YEAR) == cal.get(Calendar.YEAR)) {
            todayTotal += amount;
        }

        // Month
        if (today.get(Calendar.MONTH) == cal.get(Calendar.MONTH) &&
            today.get(Calendar.YEAR) == cal.get(Calendar.YEAR)) {
            monthTotal += amount;
        }

        // Year
        if (today.get(Calendar.YEAR) == cal.get(Calendar.YEAR)) {
            yearTotal += amount;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales Report</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font (SAME AS YOUR OLD PAGE) -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Export -->
    <script src="https://cdn.jsdelivr.net/npm/xlsx/dist/xlsx.full.min.js"></script>
    
     <!-- PDF -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.31/jspdf.plugin.autotable.min.js"></script>


    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #faf6f4;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        footer {
            background: #cdb4db;
            margin-top: auto;
        }

        .summary-card {
            border-radius: 12px;
            padding: 15px;
            color: white;
        }

        @media print {
            body * { visibility: hidden; }
            #printArea, #printArea * { visibility: visible; }
            .no-print { display: none; }
        }
    </style>
</head>

<body>

<jsp:include page="adminNavbar.jsp"/>

<main class="flex-fill">

<div class="container mt-5">

    <!-- SUMMARY CARDS -->
    <div class="row mb-4 text-center">
        <div class="col-md-4">
            <div class="summary-card bg-success shadow">
                <h5>Today</h5>
                <h3>₹ <%= todayTotal %></h3>
            </div>
        </div>

        <div class="col-md-4">
            <div class="summary-card bg-warning shadow">
                <h5>This Month</h5>
                <h3>₹ <%= monthTotal %></h3>
            </div>
        </div>

        <div class="col-md-4">
            <div class="summary-card bg-primary shadow">
                <h5>This Year</h5>
                <h3>₹ <%= yearTotal %></h3>
            </div>
        </div>
    </div>

    <div class="card shadow" id="printArea">

        <div class="card-header bg-primary text-white text-center">
            <h4>Sales Report</h4>
        </div>

        <!-- FILTER -->
        <div class="card-body no-print">
            <form method="get" class="row g-2">
                <div class="col-md-3">
                    <input type="date" name="fromDate" class="form-control">
                </div>
                <div class="col-md-3">
                    <input type="date" name="toDate" class="form-control">
                </div>
                <div class="col-md-3">
                    <input type="text" name="search" class="form-control" placeholder="Search">
                </div>
                <div class="col-md-3 d-flex gap-2">
                    <button class="btn btn-primary w-100">Filter</button>
                    <a href="salesReport.jsp" class="btn btn-secondary w-100">Reset</a>
                </div>
            </form>
        </div>

        <!-- TABLE -->
        <div class="card-body">
            <table id="reportTable" class="table table-bordered table-striped text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Date</th>
                        <th>Total Orders</th>
                        <th>Total Revenue</th>
                        <th>Average Order Value</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    for (String date : dailyMap.keySet()) {
                        double revenue = dailyMap.get(date);
                        int count = orderCountMap.get(date);
                        double avg = revenue / count;
                %>
                    <tr>
                        <td><%= date %></td>
                        <td><%= count %></td>
                        <td>₹ <%= String.format("%.2f", revenue) %></td>
                        <td>₹ <%= String.format("%.2f", avg) %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <!-- CHART -->
        <div class="p-3">
            <canvas id="chart"></canvas>
        </div>

    </div>

    <!-- BUTTONS -->
    <div class="d-flex justify-content-center gap-3 mt-4 pb-4 no-print">
        <a href="admin.jsp" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Back to Admin
        </a>

        <button onclick="window.print()" class="btn btn-success">
            <i class="fa fa-print"></i> Print
        </button>

        <button onclick="exportExcel()" class="btn btn-success">
            Excel
        </button>

        <button onclick="exportPDF()" class="btn btn-danger">
            PDF
        </button>
    </div>


</div>

</main>

<jsp:include page="footer.jsp"/>

<script>
    const labels = [
        <%
            int i=0;
            for(String d: dailyMap.keySet()){
                if(i++>0) out.print(",");
                out.print("'" + d + "'");
            }
        %>
    ];

    const data = [
        <%
            int j=0;
            for(Double v: dailyMap.values()){
                if(j++>0) out.print(",");
                out.print(v);
            }
        %>
    ];

    new Chart(document.getElementById("chart"), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{ label: 'Revenue', data: data }]
        }
    });

    function exportExcel(){
        let wb = XLSX.utils.table_to_book(document.getElementById("reportTable"));
        XLSX.writeFile(wb, "SalesReport.xlsx");
    }

   function exportPDF() {
    const { jsPDF } = window.jspdf;
    let doc = new jsPDF();

    doc.setFont("helvetica", "normal");
    doc.text("Sales Report", 14, 15);

    let headers = [];
    document.querySelectorAll("#reportTable thead th").forEach(th => {
        headers.push(th.innerText);
    });

    let data = [];
    document.querySelectorAll("#reportTable tbody tr").forEach(tr => {
        let row = [];
        tr.querySelectorAll("td").forEach(td => {

            let text = td.innerText.trim();

            // ❗ FIX: replace ₹ symbol
            text = text.replace("₹", "Rs.");

            row.push(text);
        });
        data.push(row);
    });

    doc.autoTable({
        head: [headers],
        body: data,
        startY: 20,
        theme: 'grid',
        styles: {
            font: "helvetica",
            fontSize: 10,
            halign: 'center'
        }
    });

    doc.save("SalesReport.pdf");
}
</script>

</body>
</html>