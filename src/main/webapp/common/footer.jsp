<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<%--<div class="cookie-bar">--%>
    <%--Acest site foloseste cookie-uri pentru a ajuta la imbunatatirea experientei si functionalitatii. Continuand, iti exprimi acordul asupra folosirii cookie-urilor.--%>
    <%--<a href="http://www.3xmedia.ro/cookies.html" target="_blank">Afla detalii despre.</a>--%>
    <%--<a href="/prihlaseni/?do=cookieBar-HideBlock">Sunt de acord.</a>--%>
<%--</div>--%>
<footer class="footer font-small pt-4 mt-4 border-top bg-white box-shadow">
    <div class="container-fluid text-center">
        <p>Este ceva ce nu functioneaza? Daca ai intimpinat vreo eroare,
            <a href="/report/">te rugam sa ne informezi aici.</a></p>
        <p><a href="/termeni/">Conditii generale pentru utilizator</a> &nbsp
            <a href="/contact/">Contactati-ne!</a> &nbsp
            <a href="/politica_confidentialitate/">politica de confidentialitate</a></p>
    </div>
        <div class="footer-copyright text-center">
            <div class="container-fluid"> 2018 Copyright: Site.ro toate drepturile rezervate Site SRL Ploiesti Str. Domnisori,
                Bl 63, Sc. A, Ap. 8
            </div>
        </div>
</footer>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
</body>
</html>
