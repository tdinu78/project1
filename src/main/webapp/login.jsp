<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Log in with your account</title>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<div class="container">
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <div class="row ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <div class="main">
                <h3>Please Log In, or <a href="${contextPath}/registration">Sign Up</a></h3>
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <a href="#" class="btn btn-lg btn-info btn-block">Google</a>
                    </div>
                </div>
                <div class="login-or">
                    <hr class="hr-or">
                    <span class="span-or">or</span>
                </div>

                <form role="form">
                    <div class="form-group">
                        <label for="username">Username or email</label>
                        <input name="username" type="text" class="form-control" placeholder="Username"
                               autofocus="true" id="username"/>
                    </div>
                    <div class="form-group">
                        <a class="float-right" href="#">Forgot password?</a>
                        <label for="inputPassword">Password</label>
                        <input name="password" id="inputPassword" type="password" class="form-control" placeholder="Password"/>
                        <span>${error}</span>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </div>
                    <div class="checkbox pull-right">
                        <label>
                            <input type="checkbox">
                            Remember me </label>
                    </div>
                    <button type="submit" class="btn btn btn-primary">
                        Log In
                    </button>
                </form>
            </div>
        </div>
    </form>
</div>
<jsp:include page="common/footer.jsp"/>
</body>
</html>
