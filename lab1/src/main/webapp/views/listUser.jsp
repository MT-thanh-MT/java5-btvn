<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 15/09/2022
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>List User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Thanhi</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<c:url value="/list-user" />">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/account/edit-profile" />">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/account/change-password" />">Change Password</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/account/sign-out" />">Logout</a>
                </li>
            </ul>
            <span class="navbar-text">
                ${userLogin.fullname}
            </span>
        </div>
    </div>
</nav>
<div class="container mt-5 ">
    <h1 class="text-center">List user</h1>
    <hr>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Fullname</th>
            <th scope="col">Age</th>
            <th scope="col">Address</th>
            <th scope="col">Email</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.fullname}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.email}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
