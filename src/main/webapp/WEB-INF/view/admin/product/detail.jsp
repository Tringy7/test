<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>User</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            const avatarFile = "${detailProduct.image}";
            if (avatarFile) {
                const urlImage = "/images/product/" + avatarFile;
                $("#avatarPreview").attr("src", urlImage);
                $("#avatarPreview").css({"display": "block"});
                console.log($("#avatarPreview").attr("src"));
            }
        });
    </script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/navbar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Detail</h1>
                <div class="row d-inline">
                    <a href="/admin">Dashboard</a>/
                    <a href="/admin/product">Product</a>/
                    <a href="#">Detail</a>
                </div>
                </ol>
                <div class="row">
                    <div class="col-12 mx-auto">
                        <div class="d-flex justify-content-between">
                            <h3 class="mt-4">User Detail name ${detailProduct.name}</h3>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                User Detail
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <img src="" alt="" style="max-height: 250px; display: none;"
                                         id="avatarPreview">
                                </li>
                                <li class="list-group-item">${detailProduct.name}</li>
                                <li class="list-group-item">${detailProduct.price}</li>
                                <li class="list-group-item">${detailProduct.detailDesc}</li>
                                <li class="list-group-item">${detailProduct.shortDesc}</li>
                                <li class="list-group-item">${detailProduct.quantity}</li>
                                <li class="list-group-item">${detailProduct.sold}</li>
                                <li class="list-group-item">${detailProduct.factory}</li>
                                <li class="list-group-item">${detailProduct.target}</li>
                            </ul>
                        </div>
                        <a href="/admin/product" class="btn btn-success mt-3">Back</a>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
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