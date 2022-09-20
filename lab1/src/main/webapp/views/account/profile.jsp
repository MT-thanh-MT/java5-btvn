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
    <title>My-Profile</title>
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
        })
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
    <h1 class="text-center">PROFILE</h1>
    <form action="<c:url value="/account/edit-profile"/>" method="post" onsubmit = "return validateForm()">
        <!-- Fullname input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="fullname">Fullname: <i class="text-danger" id="name_inValidate"></i></label>
            <input type="text" class="form-control" name="fullname" id="fullname" value="${userLogin.fullname}" />
        </div>

        <!-- Age input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="age">Age: <i class="text-danger" id="age_inValidate"></i></label>
            <input type="number" class="form-control" name="age" id="age" value="${userLogin.age}" />
        </div>

        <!-- Email input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="email">Email: <i class="text-danger" id="email_inValidate"></i></label>
            <input type="email" class="form-control" name="email" id="email" value="${userLogin.email}" />
        </div>

        <!-- Address input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="address">Address: <i class="text-danger" id="address_inValidate"></i></label>
            <input type="text" class="form-control" name="address" id="address" value="${userLogin.address}" />
        </div>
        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Apply</button>

    </form>
</div>

<script>
    //Validate forms
    function validateForm() {
        var check = true;
        var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var name_inValidate= document.getElementById('name_inValidate');
        var fullname = document.getElementById('fullname').value;
        var email_inValidate = document.getElementById('email_inValidate');
        var email = document.getElementById('email').value;
        var age_inValidate = document.getElementById('age_inValidate');
        var age = document.getElementById('age').value;
        var address_inValidate = document.getElementById('address_inValidate');
        var address = document.getElementById('address').value;

        if (address == "") {
            address_inValidate.innerText = '*Please enter your address*';
            check = false;
        } else {
            address_inValidate.innerText = '';
        }
        if(isNaN(age)) {
            age_inValidate.innerText = '*Age must be number*';
            check = false;
        } else  if (age < 18) {
            age_inValidate.innerText = '*Age must be more than 18*';
            check = false;
        } else  if (age > 60) {
            age_inValidate.innerText = '*Age must be under 60*';
            check = false;
        } else {
            age_inValidate.innerText = '';
        }
        if(fullname == "") {
            name_inValidate.innerText = '*Please enter your name*';
            check = false;
        } else {
            name_inValidate.innerText = '';
        }
        if(email == "") {
            email_inValidate.innerText = '*Please enter your email*';
            check = false;
        } else  if(!emailRegex.test(email)){
            email_inValidate.innerText = '*Please enter a Email like abc123@abc.abc*';
            check = false;
        } else {
            email_inValidate.innerText = '';
        }
        return check;
    }
</script>
</body>
</html>
