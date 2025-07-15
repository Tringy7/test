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
                <h1 class="mt-4">Manage Product</h1>
                <div class="row d-inline">
                    <a href="/admin">Dashboard</a>/
                    <a href="#">Order</a>
                </div>
                </ol>
                <div class="row">
                    <div class="col-12 mx-auto mt-4">
                        <div class="d-flex justify-content-between">
                            <h3>Table Product</h3>
                        </div>
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Total Price</th>
                                <th scope="col">User</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${order}" var="orderList" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>
                                        <fmt:formatNumber type="number"
                                                          value="${orderList.totalPrice}" /> đ
                                    </td>
                                    <td>${orderList.user.fullName}</td>
                                    <td>${orderList.status}</td>
                                    <td>
                                        <a href="/admin/order/${orderList.id}"
                                           class="btn btn-primary">View</a>
                                        <a href="/admin/order/update/${orderList.id}"
                                           class="btn btn-warning">Update</a>
<%--                                        <a href="/admin/order/delete/${orderList.id}"--%>
<%--                                           class="btn btn-danger">Delete</a>--%>
                                    </td>

                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
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