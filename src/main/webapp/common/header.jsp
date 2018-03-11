<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="locale" value="${pageContext.response.locale}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="${contextPath}/resources/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/fontawesome-free-5.0.8/web-fonts-with-css/css/fontawesome-all.min.css" rel="stylesheet">
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
        <a class="navbar-brand" href="${contextPath}/"><img src="${contextPath}/resources/img/site_logo_1.png" height="30px"
                                              class=""></a>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form class="form-inline mt-2 mt-md-0 ml-auto mr-2">
                    <input class="form-control-sm" type="text" placeholder="Cauta" aria-label="Search">
                    <input type="image" src="${contextPath}/resources/img/search_1.png" height="25px" alt="Submit"
                           class="img-responsive" title="Cauta"/>
                </form>
                <ul class="navbar-nav ml-0">
                        <li>
                            <a class="nav-link text-primary" href="#">
                                <input type="image" src="${contextPath}/resources/img/message_1.png" height="25px" alt="Submit"
                                                                             class="img-responsive" title="Mesaje"/>
                                <span class="sr-only">(current)</span></a>
                        </li>
                        <li>
                            <a class="nav-link text-primary" href="#">
                                <input type="image" src="${contextPath}/resources/img/favourites_1.png" height="25px" alt="Submit"
                                                                             class="img-responsive" title="Favorite"/></a>
                        </li>
                </ul>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <li class="dropdown ml-auto mr-2" style="list-style: none">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="ml-2 m-r-sm fas fa-user"></i><span><spring:message code="header.myAccount"/></span><span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${contextPath}/login"><i class="ml-2 m-r-sm fas fa-sign-in-alt"></i><span><spring:message code="header.login"/></span></a></li>
                        <li><a href="${contextPath}/registration"><i class="ml-2 m-r-sm fas fa-edit"></i><span><spring:message code="header.signup"/></span></a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <li class="dropdown" style="list-style: none">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><img src="" alt="..." class="img-thumbnail icon-small"><span>${pageContext.request.userPrincipal.name}</span><span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="?lang=en"><i class="ml-2 m-r-sm fas fa-user"></i><span><spring:message code="header.myProfile"/></span></a></li>
                        <li><a href="?lang=en"><i class="ml-2 m-r-sm fas fa-cog"></i><span><spring:message code="header.mySettings"/></span></a></li>
                        <li><a href="#" onclick="document.forms['logoutForm'].submit()" class="language"><i class="ml-2 fas fa-sign-out-alt m-r-sm"></i><span><spring:message code="header.logout"/></span></a></li>
                    </ul>
                </li>
            </c:if>
            <li class="dropdown ml-4 mr-2" style="list-style: none">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><img id="imgNavSel" src="" alt="..." class="img-thumbnail icon-small"><span id="lanNavSel">${locale}</span><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a id="navEng" href="?lang=en"><img id="imgNavEng" height="25px" src="" alt="..." class="img-thumbnail icon-small"><span id="lanNavEng"><spring:message code="lang.eng"/></span></a></li>
                    <li><a id="navRom" href="?lang=ro"><img id="imgNavRom" height="25px" src="" alt="..." class="img-thumbnail icon-small"><span id="lanNavRom"><spring:message code="lang.rom"/></span></a></li>
                </ul>
            </li>
        </div>
    </nav>
</header>
<div class="pb-5 mb-3"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${contextPath}/resources/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/fontawesome-free-5.0.8/svg-with-js/js/fontawesome-all.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        var romImgLink = "${contextPath}/resources/img/flag-of-Romania.png";
        var engImgLink = "${contextPath}/resources/img/flag-of-United-Kingdom.png";

        var imgNavSel = $('#imgNavSel');
        var imgNavEng = $('#imgNavEng');
        var imgNavRom = $('#imgNavRom');

        var spanNavSel = $('#lanNavSel');
        if(spanNavSel.text()=="ro"){
            spanNavSel.text("<spring:message code="lang.rom"/>");
            imgNavSel.attr("src",romImgLink);
        }else if(spanNavSel.text()=="en"){
            spanNavSel.text("<spring:message code="lang.eng"/>");
            imgNavSel.attr("src",engImgLink);
        }
        imgNavRom.attr("src",romImgLink);
        imgNavEng.attr("src",engImgLink);

        $( ".language" ).on( "click", function( event ) {
            var currentId = $(this).attr('id');

            if(currentId == "navRom") {
                imgNavSel.attr("src",romImgLink);
                spanNavSel.text("<spring:message code="lang.eng"/>");
            } else if (currentId == "navEng") {
                imgNavSel.attr("src", engImgLink);
                spanNavSel.text("<spring:message code="lang.rom"/>");
            }
        });
    });
</script>
</body>
</html>
