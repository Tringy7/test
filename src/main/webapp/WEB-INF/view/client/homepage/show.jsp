<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>\
            <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>HomePage</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.cs"
                        rel="stylesheet" />
                    <link href="css/styles.css" rel="stylesheet" />
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


                    <!-- Modal Search Start -->
                    <jsp:include page="../layout/banner.jsp" />
                    <!-- Modal Search End -->


                    <!-- Featurs Section Start -->
                    <jsp:include page="../layout/feature.jsp" />
                    <!-- Featurs Section End -->

                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="tab-class text-center">
                                <div class="row g-4">
                                    <div class="col-lg-4 text-start">
                                        <h1>Our Products</h1>
                                    </div>
                                    <div class="col-lg-8 text-end">
                                        <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                            <li class="nav-item">
                                                <a class="d-flex m-2 py-2 bg-light rounded-pill active"
                                                    data-bs-toggle="pill" href="#tab-1">
                                                    <span class="text-dark" style="width: 130px;">All Products</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <c:forEach items="${Product}" var="productList">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <a href="/product/${productList.id}">
                                                                <div class="rounded position-relative fruite-item">
                                                                    <div class="fruite-img">
                                                                        <img src="images/product/${productList.image}"
                                                                            class="img-fluid w-100 rounded-top" alt="">
                                                                    </div>
                                                                    <div
                                                                        class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                        <!-- <a href="/product/${productList.id}"> -->
                                                                        <h4
                                                                            style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; height: 57.6px;">
                                                                            ${productList.name}</h4>
                                                                        <p>${productList.shortDesc}</p>
                                                                        <div class="text-center">
                                                                            <p
                                                                                class="text-dark fs-5 fw-bold mb-2 d-inline-block">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${productList.price}" /> đ
                                                                            </p>
                                                                            <br />
                                                                            <form action="/product/${productList.id}"
                                                                                method="POST">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}" />
                                                                                <button href="#"
                                                                                    class="btn border border-secondary rounded-pill px-3 text-primary d-inline-block">
                                                                                    <i
                                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                    Add to cart
                                                                                </button>
                                                                            </form>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fruits Shop End-->

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