<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #212529;
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
            text-align: center;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Quiz Result</h1>
    <p>Your score: ${marks}</p>
    <p>Thank you for participating!</p>
    <a href="/" class="nav-link">return to home page</a>
</div>
</body>
</html>
