<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${error}">
    <script>
        swal("Error!", "Please check the data again!", "error");
    </script>
</c:if>
<h2 class="text-dark-emphasis text-uppercase mb-3">${title} user account</h2>
<hr>
<form:form modelAttribute="user" action="${action}">
    <div class="row">
        <div class="col-6">
            <img src="/assert/image/undraw_winter_designer_a-2-m7.svg" alt="banner" style="width: 30em">
        </div>
        <div class="col">
            <div ${type ? "style='display: none'" : ""} class="mb-3">
                <div class="form-floating">
                    <form:input path="username" type="text" class="form-control" id="username" placeholder="username"/>
                    <label for="username">Username</label>
                </div>
                <form:errors path="username" cssClass="text-danger" element="label"/>
            </div>
            <div class="mb-3">
                <div class="form-floating">
                    <form:input path="fullName" type="text" class="form-control" id="fullName" placeholder="fullName"/>
                    <label for="fullName">Name</label>
                </div>
                <form:errors path="fullName" cssClass="text-danger" element="label"/>

            </div>
            <div class="mb-3">
                <div class="form-floating">
                    <form:input path="password" type="password" class="form-control" id="password"
                                placeholder="password"/>
                    <label for="password">Password</label>
                </div>
                <form:errors path="password" cssClass="text-danger" element="label"/>
            </div>
            <div class="mb-3">
                <div class="form-floating">
                    <form:input path="email" type="email" class="form-control" id="email" placeholder="email"/>
                    <label for="email">Email</label>
                </div>
                <form:errors path="email" cssClass="text-danger" element="label"/>
            </div>
            <div class="col-6 mb-5">
                <div class="form-check form-check-inline">
                    <form:checkbox path="activity" class="form-check-input" id="activity" value="true"/>
                    <label class="form-check-label" for="activity">Activity</label>
                </div>
                <div class="form-check form-check-inline">
                    <form:checkbox path="admin" class="form-check-input" id="admin" value="true"/>
                    <label class="form-check-label" for="admin">Admin</label>
                </div>
            </div>
            <div class="d-flex justify-content-start align-items-center w-25">
                <button class="btn btn-primary fw-semibold m-2">Save</button>
                <a href="/user" class="btn btn-danger fw-semibold">Cancel</a>
            </div>
        </div>
    </div>
</form:form>