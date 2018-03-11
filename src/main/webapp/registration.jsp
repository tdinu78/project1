<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create an account</title>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<link href="${contextPath}/resources/bootstrap-fileinput-master/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/fileinput.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/themes/fa/theme.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" type="text/javascript"></script>
<div class="container mt-5">
<form:form method="POST" class="form-horizontal" modelAttribute="userForm" enctype="multipart/form-data">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h2>Register New User</h2>
            <hr>
        </div>
    </div>
    <div class="col-sm-4 text-center">
        <div class="kv-avatar">
            <div class="file-loading">
                <input id="avatar-1" name="blabla" type="file" required>
            </div>
        </div>
        <div class="kv-avatar-hint"><small>Select file < 1500 KB</small></div>
    </div>
    <div id="kv-avatar-errors-1" class="center-block" style="width:800px;display:none"></div>
    <div class="row">
        <div class="col-md-3">
            <label for="name">Name</label>
        </div>
        <spring:bind path="username">
            <div class="col-md-6">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input type="text" path="username" class="form-control" placeholder="Username"
                                    autofocus="true" name="name"></form:input>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="">
                    <span class="text-danger align-middle">
                        <form:errors path="username"></form:errors>
                    </span>
                </div>
            </div>
        </spring:bind>
    </div>
    <div class="row">
        <div class="col-md-3">
            <label for="email">E-Mail Address</label>
        </div>
        <spring:bind path="email">
            <div class="col-md-6">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <form:input type="text" path="email" class="form-control" placeholder="you@example.com"
                                    name="email" autofocus="true"></form:input>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="">
                    <span class="text-danger align-middle">
                           <form:errors path="email"></form:errors>
                    </span>
                </div>
            </div>
        </spring:bind>
    </div>
    <div class="row">
        <spring:bind path="gender">
            <div class="col-md-4">
                <label for="password">Gender</label>
            </div>
            <div class="form-group">
                <form:radiobutton path="gender" value="male" /> Male <form:radiobutton
                    path="gender" value="female" /> Female
            </div>
            <div class="col-md-3">
                <div class="">
                        <span class="text-danger align-middle">
                              <form:errors path="gender"></form:errors>
                        </span>
                </div>
            </div>
        </spring:bind>
    </div>
    <div class="row">
        <div class="col-md-3">
            <label for="password">Password</label>
        </div>
        <spring:bind path="password">
            <div class="col-md-6">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                        <form:input name="password" type="password" path="password" class="form-control" placeholder="Password"></form:input>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="">
                    <span class="text-danger align-middle">
                          <form:errors path="password"></form:errors>
                    </span>
                </div>
            </div>
        </spring:bind>
    </div>
    <div class="row">
        <div class="col-md-3">
            <label for="password-confirmation">Confirm Password</label>
        </div>
        <spring:bind path="passwordConfirm">
            <div class="col-md-6">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="" style="width: 2.6rem"><i class="fa fa-redo"></i></div>
                    <form:input type="password" path="passwordConfirm" class="form-control"
                                name="password-confirmation" placeholder="Confirm your password"></form:input>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="">
                    <span class="text-danger align-middle">
                         <form:errors path="passwordConfirm"></form:errors>
                    </span>
                </div>
            </div>
        </spring:bind>
    </div>
    <div class="row">
        <spring:bind path="agreedTerms">
        <div class="col-md-3"></div>
        <div class="checkbox">
            <label>
                <form:checkbox path="agreedTerms"/>
                I have read and accepted  <a target="_blank" href="#">the terms and conditions of use.</a>
            </label>
        </div>
        <div class="col-md-3">
            <div class="">
                <span class="text-danger align-middle">
                     <form:errors path="agreedTerms"></form:errors>
                </span>
            </div>
        </div>
        </spring:bind>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <button type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i> Register</button>
        </div>
    </div>
</form:form>
</div>
<jsp:include page="common/footer.jsp"/>
<script>
    $("#avatar-1").fileinput({
        overwriteInitial: true,
        maxFileSize: 1500,
        showClose: false,
        showCaption: false,
        browseLabel: '',
        removeLabel: '',
        browseIcon: '<i class="fa fa-folder-open"></i>',
        removeIcon: '<i class="fa fa-trash-alt"></i>',
        removeTitle: 'Cancel or reset changes',
        elErrorContainer: '#kv-avatar-errors-1',
        msgErrorClass: 'alert alert-block alert-danger',
        defaultPreviewContent: '<img src="${contextPath}/resources/img/default_avatar_male.jpg" alt="Your Avatar">',
        layoutTemplates: {main2: '{preview} {remove} {browse}'},
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
</script>
</body>
</html>
