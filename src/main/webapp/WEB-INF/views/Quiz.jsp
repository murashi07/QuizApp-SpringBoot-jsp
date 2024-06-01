<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        h1 {
            color: #007bff;
        }
        form {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            background-color: #fff;
        }
        h3 {
            color: #007bff;
            margin-top: 20px;
        }
        p {
            margin-bottom: 10px;
        }
        input[type="radio"] {
            margin-right: 10px;
        }
        label {
            margin-right: 20px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div>
    <h1>Quiz</h1>
    <form action="quiz-process" method="post">
        <c:forEach var="question" items="${questions}" varStatus="status">
            <h3>Question ${status.index + 1}</h3>
            <p>${question.question}</p>
            <c:forEach var="choice" items="${question.choices}">
                <input type="radio" id="${choice}" name="answer${status.index + 1}" value="${choice}">
                <label for="${choice}">${choice}</label><br>
            </c:forEach>
            <input type="hidden" name="correctAnswer${status.index + 1}" value="${question.correctAnswer}">
            <br>
        </c:forEach>
        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
