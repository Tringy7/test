<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            \
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
                                            <th scope="col">Handle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${empty cartDetail}">
                                                <tr>
                                                    <td colspan="6" class="text-center py-4">
                                                        No product in my cart
                                                    </td>
                                                </tr>
                                            </c:when>

                                            <c:otherwise>
                                                <c:forEach items="${cartDetail}" var="cartDetailList">
                                                    <c:if test="${not empty cartDetailList}">
                                                        <tr>
                                                            <th scope="row">
                                                                <div class="d-flex align-items-center">
                                                                    <img src="/images/product/${cartDetailList.product.image}"
                                                                        class="img-fluid me-5 rounded-circle"
                                                                        style="width: 80px; height: 80px;" alt="">
                                                                </div>
                                                            </th>
                                                            <td>
                                                                <a href="/product/${cartDetailList.product.id}"
                                                                    class="position-relative me-4 my-auto">
                                                                    <p class="mb-0 mt-4">${cartDetailList.product.name}
                                                                    </p>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${cartDetailList.product.price}" />
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <div class="input-group quantity mt-4"
                                                                    style="width: 100px;">
                                                                    <div class="input-group-btn">
                                                                        <button
                                                                            class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                            <i class="fa fa-minus"></i>
                                                                        </button>
                                                                    </div>
                                                                    <input type="text"
                                                                        class="form-control form-control-sm text-center border-0"
                                                                        value="${cartDetailList.quantity}"
                                                                        cartdetail-price="${cartDetailList.price}"
                                                                        cartdetail-id="${cartDetailList.id}">
                                                                    <div class="input-group-btn">
                                                                        <button
                                                                            class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                            <i class="fa fa-plus"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4"
                                                                    cartdetail-id="${cartDetailList.id}">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${cartDetailList.price * cartDetailList.quantity}" />
                                                                    đ
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <button
                                                                    class="btn btn-md rounded-circle bg-light border mt-4">
                                                                    <i class="fa fa-times text-danger"></i>
                                                                </button>
                                                            </td>

                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${empty cartDetailList}">
                                                        <p>
                                                            Not product in my cart now
                                                        </p>
                                                    </c:if>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                    </tbody>
                                </table>
                            </div>
                            <div class="mt-5">
                                <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4"
                                    placeholder="Coupon Code">
                                <button class="btn border-secondary rounded-pill px-4 py-3 text-primary"
                                    type="button">Apply Coupon
                                </button>
                            </div>
                            <div class="row g-4">
                                <div class="col-8">
                                </div>
                                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                                    <div class="bg-light rounded">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="mb-0 me-4">Subtotal:</h5>
                                                <p class="mb-0" cartdetail-totalPrice="${totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                </p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">Shipping</h5>
                                                <div class="">
                                                    <p class="mb-0">Flat rate: 0 đ</p>
                                                </div>
                                            </div>
                                            <p class="mb-0 text-end">Shipping to Ukraine.</p>
                                        </div>
                                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                            <h5 class="mb-0 ps-4 me-4">Total</h5>
                                            <p class="mb-0 pe-4" cartdetail-totalPrice="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                            </p>
                                        </div>
                                        <button
                                            class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                            type="button">Proceed Checkout
                                        </button>
                                    </div>
                                </div>
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