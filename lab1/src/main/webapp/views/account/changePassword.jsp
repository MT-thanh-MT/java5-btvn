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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Change password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:if test="${not empty messenger}">
    <script>
        swal({
            title: "Oh MY GOD!",
            text: "${messenger}",
            icon: "success",
        }).then(function() {window.location.href = "http://localhost:8080/lab1/account/sign-out"});
    </script>
</c:if>
<c:if test="${not empty error}">
    <script>
        swal({
            title: "Oh MY GOD!",
            text: "${error}",
            icon: "error",
        });
    </script>
</c:if>
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
<div class="container mt-5 w-50">
    <h1 class="text-center">CHANGE YOUR PASSWORD</h1>
    <form action="<c:url value="change-password"/>" method="post" onsubmit = "return validateForm()">
        <!-- Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="oldPassword">Old Password: <i class="text-danger" id="oldPassword_inValidate"></i></label>
            <input type="password" class="form-control" name="oldPassword" id="oldPassword" />
        </div>

        <!-- New Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="newPassword">New Password: <i class="text-danger" id="newPassword_inValidate"></i></label>
            <input type="password" class="form-control" name="newPassword" id="newPassword" />
        </div>

        <!-- Confirm Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="confirmPassword">Confirm Password: <i class="text-danger" id="confirmpPassword_inValidate"></i></label>
            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" />
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Apply</button>
    </form>
</div>

<script>
    //Validate forms
    function validateForm() {
        var check = true;
        var confirmpPassword_inValidate = document.getElementById('confirmpPassword_inValidate');
        var confirmpPassword = document.getElementById('confirmPassword').value;
        var oldPassword_inValidate = document.getElementById('oldPassword_inValidate');
        var oldPassword = document.getElementById('oldPassword').value;
        var newPassword_inValidate = document.getElementById('newPassword_inValidate');
        var newPassword = document.getElementById('newPassword').value;

        if(oldPassword == "") {
            oldPassword_inValidate.innerText = '*Please enter your old password*';
            check = false;
        }  else {
            oldPassword_inValidate.innerText = '';
        }
        if(newPassword == "") {
            newPassword_inValidate.innerText = '*Please enter your new password*';
            check = false;
        } else if (newPassword.length < 6) {
            newPassword_inValidate.innerText = '*Password must be 6 characters*';
            check = false;
        } else {
            newPassword_inValidate.innerText = '';
        }
        if(confirmpPassword == "") {
            confirmpPassword_inValidate.innerText = '*Please confirm new password*';
            check = false;
        } else if (confirmpPassword != newPassword){
            confirmpPassword_inValidate.innerText = "*Confirm Password inCorrect*";
            check = false;
        } else {
            confirmpPassword_inValidate.innerText = '';
        }
        return check;
    }
</script>
</body>
</html>
