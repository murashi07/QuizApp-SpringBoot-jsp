<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Home Page</title>
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
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        hr {
            margin-bottom: 20px;
            border-color: #007bff;
        }

        .nav-link {
            color: #007bff;
            font-weight: bold;
        }

        .nav-link:hover {
            text-decoration: none;
            color: #0056b3;
        }

        .nav {
            padding-left: 0;
            list-style-type: none;
        }

        .nav > .nav-link {
            padding: 10px 0;
        }
    </style>
</head>
<body>
<section class="container">
    <h2 class="mt-5">Welcome to admin home page</h2>
    <hr />
    <nav class="nav flex-column">
        <a href="/add-question" class="nav-link">Add Questions</a>
        <a href="/get-all-quizzes" class="nav-link">Manage existing Questions</a>
        <a href="/quiz-page" class="nav-link">create a quiz</a>
        <a href="/getAllQuiz" class="nav-link">List of Quiz</a>
        <a href="/" class="nav-link">return to home page</a>
    </nav>
</section>
</body>
</html>
