<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link href="file:///C:/Users/USER/3D%20Objects/Web%20Tech/css-js/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            color: #212529;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .form-check-input {
            margin-right: 5px;
        }

        .btn {
            font-size: 1rem;
            padding: 0.5rem 1rem;
            margin-top: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        .border {
            border: 1px solid #dee2e6;
        }

        .rounded {
            border-radius: 0.25rem;
        }

        .shadow-sm {
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center mt-5 mb-4">User Registration</h1>
    <form action="<c:url value='/register' />" method="post" class="mx-auto p-4 border rounded shadow-sm" style="max-width: 400px;">
        <div class="mb-3">
            <label for="username" class="form-label">Username:</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">User Type:</label>
            <div class="form-check">
                <input type="radio" id="user" name="type" value="user" class="form-check-input" checked>
                <label for="user" class="form-check-label">User</label>
            </div>
            <div class="form-check">
                <input type="radio" id="admin" name="type" value="admin" class="form-check-input">
                <label for="admin" class="form-check-label">Admin</label>
            </div>
        </div>

        <div class="mb-3 text-center">
            <input type="submit" value="Register" class="btn btn-primary">
            <a href="<c:url value='/' />" class="btn btn-secondary">Home</a>
        </div>
    </form>

    <script>
        var message = "${message}";
        if (message !== "") {
            alert(message);
        }
    </script>
</div>
</body>
</html>
