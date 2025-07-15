<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
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
<jsp:include page="../layout/header.jsp"/>
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
                        <c:forEach items="${cartDetail}" var="cartDetailList" varStatus="status">
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
                                                          value="${cartDetailList.product.price}"/>
                                    </p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4"
                                         style="width: 100px;">
                                        <input type="text"
                                               class="form-control form-control-sm text-center border-0"
                                               value="${cartDetailList.quantity}"/>
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4" cartdetail-id="${cartDetailList.id}">
                                        <fmt:formatNumber type="number"
                                                          value="${cartDetailList.price * cartDetailList.quantity}"/>
                                        đ
                                    </p>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

                </tbody>
            </table>
        </div>
        <form action="/checkout" method="POST" class="">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <div class="row g-4">
                <div class="col-8">
                    <input name="receiverName" type="text" class="w-100 form-control border-0 py-3 mb-4"
                           placeholder="Receiver Name">
                    <input name="receiverAddress" type="email" class="w-100 form-control border-0 py-3 mb-4"
                           placeholder="Receiver Address">
                    <input name="receiverPhone" type="text" class="w-100 form-control border-0 py-3 mb-4"
                           placeholder="Receiver Phone">
                    <a href="/cart" class="position-relative me-4 my-auto">
                        <div class="fs-4 mb-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0z"></path>
                                <path fill-rule="evenodd"
                                      d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708z"></path>
                            </svg>
                            <p class="mb-0 mt-4 d-inline">Cart
                            </p>
                        </div>
                    </a>

                </div>
                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                    <div class="bg-light rounded">
                        <div class="p-4">
                            <h1 class="display-6 mb-4">Cart <span class="fw-normal">CheckOut</span></h1>
                            <div class="d-flex justify-content-between mb-4">
                                <h5 class="mb-0 me-4">Subtotal:</h5>
                                <p class="mb-0" cartdetail-totalPrice="${totalPrice}">
                                    <fmt:formatNumber type="number" value="${totalPrice}"/> đ
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
                                <fmt:formatNumber type="number" value="${totalPrice}"/> đ
                            </p>
                        </div>
                        <button
                                class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                type="submit">Proceed Checkout
                        </button>
                    </div>
                </div>
            </div>
        </form>
        <div>


        </div>
    </div>
</div>
<!-- Cart End -->

<!-- Footer Start -->
<jsp:include page="../layout/footer.jsp"/>
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