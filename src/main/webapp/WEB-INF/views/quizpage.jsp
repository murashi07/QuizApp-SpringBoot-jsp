<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Page</title>
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
        label {
            display: inline-block;
            width: 150px;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 200px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
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
    <h1>Quiz Page</h1>
    <form action="/createQuiz" method="post">
        <div>
            <label for="name">Quiz name: </label>
            <input name="name" id="name" type="text"/>
        </div>
        <div>
            <label for="duration">Duration: </label>
            <input name="duration" id="duration" type="number"/>
        </div>
        <label for="subject">Select Subject:</label>
        <select id="subject" name="subject">
            <c:forEach var="subject" items="${subjects}">
                <option value="${subject}">${subject}</option>
            </c:forEach>
        </select><br><br>
        <label for="numQuestions">Number of Questions:</label>
        <input type="number" id="numQuestions" name="numQuestions" min="1" max="10" value="1"><br><br>
        <input type="submit" value="Create Quiz">
    </form>
</div>
</body>
</html>
