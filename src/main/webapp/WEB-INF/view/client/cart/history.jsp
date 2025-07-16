<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Cart</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet">
                    rel="stylesheet" />
                    <!-- <link href="css/styles.css" rel="stylesheet" /> -->
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Navbar start -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- Navbar End -->

                    <!-- Cart -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Products</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${empty order}">
                                                <tr>
                                                    <td colspan="6" class="text-center py-4">
                                                        No product in my cart
                                                    </td>
                                                </tr>
                                            </c:when>

                                            <c:otherwise>
                                                <c:forEach items="${order}" var="orderList" varStatus="status">
                                                    <tr>
                                                        <th scope="row" colspan="2">
                                                            <p class="mb-0 mt-4">
                                                                Order Id = ${orderList.id}
                                                            </p>
                                                        </th>
                                                        <td colspan="3">
                                                            <p class="mb-0 mt-4">
                                                                <fmt:formatNumber type="number"
                                                                    value="${orderList.totalPrice}" />
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4">
                                                                ${orderList.status}
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <c:forEach items="${orderList.orderDetails}" var="orderDetails"
                                                        varStatus="status">
                                                        <tr>
                                                            <th scope="row">
                                                                <div class="d-flex align-items-center">
                                                                    <img src="/images/product/${orderDetails.product.image}"
                                                                        class="img-fluid me-5 rounded-circle"
                                                                        style="width: 80px; height: 80px;" alt="">
                                                                </div>
                                                            </th>
                                                            <td>
                                                                <a href="/product/${orderDetails.product.id}"
                                                                    class="position-relative me-4 my-auto">
                                                                    <p class="mb-0 mt-4">${orderDetails.product.name}
                                                                    </p>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetails.product.price}" />
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <div class="input-group quantity mt-4"
                                                                    style="width: 100px;">
                                                                    <input type="text"
                                                                        class="form-control form-control-sm text-center border-0"
                                                                        value="${orderDetails.quantity}" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4" cartdetail-id="${orderDetails.id}">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetails.product.price * orderDetails.quantity}" />
                                                                    đ
                                                                </p>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Cart End -->

                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="client/lib/easing/easing.min.js"></script>
                    <script src="client/lib/waypoints/waypoints.min.js"></script>
                    <script src="client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="client/js/main.js"></script>
                </body>

                </html>