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
    <title>sign-in</title>
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
            }).then(function() {window.location.href = "http://localhost:8080/lab1/list-user"});
        </script>
    </c:if>
    <c:if test="${not empty error || not empty sessionScope.securi}">
        <script>
            swal({
                title: "Oh MY GOD!",
                text: "${not empty error ? error:sessionScope.securi}",
                icon: "error",
            });
        </script>
    </c:if>
    <div class="container mt-5 w-50">
        <h1 class="text-center">Login</h1>
        <form action="<c:url value="sign-in"/>" method="post" onsubmit = "return validateForm()">
            <!-- Username input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="username">Username: <i class="text-danger" id="user_inValidate"></i></label>
                <input type="text" class="form-control" name="username" id="username" />
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="password">Password: <i class="text-danger" id="pass_inValidate"></i></label>
                <input type="password" class="form-control" name="password" id="password" />
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
            <a href="<c:url value="/account/sign-up" />"  class="btn btn-info btn-block mb-4">Register</a>
        </form>
    </div>

    <script>
        //Validate forms
        function validateForm() {
            var check = true;
            var user_inValidate= document.getElementById('user_inValidate');
            var username = document.getElementById('username').value;
            var pass_inValidate = document.getElementById('pass_inValidate');
            var pass = document.getElementById('password').value;

            if(username == "") {
                user_inValidate.innerText = '*Please enter a Username*';
                check = false;
            } else {
                user_inValidate.innerText = '';
            }
            if(pass == "") {
                pass_inValidate.innerText = '*Please enter your Password*';
                check = false;
            } else {
                pass_inValidate.innerText = '';
            }
            return check;
        }
    </script>
</body>
</html>
