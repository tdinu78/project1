<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <link href="${contextPath}/resources/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md fixed-top bg-white border-bottom box-shadow">
        <a class="navbar-brand" href="#"><img src="${contextPath}/resources/img/site_logo_1.png" height="30px"
                                              class="img-responsive"></a>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <form class="form-inline mt-2 mt-md-0 ml-auto">
                <input class="form-control-sm" type="text" placeholder="Cauta" aria-label="Search">
                <input type="image" src="${contextPath}/resources/img/search_1.png" height="25px" alt="Submit"
                       class="img-responsive" title="Cauta"/>
            </form>
            <ul class="navbar-nav ml-0">
                <li class="nav-item active">
                    <a class="nav-link text-primary" href="#">
                        <input type="image" src="${contextPath}/resources/img/message_1.png" height="25px" alt="Submit"
                                                                     class="img-responsive" title="Mesaje"/>
                        <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-primary" href="#">
                        <input type="image" src="${contextPath}/resources/img/favourites_1.png" height="25px" alt="Submit"
                                                                     class="img-responsive" title="Favorite"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link p-2 text-primary" href="#">Contul meu</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4">Pricing</h1>
    <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It's built with default Bootstrap components and utilities with little customization.</p>
</div>
<div class="container">

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-block btn-primary" type="submit">Log In</button>
            <a class="p-2 text-primary" href="${contextPath}/registration">Create an account</a>
        </div>

    </form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
</body>
</html>
