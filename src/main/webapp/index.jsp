<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Autentificare</title>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<div class="position-relative overflow-hidden text-center bg-light">
    <div class="box-shadow ce">
        <img src="${contextPath}/resources/img/index_1.jpg" style="width: 100%;" height="650px"
             class="img-fluid">
        <div class="col-md-5 p-lg-5 mx-auto my-5 img-mdl">
            <h1 class="display-4 font-weight-normal">Pagina de socializare</h1>
            <p class="lead font-weight-normal">Aici poti interactiona cu cine vrei tu</p>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <div>
                    <a class="btn btn-outline-secondary" href="${contextPath}/registration"><spring:message code="header.signup"/></a>
                    <a class="btn btn-outline-primary" href="${contextPath}/login"><spring:message code="header.login"/></a>
                </div>
            </c:if>
        </div>
    </div>
</div>
<div class="container marketing">
    <div class="row">
        <div class="col-sm-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="50" height="50">
            <h2>Heading</h2>
        </div>
        <div class="col-sm-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="50" height="50">
            <h2>Heading</h2>
        </div><!-- /.col-lg-4 -->
        <div class="col-sm-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="50" height="50">
            <h2>Heading</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="50" height="50">
            <h2>Heading</h2>
        </div>
        <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="50" height="50">
            <h2>Heading</h2>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="50" height="50">
            <h2>Heading</h2>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"/>
</body>
</html>
