package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Gourav's Bookstore</title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Font Awesome -->\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Google Font -->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                font-family: 'Poppins', sans-serif;\n");
      out.write("                background: #faf6f4;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Banner */\n");
      out.write("            .banner {\n");
      out.write("                width: 100%;\n");
      out.write("                height: 260px;\n");
      out.write("                background:\n");
      out.write("                    linear-gradient(\n");
      out.write("                    rgba(201, 139, 155, 0.55),\n");
      out.write("                    rgba(155, 95, 111, 0.55)\n");
      out.write("                    ),\n");
      out.write("                    url(\"images/banner.jpg\") center/cover no-repeat;\n");
      out.write("                border-radius: 0 0 30px 30px;\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                justify-content: center;\n");
      out.write("                text-align: center;\n");
      out.write("                color: #faf6f4;\n");
      out.write("                margin-bottom: 40px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .banner h1 {\n");
      out.write("                font-size: 42px;\n");
      out.write("                font-weight: 700;\n");
      out.write("                text-shadow: 0 4px 10px rgba(0,0,0,0.35);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .banner p {\n");
      out.write("                font-size: 18px;\n");
      out.write("                opacity: 0.95;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Best Seller Cards */\n");
      out.write("            .bestseller-card {\n");
      out.write("                background: #ffffff;\n");
      out.write("                border-radius: 18px;\n");
      out.write("                box-shadow: 0 8px 20px rgba(0,0,0,0.08);\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bestseller-card:hover {\n");
      out.write("                transform: translateY(-10px);\n");
      out.write("                box-shadow: 0 15px 35px rgba(0,0,0,0.15);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bestseller-img {\n");
      out.write("                width: 100%;\n");
      out.write("                height: 240px;\n");
      out.write("                object-fit: contain;\n");
      out.write("                background: #faf6f4;\n");
      out.write("                padding: 15px;\n");
      out.write("                border-radius: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .genre-badge {\n");
      out.write("                background: #dee2ff;\n");
      out.write("                color: #3a0ca3;\n");
      out.write("                font-size: 12px;\n");
      out.write("                padding: 6px 12px;\n");
      out.write("                border-radius: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .card-title {\n");
      out.write("                font-weight: 600;\n");
      out.write("                color: #3a0ca3;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .price {\n");
      out.write("                font-size: 18px;\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #198754;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"d-flex flex-column min-vh-100\">\n");
      out.write("\n");
      out.write("        <!-- Navbar -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("\n");
      out.write("        <main class=\"flex-fill\">\n");
      out.write("            <!-- Banner -->\n");
      out.write("            <div class=\"banner\">\n");
      out.write("                <div>\n");
      out.write("                    <h1>Welcome to Gourav's Bookstore! 📚</h1>\n");
      out.write("                    <p>Discover stories, knowledge & inspiration.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Best Selling Books -->\n");
      out.write("            <div class=\"container my-5\">\n");
      out.write("                <h2 class=\"text-center fw-bold mb-4\" style=\"color:#3a0ca3;\">\n");
      out.write("                    🌟 Best Selling Books\n");
      out.write("                </h2>\n");
      out.write("\n");
      out.write("                <div class=\"row g-4\">\n");
      out.write("                    ");

                        String[][] bestBooks = {
                            {"Harry Potter", "J.K. Rowling", "Fantasy",
                                "A magical journey of a young wizard discovering friendship, courage, and destiny at Hogwarts School of Witchcraft and Wizardry.",
                                "499", "best1.jpg"},
                            {"Ikigai", "Héctor García", "Lifestyle",
                                "An inspiring guide that reveals the Japanese secret to a long, meaningful, and happy life.",
                                "279", "best2.jpg"},
                            {"IT", "Stephen King", "Horror",
                                "A chilling horror novel that explores fear, friendship, and an ancient evil haunting the town of Derry.",
                                "416", "best3.jpg"},
                            {"It Ends With Us", "Colleen Hoover", "Romance",
                                "An emotional love story dealing with relationships, resilience, and the courage to break painful cycles.",
                                "318", "best4.jpg"}
                        };

                        for (int i = 0; i < bestBooks.length; i++) {
                    
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"col-md-6 col-lg-3\">\n");
      out.write("                        <div class=\"card bestseller-card h-100 p-3\">\n");
      out.write("\n");
      out.write("                            <img src=\"images/");
      out.print(bestBooks[i][5]);
      out.write("\" \n");
      out.write("                                 class=\"bestseller-img\" \n");
      out.write("                                 alt=\"");
      out.print(bestBooks[i][0]);
      out.write("\">\n");
      out.write("\n");
      out.write("                            <div class=\"card-body text-center\">\n");
      out.write("                                <span class=\"badge genre-badge mb-2\">");
      out.print(bestBooks[i][2]);
      out.write("</span>\n");
      out.write("\n");
      out.write("                                <h5 class=\"card-title mt-2\">");
      out.print(bestBooks[i][0]);
      out.write("</h5>\n");
      out.write("\n");
      out.write("                                <p class=\"text-muted small mb-2\">\n");
      out.write("                                    by <strong>");
      out.print(bestBooks[i][1]);
      out.write("</strong>\n");
      out.write("                                </p>\n");
      out.write("\n");
      out.write("                                <p class=\"card-text small text-muted\">\n");
      out.write("                                    ");
      out.print(bestBooks[i][3]);
      out.write("\n");
      out.write("                                </p>\n");
      out.write("\n");
      out.write("                                <div class=\"price mt-2\">₹ ");
      out.print(bestBooks[i][4]);
      out.write("</div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("        <!-- Footer -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("        <!-- JS -->\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function changeQty(btn, value) {\n");
      out.write("            let input = btn.parentElement.querySelector(\".qty-input\");\n");
      out.write("            let qty = parseInt(input.value) + value;\n");
      out.write("            if (qty < 0) qty = 0;\n");
      out.write("            input.value = qty;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            // Live Search\n");
      out.write("            document.getElementById(\"searchInput\").addEventListener(\"keyup\", function () {\n");
      out.write("            let filter = this.value.toLowerCase();\n");
      out.write("            let books = document.querySelectorAll(\".book-item\");\n");
      out.write("            books.forEach(book => {\n");
      out.write("            let text = book.innerText.toLowerCase();\n");
      out.write("            book.style.display = text.includes(filter) ? \"block\" : \"none\";\n");
      out.write("            });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
