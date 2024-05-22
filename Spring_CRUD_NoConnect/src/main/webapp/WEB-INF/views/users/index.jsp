<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-6 d-flex align-items-center justify-content-start">
        <h2 class="text-dark-emphasis m-2">User overview</h2>
    </div>
    <div class="col-6 d-flex align-items-center justify-content-end">
        <a href="/user/add" class="btn border"><i class="bi bi-plus"></i> Create new</a>
    </div>
</div>
<hr>
<c:if test="${param.new_update != null}">
    <script>
        swal("Good job!", "Successfully updated a user", "success");
    </script>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> Successfully updated a user.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${param.new_user != null}">
    <script>
        swal("Good job!", "Successfully added a user", "success");
    </script>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> Successfully added a user.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${param.delete_success != null && not empty users}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> Successfully deleted a user.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<form id="searchForm" action="/user" method="get">
    <div class="mb-3 d-flex justify-content-end">
        <input
                type="search" class="form-control w-25"
                placeholder="Search for username, name, and email..." name="q"
                value="${q}">
    </div>
</form>
<c:if test="${empty users}">
    <div class="alert alert-warning  alert-dismissible fade show" role="alert">
        <strong>Warning!</strong> Data is empty!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${not empty users}">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">No</th>
            <th scope="col">Username</th>
            <th scope="col">Name</th>
            <th scope="col">Password</th>
            <th scope="col">Email</th>
            <th class="text-center" scope="col">Activity</th>
            <th class="text-center" scope="col">Admin</th>
            <th class="text-center" scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user" varStatus="i">
            <tr class="align-middle">
                <td>${i.index + 1}</td>
                <td>${user.username}</td>
                <td>${user.fullName}</td>
                <td class="fw-bold">••••••••</td>
                <td class="text-primary">${user.email}</td>
                <td class="text-center">${user.activity? '<i class="bi bi-check2 text-success"></i>' : '<i class="bi bi-x-lg text-danger"></i>'}</td>
                <td class="text-success text-center">${user.admin ? '<i class="bi bi-check2"></i>' : ""}</td>
                <td class="text-center">
                    <a href="user/edit/${user.username}" class="text-secondary h5 m-2"><i
                            class="bi bi-gear-fill"></i></a>
                    <a onclick="handleDelete('${user.username}')" class="text-danger h5"><i
                            class="bi bi-x-circle-fill"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${users.size() > 2}">
        <strong class="m-2">Size: ${users.size()}</strong>
    </c:if>
</c:if>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    document.getElementById('searchForm').addEventListener('submit', function (event) {
        var input = document.querySelector('input[name="q"]');
        if (!input.value.trim()) {
            input.parentNode.removeChild(input);
        }
    });
    const handleDelete = (username) => {
        swal({
            title: "Are you sure?",
            text: "Do you want to delete this user??",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((confirm) => {
                if (confirm) {
                    swal({
                        title: "Success!",
                        text: "User successfully deleted",
                        icon: "success",
                    }).then((value) => {
                        if (value) {
                            this.window.location.href = "/user/" + username
                        }
                    });

                }
            });
    }
</script>
