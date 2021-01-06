<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--
    Upper Template
    http://www.templatemo.com/tm-497-upper
    -->
    <!-- load stylesheets -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <!-- Google web font "Open Sans" -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.5.0/css/font-awesome.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- Bootstrap style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hero-slider-style.css">
    <!-- Hero slider style (https://codyhouse.co/gem/hero-slider/) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <!-- Magnific popup style (http://dimsemenov.com/plugins/magnific-popup/) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
    <!-- Templatemo style -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Shop&Cook</title>

</head>
<body>

<!-- Content -->
<div class="cd-hero">

    <!-- Navigation -->
    <div class="cd-slider-nav">
        <nav class="navbar">
            <div class="tm-navbar-bg">

                <a class="navbar-brand text-uppercase" href="${pageContext.request.contextPath}/"><i
                        class="fa fa-list-ul tm-brand-icon"></i>Shop&Cook</a>

                <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse"
                        data-target="#tmNavbar">
                    &#9776;
                </button>
                <div class="collapse navbar-toggleable-md text-xs-center text-uppercase tm-navbar" id="tmNavbar">
                    <ul class="nav navbar-nav">
                        <div class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/user/home">Moje listy</a>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/recipe/all">Przepisy</a>
                        </div>
                        <div class="nav-item">
                            <sec:authorize access="isAuthenticated()">
                                <form class="nav-link" action="<c:url value="/logout"/>" method="post">
                                    <input class="nav-link" type="submit" value="Wyloguj">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                            </sec:authorize>
                        </div>
                    </ul>
                </div>
            </div>

        </nav>
    </div>