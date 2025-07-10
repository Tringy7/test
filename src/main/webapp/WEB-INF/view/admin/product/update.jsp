<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>\
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
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                        <script>
                            $(document).ready(() => {
                                const imgFile = "${product.image}";
                                const imageFile = $("#imageFile");
                                if (imgFile) {
                                    const urlImage = "/images/product/" + imgFile;
                                    $("#imagePreview").attr("src", urlImage);
                                    $("#imagePreview").css({ "display": "block" });
                                }
                                imageFile.change(function (e) {
                                    const imgURL = URL.createObjectURL(e.target.files[0]);
                                    $("#imagePreview").attr("src", imgURL);
                                    $("#imagePreview").css({ "display": "block" });
                                });
                            });
                        </script>
                    </head>

                    <body class="sb-nav-fixed">
                        <jsp:include page="../layout/header.jsp" />
                        <div id="layoutSidenav">
                            <jsp:include page="../layout/navbar.jsp" />
                            <div id="layoutSidenav_content">
                                <main>
                                    <div class="container-fluid px-4">
                                        <h1 class="mt-4">Update</h1>
                                        <div class="row d-inline">
                                            <a href="/admin">Dashboard</a>/
                                            <a href="/admin/product">Product</a>/
                                            <a href="#">Update</a>
                                        </div>
                                        </ol>
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <form:form action="/admin/product/update/${product.id}" method="POST"
                                                    modelAttribute="product" enctype="multipart/form-data">
                                                    <h3 class="mt-4">Update Product ${product.name}</h3>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="mb-3 col">
                                                            <c:set var="nameHasBindError">
                                                                <form:errors path="name" />
                                                            </c:set>
                                                            <label for="name" class="form-label">Name</label>
                                                            <form:input type="text"
                                                                class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                                path="name" />
                                                            <form:errors path="name" cssClass="invalid-feedback" />
                                                        </div>
                                                        <div class="mb-3 col">
                                                            <c:set var="nameHasBindError">
                                                                <form:errors path="price" />
                                                            </c:set>
                                                            <label for="price" class="form-label">Price</label>
                                                            <form:input type="number"
                                                                class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                                path="price" />
                                                            <form:errors path="price" cssClass="invalid-feedback" />
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="mb-3 col">
                                                            <label class="form-label">Detail description</label>
                                                            <div class="input-group">
                                                                <form:textarea path="detailDesc" class="form-control"
                                                                    aria-label="With textarea" rows="5" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="mb-3 col">
                                                            <label class="form-label">Short description</label>
                                                            <form:input path="shortDesc" type="text"
                                                                class="form-control" />
                                                        </div>
                                                        <div class="mb-3 col">
                                                            <c:set var="nameHasBindError">
                                                                <form:errors path="quantity" />
                                                            </c:set>
                                                            <label class="form-label">Quantity</label>
                                                            <form:input type="number"
                                                                class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                                path="quantity" />
                                                            <form:errors path="quantity" cssClass="invalid-feedback" />
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="mb-3 col">
                                                            <label class="form-label">Factory</label>
                                                            <form:select path="factory" class="form-select"
                                                                aria-label=".form-select-sm example">
                                                                <form:option value="DELL">DELL</form:option>
                                                                <form:option value="ASUS">ASUS</form:option>
                                                                <form:option value="ACER">ACER</form:option>
                                                                <form:option value="VIVO">VIVO</form:option>
                                                                <form:option value="RAZER">RAZER</form:option>
                                                                <form:option value="MACBOOK">MACBOOK</form:option>
                                                                <form:option value="LENOVO">LENOVO</form:option>
                                                            </form:select>
                                                        </div>
                                                        <div class="mb-3 col">
                                                            <label class="form-label">Target</label>
                                                            <form:select path="target" class="form-select"
                                                                aria-label=".form-select-sm example">
                                                                <form:option value="GAMING">GAMING</form:option>
                                                                <form:option value="STUDENT">STUDENT</form:option>
                                                                <form:option value="WORKER">WORKER</form:option>
                                                            </form:select>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="mb-3 col">
                                                            <label class="form-label">Image</label>
                                                            <input class="form-control" id="imageFile" type="file"
                                                                name="fileImage" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <img src="" alt="" style="max-height: 250px; display: none;"
                                                            id="imagePreview">
                                                    </div>

                                                    <button type="submit" class="btn btn-warning mt-3">Submit</button>
                                                </form:form>
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
                        <script
                            src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                            crossorigin="anonymous"></script>
                    </body>

                    </html>