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
                                        <a href="#">Product</a>
                                    </div>
                                    </ol>
                                    <div class="row">
                                        <div class="col-12 mx-auto mt-4">
                                            <div class="d-flex justify-content-between">
                                                <h3>Table Product</h3>
                                                <a href="/admin/product/create" class="btn btn-primary">Create new
                                                    product</a>
                                            </div>
                                            <table class="table table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Factory</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${Product}" var="productList" varStatus="loop">
                                                        <tr>
                                                            <td>${loop.index + 1}</td>
                                                            <td>${productList.name}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${productList.price}" /> đ
                                                            </td>
                                                            <td>${productList.factory}</td>
                                                            <td>
                                                                <a href="/admin/product/${productList.id}"
                                                                    class="btn btn-primary">View</a>
                                                                <a href="/admin/product/update/${productList.id}"
                                                                    class="btn btn-warning">Update</a>
                                                                <a href="/admin/product/delete/${productList.id}"
                                                                    class="btn btn-danger">Delete</a>
                                                            </td>

                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <div>
                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <li
                                                            class="${currentPage eq 0? 'page-item disabled':'page-item'}">
                                                        <a class="page-link" href="/admin/product?page=${currentPage-1}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                        <c:forEach begin="0" end="${totalPages}" varStatus="status">
                                                            <li
                                                                class="${currentPage eq status.index? 'page-item active':'page-item'}">
                                                                <a class="page-link"
                                                                    href="/admin/product?page=${status.index}">${status.index
                                                                    + 1}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <li
                                                            class="${currentPage eq totalPages? 'page-item disabled':'page-item'}">
                                                            <a class="page-link" href="/admin/product?page=${currentPage+1}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
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