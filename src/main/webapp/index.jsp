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
<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 font-weight-normal">Pagina de socializare</h1>
        <p class="lead font-weight-normal">Aici poti interactiona cu cine vrei tu</p>
        <a class="btn btn-outline-secondary" href="#">Inregistrare</a>
    </div>
    <div class="box-shadow d-none d-md-block">
        img
    </div>
    <div class="product-device-2 box-shadow d-none d-md-block"></div>
</div>
<jsp:include page="common/footer.jsp"/>
</body>
</html>
