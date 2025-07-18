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

                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="tab-class text-center">
                                <div class="row g-4">

                                </div>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4">
                                            <div class="col-lg-4 text-start">
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4>Brand</h4>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">DELL</label>
                                                        </div>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">ASUS</label>
                                                        </div>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">LENOVO</label>
                                                        </div>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">MACBOOK</label>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <h4>Intended use</h4>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">GAMING</label>
                                                        </div>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">STUDENT</label>
                                                        </div>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">WORKER</label>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <h4>Cost</h4>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">Under 10 </label>
                                                        </div>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">From 10 to 20</label>
                                                        </div>
                                                        <div class="mb-2 d-inline">
                                                            <input type="checkbox" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1">From 20 to 30</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <h4>Sort</h4>
                                                    <div class="mb-2 d-inline">
                                                        <input type="radio" class="me-2" id="Categories-1"
                                                            name="Categories-1" value="Beverages">
                                                        <label for="Categories-1">Ascending</label>
                                                    </div>
                                                    <div class="mb-2 d-inline">
                                                        <input type="radio" class="me-2" id="Categories-1"
                                                            name="Categories-1" value="Beverages">
                                                        <label for="Categories-1">Descending</label>
                                                    </div>
                                                </div>
                                                <button
                                                    class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i>Check</button>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="row g-4">
                                                    <c:forEach items="${prodList}" var="productList">
                                                        <div class="col-md-6 col-lg-4 col-xl-4">
                                                            <a href="/product/${productList.id}">
                                                                <div class="rounded position-relative fruite-item">
                                                                    <div class="fruite-img">
                                                                        <img src="images/product/${productList.image}"
                                                                            class="img-fluid w-100 rounded-top" alt="">
                                                                    </div>
                                                                    <div
                                                                        class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                        <h4
                                                                            style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;height: 52.6px;font-size: larger;">
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
                                                    <div class="pagination d-flex justify-content-center mt-5">
                                                        <li
                                                            class="${currentPage eq 0? 'page-item disabled':'page-item'}">
                                                            <a href="/product?page=${currentPage-1}"
                                                                class="page-link">«</a>
                                                        </li>
                                                        <c:forEach begin="0" end="${totalPages}" varStatus="status">
                                                            <li
                                                                class="${currentPage eq status.index? 'page-item active':'page-item'}">
                                                                <a class="page-link"
                                                                    href="/product?page=${status.index}">${status.index
                                                                    + 1}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <li
                                                            class="${currentPage eq totalPages? 'page-item disabled':'page-item'}">
                                                            <a href="/product?page=${currentPage+1}"
                                                                class="page-link">»</a>
                                                        </li>
                                                    </div>
                                                </div>
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