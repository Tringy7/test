<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>User</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script>
                $(document).ready(() => {
                    const avatarFile = $("#avatarFile");
                    avatarFile.change(function (e) {
                        const imgURL = URL.createObjectURL(e.target.files[0]);
                        $("#avatarPreview").attr("src", imgURL);
                        $("#avatarPreview").css({ "display": "block" });
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
                            <h1 class="mt-4"></h1>
                            </ol>
                            <div class="row">
                                <div class="col-md-6 col-12 mx-auto">
                                    <form:form action="/admin/user/create" method="POST" modelAttribute="user"
                                        enctype="multipart/form-data">
                                        <h3 class="mt-4">Create User</h3>
                                        <hr>
                                        <div class="row">
                                            <div class="mb-3 col">
                                                <label for="email" class="form-label">Email address</label>
                                                <form:input path="email" type="email" class="form-control" id="email" />
                                            </div>

                                            <div class="mb-3 col">
                                                <label for="password" class="form-label">Password</label>
                                                <form:input path="password" type="password" class="form-control"
                                                    id="password" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3 col">
                                                <label for="phone" class="form-label">Phone Number</label>
                                                <form:input path="phone" type="text" class="form-control" id="phone" />
                                            </div>
                                            <div class="mb-3 col">
                                                <label for="fullName" class="form-label">Full name</label>
                                                <form:input path="fullName" type="text" class="form-control"
                                                    id="fullName" />
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="address" class="form-label">Address</label>
                                            <form:input path="address" type="text" class="form-control" id="address" />
                                        </div>

                                        <div class="row">
                                            <div class="mb-3 col">
                                                <label for="role" class="form-label">Role</label>
                                                <form:select path="role.id" class="form-select"
                                                    aria-label=".form-select-sm example">
                                                    <form:option value="1">ADMIN</form:option>
                                                    <form:option value="2">USER</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col">
                                                <label for="avatar" class="form-label">Avatar</label>
                                                <input path="avatar" class="form-control" type="file" id="avatarFile"
                                                    name="fileImage" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <img src="" alt="" style="max-height: 250px; display: none;"
                                                id="avatarPreview">
                                        </div>

                                        <button type="submit" class="btn btn-primary mt-3">Submit</button>
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
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
        </body>

        </html>