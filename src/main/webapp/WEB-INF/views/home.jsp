<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="file:///C:/Users/USER/3D%20Objects/Web%20Tech/css-js/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;

            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        h3 {
            color: #007bff;
            margin-bottom: 20px;
        }

        .btn {
            font-size: 1rem;
            padding: 0.5rem 1rem;
            margin-right: 10px;
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


            color: #fff;
            text-decoration: none;
            font-weight: 500;
            margin-left: 40px;
        }

        .btn-secondary:hover {


        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 30px;
            background-color: #007bff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
        }

        .logo {
            font-size: 2em;
            color: #fff;
            user-select: none;
        }

        .navigation {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navigation a{
            position: relative;
            font-size: 1.1em;
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            margin-left: 40px;

        }

        .navigation a::after{
            content: '';
            position: absolute;
            left: 0;
            bottom: -6px;
            width: 100%;
            height: 3px;
            background: #fff;
            border-radius: 5px;
            transform-origin: right;
            transform: scaleX(0);
            transition: transform .5s;
        }

        .navigation a:hover::after{
            transform-origin: left;
            transform: scaleX(1);
        }
    </style>
</head>
<body>
<header>
    <h2 class="logo"></h2>
    <nav class="navigation">
        <a href="<c:url value='/' />" class="btn btn-primary">Home</a>
        <a href="<c:url value='/register' />" class="btn btn-primary">Register</a>
        <a href="<c:url value='/login' />" class="btn btn-secondary">Login</a>
    </nav>
</header>
<br>
<div class="container text-center">
    <h1 class="mt-5 mb-4">Welcome to the Quiz App</h1>
</div>

<div>
    <h3 >
        "Unlock your potential through the power of learning! Engage your mind, expand your knowledge, and challenge yourself with quizzes. Each question is an opportunity to discover something new, to reinforce what you already know, and to grow intellectually. Embrace the journey of education through quizzes, and watch as your curiosity leads you to new heights of understanding. Start your quest for knowledge today!"
    </h3>
</div>
</body>
</html>
