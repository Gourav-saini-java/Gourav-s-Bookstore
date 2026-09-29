<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<HashMap<String, Object>> cart
            = (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.size() == 0) {
        response.sendRedirect("cart.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Checkout | Gourav's Bookstore</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>
            body { background: #faf6f4; font-family: Poppins, sans-serif; }

            .checkout-card {
                background: #fff;
                border-radius: 15px;
                padding: 25px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            }

        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

        <!-- Navbar -->
        <jsp:include page="navbar.jsp"/>

        <main class="flex-fill">
            <div class="container my-5">
                <h2 class="mb-4 text-center">💳 Checkout</h2>

                <div class="row">
                    <!-- Order Summary -->
                    <div class="col-md-6 mb-4">
                        <div class="checkout-card">
                            <h4 class="mb-3">📦 Order Summary</h4>

                            <%
                                int total = 0;
                                for (HashMap<String, Object> book : cart) {
                                    int price = (int) book.get("price");
                                    int qty = (int) book.get("qty");
                                    int subtotal = price * qty;
                                    total += subtotal;
                            %>

                            <div class="d-flex justify-content-between border-bottom py-2">
                                <div>
                                    <strong><%= book.get("title")%></strong><br>
                                    Qty: <%= qty%>
                                </div>
                                <div>₹ <%= subtotal%></div>
                            </div>

                            <% }%>

                            <h5 class="text-end mt-3">
                                Total: <span class="text-success">₹ <%= total%></span>
                            </h5>
                        </div>
                    </div>

                    <!-- Shipping Details -->
                    <div class="col-md-6">
                        <div class="checkout-card">
                            <h4 class="mb-3">🚚 Shipping Details</h4>

                            <form action="order.jsp" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" name="name" class="form-control" value="<%= session.getAttribute("username")%>" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mobile Number</label>
                                    <input type="text" name="mobile" class="form-control"
                                           pattern="[0-9]{10}" maxlength="10"
                                           placeholder="Enter 10-digit mobile number" required>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">State</label>
                                        <select name="state" id="state" class="form-select" required onchange="loadCities()">
                                            <option value="">-- Select State --</option>
                                            <option>Andhra Pradesh</option>
                                            <option>Arunachal Pradesh</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Chandigarh</option>
                                            <option>Chhattisgarh</option>
                                            <option>Delhi</option>
                                            <option>Goa</option>
                                            <option>Gujarat</option>
                                            <option>Haryana</option>
                                            <option>Himachal Pradesh</option>
                                            <option>Jammu and Kashmir</option>
                                            <option>Jharkhand</option>
                                            <option>Karnataka</option>
                                            <option>Kerala</option>
                                            <option>Ladakh</option>
                                            <option>Madhya Pradesh</option>
                                            <option>Maharashtra</option>
                                            <option>Manipur</option>
                                            <option>Meghalaya</option>
                                            <option>Mizoram</option>
                                            <option>Nagaland</option>
                                            <option>Odisha</option>
                                            <option>Puducherry</option>
                                            <option>Punjab</option>
                                            <option>Rajasthan</option>
                                            <option>Sikkim</option>
                                            <option>Tamil Nadu</option>
                                            <option>Telangana</option>
                                            <option>Tripura</option>
                                            <option>Uttar Pradesh</option>
                                            <option>Uttarakhand</option>
                                            <option>West Bengal</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">City</label>
                                        <select name="city" id="city" class="form-select" required>
                                            <option value="">-- Select City --</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Address</label>
                                        <textarea name="address" class="form-control" rows="3" required></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Payment Method</label>
                                        <input type="text" class="form-control" value="Only Cash on Delivery (COD) is Available!" readonly>
                                        <input type="hidden" name="payment" value="COD">
                                    </div>

                                    <p class="text-end text-muted">
                                        Order Date: <%= new java.text.SimpleDateFormat("dd-MM-yyyy")
                                                .format(new java.util.Date())%>
                                    </p>

                                    <button type="submit" class="btn btn-success w-100"
                                            onclick="this.disabled = true; this.innerText = 'Processing...'; this.form.submit();">
                                        Place Order
                                    </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

    </body>

    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
                                                const cityData = {
                                                "Andhra Pradesh": [
                                                        "Visakhapatnam", "Vijayawada", "Guntur", "Nellore", "Kurnool",
                                                        "Rajamahendravaram", "Tirupati", "Kakinada", "Kadapa", "Anantapuramu",
                                                        "Mangalagiri-Tadepalli", "Eluru", "Vizianagaram", "Ongole",
                                                        "Proddatur", "Nandyal", "Adoni", "Madanapalle", "Machilipatnam",
                                                        "Tenali", "Chittoor", "Hindupur", "Srikakulam", "Bhimavaram",
                                                        "Tadepalligudem", "Guntakal", "Dharmavaram", "Gudivada",
                                                        "Narasaraopet", "Kadiri", "Tadpatri", "Chilakaluripet"
                                                ],
                                                        "Arunachal Pradesh": [
                                                                "Itanagar", "Tawang", "Pasighat", "Ziro", "Bomdila",
                                                                "Changlang", "Dibang Valley", "East Kameng", "East Siang"
                                                        ],
                                                        "Assam": [
                                                                "Dhuburi", "Dibrugarh", "Dispur", "Guwahati", "Jorhat",
                                                                "Nagaon", "Silchar", "Tezpur", "Tinsukia", "Lakhimpur", "Majuli"
                                                        ],
                                                        "Bihar": [
                                                                "Patna", "Gaya", "Bhagalpur", "Darbhanga",
                                                                "Muzaffarpur", "Bihar Sharif", "Siwan", "Sasaram"
                                                        ],
                                                        "Chhattisgarh": [
                                                                "Raipur", "Bhilai-Durg", "Bilaspur", "Korba",
                                                                "Ambikapur", "Rajnandgaon", "Raigarh", "Jagdalpur"
                                                        ],
                                                        "Dadra & Nagar Haveli and Daman & Diu": [
                                                                "Daman", "Diu", "Silvassa"
                                                        ],
                                                        "Delhi": [
                                                                "New Delhi", "Dwarka", "Rohini",
                                                                "Saket", "Karol Bagh", "Lajpat Nagar"
                                                        ],
                                                        "Goa": [
                                                                "Panaji", "Margao", "Vasco da Gama",
                                                                "Mapusa", "Ponda", "Goa Velha", "Chaudi"
                                                        ],
                                                        "Gujarat": [
                                                                "Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavnagar",
                                                                "Jamnagar", "Junagadh", "Gandhinagar", "Anand", "Nadiad",
                                                                "Morbi", "Surendranagar", "Bharuch", "Valsad",
                                                                "Navsari", "Porbandar", "Mehsana", "Bhuj"
                                                        ],
                                                        "Haryana": [
                                                                "Chandigarh", "Faridabad", "Gurugram", "Panipat",
                                                                "Ambala", "Sonipat", "Karnal", "Yamunanagar",
                                                                "Hisar", "Rohtak", "Panchkula", "Kurukshetra",
                                                                "Bhiwani", "Rewari"
                                                        ],
                                                        "Himachal Pradesh": [
                                                                "Shimla", "Manali", "Dharamsala", "Kullu",
                                                                "Dalhousie", "Palampur", "Kangra", "Una"
                                                        ],
                                                        "Jammu & Kashmir": [
                                                                "Srinagar", "Jammu", "Anantnag", "Udhampur",
                                                                "Baramula", "Sopore", "Kathua", "Pahalgam",
                                                                "Katra", "Rajauri"
                                                        ],
                                                        "Jharkhand": [
                                                                "Ranchi", "Jamshedpur", "Dhanbad",
                                                                "Bokaro Steel City", "Hazaribagh",
                                                                "Deoghar", "Giridih", "Ramgarh",
                                                                "Medininagar", "Chaibasa"
                                                        ],
                                                        "Karnataka": [
                                                                "Bengaluru", "Mysore", "Hubballi-Dharwad",
                                                                "Mangaluru", "Belagavi", "Kalaburagi",
                                                                "Davanagere", "Ballari", "Vijayapura", "Tumakuru"
                                                        ],
                                                        "Kerala": [
                                                                "Thiruvananthapuram", "Kochi", "Kozhikode",
                                                                "Thrissur", "Kollam", "Kannur"
                                                        ],
                                                        "Ladakh": [
                                                                "Leh", "Kargil", "Chuglamsar", "Spituk"
                                                        ],
                                                        "Lakshadweep": [
                                                                "Kavaratti", "Agatti", "Amini", "Minicoy"
                                                        ],
                                                        "Madhya Pradesh": [
                                                                "Indore", "Bhopal", "Jabalpur", "Gwalior",
                                                                "Ujjain", "Sagar", "Dewas", "Satna", "Ratlam", "Rewa"
                                                        ],
                                                        "Maharashtra": [
                                                                "Mumbai", "Pune", "Nagpur", "Thane", "Nashik",
                                                                "Pimpri-Chinchwad", "Vasai-Virar", "Aurangabad",
                                                                "Solapur", "Amravati", "Kolhapur", "Malegaon",
                                                                "Nanded", "Bhiwandi", "Jalgaon"
                                                        ],
                                                        "Manipur": [
                                                                "Imphal", "Bishnupur", "Chandel",
                                                                "Kamjong", "Noney", "Thoubal"
                                                        ],
                                                        "Meghalaya": [
                                                                "Shillong", "Tura", "Jowai",
                                                                "Williamnagar", "Ribhoi", "Mawkyrwat"
                                                        ],
                                                        "Mizoram": [
                                                                "Aizawl", "Champhai", "Kolasib",
                                                                "Lawngtlai", "Mamit", "Saiha"
                                                        ],
                                                        "Nagaland": [
                                                                "Dimapur", "Kohima", "Mokokchung", "Peren",
                                                                "Tuensang", "Wokha", "Zunheboto",
                                                                "Mon", "Longleng", "Phek"
                                                        ],
                                                        "Odisha": [
                                                                "Bhubaneswar", "Cuttack", "Rourkela", "Berhampur",
                                                                "Puri", "Baleshwar", "Jagatsinghapur",
                                                                "Gajapati", "Malkangiri", "Sundargarh"
                                                        ],
                                                        "Puducherry": [
                                                                "Puducherry", "Karaikal", "Mahe", "Yanam"
                                                        ],
                                                        "Punjab": [
                                                                "Amritsar", "Ludhiana", "Jalandhar",
                                                                "Patiala", "Bathinda", "Mohali",
                                                                "Pathankot", "Hoshiarpur",
                                                                "Moga", "Shahid Bhagat Singh Nagar"
                                                        ],
                                                        "Rajasthan": [
                                                                "Jaipur", "Jodhpur", "Udaipur", "Kota",
                                                                "Ajmer", "Bikaner", "Alwar",
                                                                "Bharatpur", "Sikar", "Bhilwara"
                                                        ],
                                                        "Sikkim": [
                                                                "Gangtok", "Mangan", "Namchi",
                                                                "Rangpo", "Rhenak", "Singtam",
                                                                "Gyalshing", "Yuksom", "Pakyong", "Tashiding"
                                                        ],
                                                        "Tamil Nadu": [
                                                                "Chennai", "Coimbatore", "Madurai",
                                                                "Tiruchirappalli", "Salem", "Tirunelveli",
                                                                "Vellore", "Ramanathapuram",
                                                                "Kanniyakumari", "Kanchipuram"
                                                        ],
                                                        "Telangana": [
                                                                "Hyderabad", "Warangal", "Karimnagar",
                                                                "Nizamabad", "Khammam", "Nalgonda",
                                                                "Adilabad", "Medak", "Mahbubnagar", "Rangareddy"
                                                        ],
                                                        "Tripura": [
                                                                "Agartala", "Dharmanagar", "Udaipur",
                                                                "Kailashahar", "Belonia", "Khowai",
                                                                "Kamalpur", "Madhuban", "Narsingarh", "Sonamura"
                                                        ],
                                                        "Uttar Pradesh": [
                                                                "Lucknow", "Kanpur", "Agra", "Varanasi",
                                                                "Prayagraj", "Noida", "Ghaziabad",
                                                                "Meerut", "Bareilly", "Moradabad",
                                                                "Gorakhpur", "Jaunpur", "Mathura"
                                                        ],
                                                        "Uttarakhand": [
                                                                "Dehradun", "Haridwar", "Rishikesh",
                                                                "Nainital", "Rudrapur", "Almora",
                                                                "Bageshwar", "Champawat", "Pithoragarh", "Uttarkashi"
                                                        ],
                                                        "West Bengal": [
                                                                "Kolkata", "Howrah", "Asansol", "Durgapur",
                                                                "Siliguri", "Darjeeling", "Malda",
                                                                "Murshidabad", "Purulia", "Hooghly", "Uttar Dinajpur"
                                                        ]
                                                };
                                                function loadCities() {
                                                const state = document.getElementById("state").value;
                                                const citySelect = document.getElementById("city");
                                                citySelect.innerHTML = '<option value="">-- Select City --</option>';
                                                if (cityData[state]) {
                                                cityData[state].forEach(city => {
                                                const option = document.createElement("option");
                                                option.text = city;
                                                option.value = city;
                                                citySelect.add(option);
                                                });
                                                }
                                                }
    </script>

</html>
