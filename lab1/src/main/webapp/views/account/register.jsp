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
    <title>sign-up</title>
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
        }).then(function() {window.location.href = "sign-in"});
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
<div class="container mt-5 w-50">
    <h1 class="text-center">Register</h1>
    <form action="<c:url value="sign-up"/>" method="post" onsubmit = "return validateForm()">
        <!-- Username input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="username">Username: <i class="text-danger" id="user_inValidate"></i></label>
            <input type="text" class="form-control" name="username" id="username" value="${registerUser.username}"/>
<%--            <div class="text-danger" id="user_inValidate" style="display: none">Please enter a Username.</div>--%>
        </div>

        <!-- Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="password">Password: <i class="text-danger" id="pass_inValidate"></i></label>
            <input type="password" class="form-control" name="password" id="password" value="${registerUser.password}"/>
        </div>

        <!-- Fullname input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="fullname">Fullname: <i class="text-danger" id="name_inValidate"></i></label>
            <input type="text" class="form-control" name="fullname" id="fullname" value="${registerUser.fullname}"/>
        </div>

        <!-- Age input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="age">Age: <i class="text-danger" id="age_inValidate"></i></label>
            <input type="number" class="form-control" name="age" id="age" value="${registerUser.age}"/>
        </div>

        <!-- Email input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="email">Email: <i class="text-danger" id="email_inValidate"></i></label>
            <input type="email" class="form-control" name="email" id="email" value="${registerUser.email}"/>
        </div>

        <!-- Address input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="address">Address: <i class="text-danger" id="address_inValidate"></i></label>
            <input type="text" class="form-control" name="address" id="address" value="${registerUser.address}"/>
        </div>
        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Sign up</button>
        <br>
        <hr>
        <p>Already have an account? <a href="<c:url value="/account/sign-in" />">Sign-in Now</a></p>
    </form>
</div>

<script>
    //Validate forms
    function validateForm() {
        var check = true;
        var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var user_inValidate= document.getElementById('user_inValidate');
        var username = document.getElementById('username').value;
        var pass_inValidate = document.getElementById('pass_inValidate');
        var pass = document.getElementById('password').value;
        var name_inValidate= document.getElementById('name_inValidate');
        var fullname = document.getElementById('fullname').value;
        var email_inValidate = document.getElementById('email_inValidate');
        var email = document.getElementById('email').value;
        var age_inValidate = document.getElementById('age_inValidate');
        var age = document.getElementById('age').value;
        var address_inValidate = document.getElementById('address_inValidate');
        var address = document.getElementById('address').value;

        if (address.trim() === "") {
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
        if(username.trim() === "") {
            user_inValidate.innerText = '*Please enter a Username*';
            check = false;
        } else {
            user_inValidate.innerText = '';
        }
        if(pass.trim() === "") {
            pass_inValidate.innerText = '*Please enter your Password*';
            check = false;
        } else if (pass.length < 6) {
            pass_inValidate.innerText = '*Password must be 6 characters*';
            check = false;
        } else {
            pass_inValidate.innerText = '';
        }
        if(fullname.trim() === "") {
            name_inValidate.innerText = '*Please enter your name*';
            check = false;
        } else {
            name_inValidate.innerText = '';
        }
        if(email.trim() === "") {
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
