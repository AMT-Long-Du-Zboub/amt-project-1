<%--
  Created by IntelliJ IDEA.
  User: dacoj
  Date: 23.09.2020
  Time: 09:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/assets/img/apple-icon.png"/>" />
    <link rel="icon" type="image/png" href="<c:url value="/assets/img/favicon.png"/>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        HomePage
    </title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="<c:url value="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>" />
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />" />
    <!-- CSS Files -->
    <link href="<c:url value="/assets/css/material-kit.css?v=2.0.7" />" rel="stylesheet"  />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="<c:url value="/assets/demo/demo.css"/>" rel="stylesheet" />
</head>

<body class="profile-page sidebar-collapse">

<!-- Inclusion du header sur le haut de page -->
<jsp:include page="fragments/header.jsp" flush="true"/>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('../assets/img/city-profile.jpg');"></div>
<div class="main main-raised">
    <div class="profile-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ml-auto mr-auto">
                    <div class="profile">
                        <div class="avatar">
                            <img src="../assets/img/faces/christian.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
                        </div>
                        <div class="name">
                            <h3 class="title">Christian Louboutin</h3>
                            <h6>Designer</h6>
                            <a href="#pablo" class="btn btn-just-icon btn-link btn-dribbble"><i class="fa fa-dribbble"></i></a>
                            <a href="#pablo" class="btn btn-just-icon btn-link btn-twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#pablo" class="btn btn-just-icon btn-link btn-pinterest"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="description text-center">
                <p>An artist of considerable range, Chet Faker &#x2014; the name taken by Melbourne-raised, Brooklyn-based Nick Murphy &#x2014; writes, performs and records all of his own music, giving it a warm, intimate feel with a solid groove structure. </p>
            </div>
            <div class="row">
                <div class="col-md-6 ml-auto mr-auto">
                    <div class="profile-tabs">
                        <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" href="#studio" role="tab" data-toggle="tab">
                                    <i class="material-icons">camera</i> Studio
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#works" role="tab" data-toggle="tab">
                                    <i class="material-icons">palette</i> Work
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#favorite" role="tab" data-toggle="tab">
                                    <i class="material-icons">favorite</i> Favorite
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tab-content tab-space">
                <div class="tab-pane active text-center gallery" id="studio">
                    <div class="row">
                        <div class="col-md-3 ml-auto">
                            <img src="../assets/img/examples/studio-1.jpg" class="rounded">
                            <img src="../assets/img/examples/studio-2.jpg" class="rounded">
                        </div>
                        <div class="col-md-3 mr-auto">
                            <img src="../assets/img/examples/studio-5.jpg" class="rounded">
                            <img src="../assets/img/examples/studio-4.jpg" class="rounded">
                        </div>
                    </div>
                </div>
                <div class="tab-pane text-center gallery" id="works">
                    <div class="row">
                        <div class="col-md-3 ml-auto">
                            <img src="../assets/img/examples/olu-eletu.jpg" class="rounded">
                            <img src="../assets/img/examples/clem-onojeghuo.jpg" class="rounded">
                            <img src="../assets/img/examples/cynthia-del-rio.jpg" class="rounded">
                        </div>
                        <div class="col-md-3 mr-auto">
                            <img src="../assets/img/examples/mariya-georgieva.jpg" class="rounded">
                            <img src="../assets/img/examples/clem-onojegaw.jpg" class="rounded">
                        </div>
                    </div>
                </div>
                <div class="tab-pane text-center gallery" id="favorite">
                    <div class="row">
                        <div class="col-md-3 ml-auto">
                            <img src="../assets/img/examples/mariya-georgieva.jpg" class="rounded">
                            <img src="../assets/img/examples/studio-3.jpg" class="rounded">
                        </div>
                        <div class="col-md-3 mr-auto">
                            <img src="../assets/img/examples/clem-onojeghuo.jpg" class="rounded">
                            <img src="../assets/img/examples/olu-eletu.jpg" class="rounded">
                            <img src="../assets/img/examples/studio-1.jpg" class="rounded">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Inclusion du home content dans la page -->
<jsp:include page="fragments/home_content.jsp" flush="true"/>

<!-- Inclusion du footer sur le pied de page -->
<jsp:include page="fragments/footer.jsp" flush="true"/>

<!--   Core JS Files   -->
<script src="<c:url value="/assets/js/core/jquery.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/assets/js/core/popper.min.js"  />" type="text/javascript"></script>
<script src="<c:url value="/assets/js/core/bootstrap-material-design.min.js"  />" type="text/javascript"></script>
<script src="<c:url value="/assets/js/plugins/moment.min.js"/>"></script>
<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="<c:url value="/assets/js/plugins/bootstrap-datetimepicker.js" />" type="text/javascript"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="<c:url value="/assets/js/plugins/nouislider.min.js" />" type="text/javascript"></script>
<!--  Google Maps Plugin    -->
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="<c:url value="/assets/js/material-kit.js?v=2.0.7" />" type="text/javascript"></script>
</body>