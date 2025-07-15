<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>User</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
          rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
            crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/navbar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manage Order</h1>
                <div class="row d-inline">
                    <a href="/admin">Dashboard</a>/
                    <a href="/admin/order">Order</a>/
                    <a href="#">Detail</a>
                </div>
                </ol>
                <div class="row">
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
                                <c:when test="${empty orderDetailList}">
                                    <tr>
                                        <td colspan="6" class="text-center py-4">
                                            No product in cart
                                        </td>
                                    </tr>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach items="${orderDetailList}" var="orderDetai" varStatus="status">
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="/images/product/${orderDetai.product.image}"
                                                         class="img-fluid me-5 rounded-circle"
                                                         style="width: 80px; height: 80px;" alt="">
                                                </div>
                                            </th>
                                            <td>
                                                <a href="/product/${orderDetai.product.id}"
                                                   class="position-relative me-4 my-auto">
                                                    <p class="mb-0 mt-4">${orderDetai.product.name}
                                                    </p>
                                                </a>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <fmt:formatNumber type="number"
                                                                      value="${orderDetai.product.price}"/>
                                                </p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4"
                                                     style="width: 100px;">
                                                    <input type="text"
                                                           class="form-control form-control-sm text-center border-0"
                                                           value="${orderDetai.quantity}"/>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <fmt:formatNumber type="number"
                                                                      value="${orderDetai.product.price * orderDetai.quantity}"/>
                                                    đ
                                                </p>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            </tbody>
                        </table>
                        <a href="/admin/order" class="btn btn-success mt-3">Back</a>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
</body>

</html>