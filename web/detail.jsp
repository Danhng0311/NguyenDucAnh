<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="models.CategoryDAO" %>
<%@page import="dal.Category" %>
<%@page import="models.ProductDAO" %>
<%@page import="dal.Product" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        <link href="css/style.css" rel="stylesheet"/>

        <script type="text/javascript">
            function buynow(id) {
                if (confirm("Do you wanna to buy")) {
                    window.location = "buy?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <div id="container">
            <div id="header">
                <div id="logo">
                    <a href="index.jsp"><img src="img/logo.png"/></a>
                </div>
                <div id="banner">
                    <ul>
                        <li><a href="cart.jsp">Cart: ${size}</a></li>
                        <li><a href="signin.jsp">SignIn</a></li>
                        <li><a href="signup.jsp">SignUp</a></li>
                        <li><a href="#">Profile</a></li>
                        <li><a href="#">SignOut</a></li>
                    </ul>
                </div>
            </div>
            <div id="content">
                <div id="content-detail">
                    <div id="content-title">
                        <a href="index.jsp">Home</a> >
                        <%
                        ArrayList<Category> list = new CategoryDAO().getProducts();
                        String productID = request.getParameter("model");
                        
                        String proN = "";
                        for(Category c: list) {
                        
                        %> 
                        <a href="ProductList?CategoryId=<%= c.getCategoryID()%>">Category 1</a>
                        <%
                            break;
                            }
                        %>
                        Model: 1
                    </div>
                    <div id="product">
                        <div id="product-name">
                            <c:forEach var="p" items="${listP}">
                                <h2>${p.getProductName()}</h2>
                                <div id="product-detail">
                                    <div id="product-detail-left">
                                        <div id="product-img">
                                            <img src="img/1.jpg"/>
                                        </div>
                                        <div id="product-img-items">
                                            <div><a href="#"><img src="img/1.jpg"/></a></div>
                                            <div><a href="#"><img src="img/1.jpg"/></a></div>
                                            <div><a href="#"><img src="img/1.jpg"/></a></div>
                                            <div><a href="#"><img src="img/1.jpg"/></a></div>
                                        </div>
                                    </div>



                                    <div id="product-detail-right">
                                        <div id="product-detail-right-content">
                                            <div id="product-price">${p.getUnitPrice()}</div>
                                            <div id="product-status">
                                                <c:choose>
                                                    <c:when test="${p.getUnitsInStock() > 0}">
                                                        In Stock
                                                    </c:when>
                                                    <c:when test="${p.getUnitsInStock() == 0}">
                                                        Out Of Stock
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div id="product-detail-buttons">
                                            <div id="product-detail-button">
                                                <form action="buy?id=${p.getProductID()}" method="post">
                                                    <input type="submit" value="ADD TO CART"  style="background-color: orange; color:white;border: 1px solid gray;padding: 10px 20px;">

                                                </form>
                                            </div> 
                                            <div id="product-detail-button">
                                                <input type="submit" value="BUY NOW" onclick="buynow('${p.getProductID()}')" style="background-color: white; color:orange;border: 1px solid gray;padding: 10px 20px;">
                                            </div>
                                        </div>
                                    </div
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="info-detail">
                    <div id="info-detail-title">
                        <h2>Information deltail</h2>
                        <div style="margin:10px auto;">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum, debitis. Asperiores soluta eveniet eos accusantium doloremque cum suscipit ducimus enim at sapiente mollitia consequuntur dicta quaerat, sunt voluptates autem. Quam!
                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rem illum autem veritatis maxime corporis quod quibusdam nostrum eaque laborum numquam quos unde eveniet aut, exercitationem voluptatum veniam fugiat, debitis esse?
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio eligendi ratione vitae nobis numquam dolorum assumenda saepe enim cumque blanditiis, deleniti neque voluptate vel ducimus in omnis harum aut nisi.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">footer</div>
    </div>
</body>
</html>