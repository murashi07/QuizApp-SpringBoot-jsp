<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
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
  </style>
</head>
<body>
<div class="container">
  <h1 class="mt-5 mb-4">Login</h1>
  <form action="<c:url value='/login' />" method="post" style="max-width: 400px;">
    <div class="mb-3">
      <label for="usernameOrEmail" class="form-label">Username or Email:</label>
      <input type="text" id="usernameOrEmail" name="usernameOrEmail" class="form-control" placeholder="Username Or Email" required>
    </div>

    <div class="mb-3">
      <label for="password" class="form-label">Password:</label>
      <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
    </div>

    <div class="mb-3 text-center">
      <input type="submit" value="Login" class="btn btn-primary">
    </div>
  </form>
</div>
</body>
</html>
