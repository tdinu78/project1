<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="locale" value="${pageContext.response.locale}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profilul meu</title>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<link href="${contextPath}/resources/bootstrap-fileinput-master/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/fileinput.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/themes/fa/theme.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/locales/${locale}.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" type="text/javascript"></script>
<div class="container mt-5">
    <form action="${contextPath}/upload" method="post" enctype="multipart/form-data">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Pictures</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Detailed Profile</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="col-sm-4 text-center">
                    <div class="kv-avatar">
                        <div class="file-loading">
                            <input id="avatar-1" name="avatar-1" type="file" required>
                        </div>
                    </div>
                    <div class="kv-avatar-hint"><small><spring:message code="registration.picSize"/></small></div>
                </div>
                <div id="kv-avatar-errors-1" class="center-block" style="width:800px;display:none"></div>
                <div class="form-group">
                    <div class="file-loading">
                        <label>Preview File Icon</label>
                        <input id="file-1" type="file" multiple>
                    </div>
                </div>
                <div id="kv-avatar-errors-2" class="center-block" style="width:800px;display:none"></div>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
        </div>
    </form>
</div>
<jsp:include page="common/footer.jsp"/>
<script type="text/javascript">
    $("#avatar-1").fileinput({
        theme: 'fa',
        language: '${locale}',
        overwriteInitial: true,
        maxFileSize: 1500,
        showClose: false,
        showCaption: false,
        showUpload: false,
        browseLabel: '',
        removeLabel: '',
        uploadUrl: '${contextPath}/upload',
        browseIcon: '<i class="fa fa-folder-open"></i>',
        removeIcon: '<i class="fa fa-trash-alt"></i>',
        removeTitle: '<spring:message code="registration.resetChanges"/>',
        elErrorContainer: '#kv-avatar-errors-1',
        msgErrorClass: 'alert alert-block alert-danger',
        defaultPreviewContent: '<img src="${contextPath}/resources/img/default_avatar_male.jpg" alt="Your Avatar">',
        layoutTemplates: {main2: '{preview} {remove} {browse}'},
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
    $("#file-1").fileinput({
        theme: 'fa',
        language: '${locale}',
        showClose: false,
        showCaption: false,
        showUpload: false,
        browseLabel: '',
        removeLabel: '',
        uploadUrl: '${contextPath}/upload',
        browseIcon: '<i class="fa fa-folder-open"></i>',
        removeIcon: '<i class="fa fa-trash-alt"></i>',
        elErrorContainer: '#kv-avatar-errors-2',
        msgErrorClass: 'alert alert-block alert-danger',
        allowedFileExtensions: ["jpg", "png", "gif"],
        removeTitle: '<spring:message code="registration.resetChanges"/>',
        defaultPreviewContent: '<img src="${contextPath}/resources/img/default_avatar_male.jpg" alt="Your Avatar"><img src="${contextPath}/resources/img/default_avatar_male.jpg" alt="Your Avatar"><img src="${contextPath}/resources/img/default_avatar_male.jpg" alt="Your Avatar">',
        overwriteInitial: true,
        layoutTemplates: {main2: '{preview} {remove} {browse}'}
    });
</script>
</body>
</html>
