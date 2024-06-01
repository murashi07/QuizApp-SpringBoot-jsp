<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Question</title>
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

        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 10px;
        }

        .btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-5 mb-4">Add New Question</h1>
    <form id="addQuestionForm" action="/add-question" method="post">
        <div class="mb-3">
            <label for="question" class="form-label text-info">Question:</label>
            <textarea id="question" name="question" class="form-control" rows="4"></textarea>
        </div>

        <div class="mb-3">
            <label for="subject" class="form-label text-info">Subject:</label>
            <input type="text" id="subject" name="subject" class="form-control" placeholder="Enter the subject" />
        </div>

        <div class="mb-3">
            <label for="questionType" class="form-label text-info">Question Type:</label>
            <select id="questionType" name="questionType" class="form-select">
                <option value="single">Single Answer</option>
                <option value="multiple">Multiple Answer</option>
            </select>
        </div>

        <div class="mb-3" id="choicesContainer">
            <label class="form-label text-primary">Choices:</label>
            <div id="choices">
                <div class="input-group mb-3">
                    <input type="text" name="choices" class="form-control" placeholder="Choice A"/>
                    <button type="button" class="btn btn-outline-danger" onclick="removeChoice(this)">Remove</button>
                </div>
            </div>
            <button type="button" class="btn btn-outline-primary" onclick="addChoice()">Add Choice</button>
        </div>

        <div class="mb-3" id="correctAnswersContainer">
            <label class="form-label text-success">Correct Answer(s):</label>
            <div id="correctAnswers">
                <div class="input-group mb-3">
                    <input type="text" name="correctAnswers" class="form-control" placeholder="Correct Answer"/>
                    <button type="button" class="btn btn-outline-danger" onclick="removeCorrectAnswer(this)">Remove</button>
                </div>
            </div>
            <button type="button" class="btn btn-outline-info" onclick="addCorrectAnswer()">Add Correct Answer</button>
        </div>

        <input type="submit" class="btn btn-outline-success mr-2" value="Save Question">
        <a href="/get-all-quizzes" class="btn btn-outline-primary ml-2">Back to existing questions</a>
    </form>
</div>

<script src="file:///C:/Users/USER/3D%20Objects/Web%20Tech/css-js/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
<script>
    function addChoice() {
        const choicesContainer = document.getElementById("choices");
        const choiceCount = choicesContainer.childElementCount + 1;
        const choiceLetter = String.fromCharCode(64 + choiceCount);
        const newChoice = `
            <div class="input-group mb-3">
                <input type="text" name="choices" class="form-control" placeholder="Choice ${choiceLetter}"/>
                <button type="button" class="btn btn-outline-danger" onclick="removeChoice(this)">Remove</button>
            </div>
        `;
        choicesContainer.insertAdjacentHTML("beforeend", newChoice);
    }

    function removeChoice(button) {
        const choicesContainer = document.getElementById("choices");
        const choiceElement = button.parentNode;
        choicesContainer.removeChild(choiceElement);
    }

    function addCorrectAnswer() {
        const correctAnswersContainer = document.getElementById("correctAnswers");
        const correctAnswerCount = correctAnswersContainer.childElementCount + 1;
        const newCorrectAnswer = `
            <div class="input-group mb-3">
                <input type="text" name="correctAnswers" class="form-control" placeholder="Correct Answer ${correctAnswerCount}"/>
                <button type="button" class="btn btn-outline-danger" onclick="removeCorrectAnswer(this)">Remove</button>
            </div>
        `;
        correctAnswersContainer.insertAdjacentHTML("beforeend", newCorrectAnswer);
    }

    function removeCorrectAnswer(button) {
        const correctAnswersContainer = document.getElementById("correctAnswers");
        const correctAnswerElement = button.parentNode;
        correctAnswersContainer.removeChild(correctAnswerElement);
    }

    // Add your fetchSubjects and form submission handling JavaScript code here
</script>
</body>
</html>
