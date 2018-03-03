<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<footer class="text-muted border-top bg-white box-shadow">
    <div class="container-fluid">
        <div>
            <p>Acest site foloseste cookie-uri pentru a ajuta la imbunatatirea experientei si functionalitatii.
            Continuand, iti exprimi acordul asupra folosirii cookie-urilor.
            <a href="http://www.3xmedia.ro/cookies.html" target="_blank">Afla detalii despre.</a>
            <a class="ajax nette-cookie-bar-button" href="/?do=cookieBar-HideBlock">Sunt de acord.</a>
            </p>
        </div>
        <noscript><style>.nette-cookie-bar { display: none; }</style></noscript>
        <p>Este ceva ce nu funcționeaza? Daca ai intimpinat vreo eroare,
            <a href="/report/">te rugam sa ne informezi aici.</a></p>
        <p><a href="/termeni/">Condiții generale pentru utilizator</a> &nbsp
            <a href="/contact/">Contactați-ne!</a> &nbsp
            <a href="/politica_confidentialitate/">politica de confidentialitate</a></p>
        <p class="copyright">2018 © Copyright Site.ro toate drepturile rezervate Site SRL Ploiesti Str. Domnisori,
            Bl 63, Sc. A, Ap. 8</p>
        <a href="#" class="jump-to footer-top-link" data-where="body" data-offset="-56"></a>
    </div>
</footer>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
</body>
</html>
