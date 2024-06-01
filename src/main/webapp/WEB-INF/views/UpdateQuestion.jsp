<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Quiz Question</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>
<div class="container">
    <h4 class="mt-5" style="color: GrayText;">Update Quiz Question</h4>
    <div class="col-8">
        <form id="updateQuestionForm" action="/update-question" method="post">
            <div class="form-group">
                <label class="text-info">Question:</label>
                <textarea class="form-control" rows="4" id="question" name="question"></textarea>
            </div>

            <div class="form-group" id="choicesContainer">
                <label class="text-info">Choices:</label>
                <!-- Choices will be dynamically added here -->
            </div>

            <div class="form-group">
                <label class="text-info">Correct Answer(s):</label>
                <input type="text" class="form-control mb-4" id="correctAnswers" name="correctAnswers">
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-sm btn-outline-warning">Update question</button>
                <a href="/all-quizzes" class="btn btn-outline-primary ml-2">Back to all questions</a>
            </div>
        </form>
    </div>
</div>

<script>
    let choices = []; // Initialize choices array

    function addChoice() {
        const choicesContainer = document.getElementById("choicesContainer");
        const choiceCount = choices.length + 1;
        const choiceLetter = String.fromCharCode(64 + choiceCount);
        const newChoice = `
            <input type="text" class="form-control mb-4" placeholder="Choice ${choiceLetter}" name="choices[${choiceCount}]">
        `;
        choices.push(newChoice);
        choicesContainer.insertAdjacentHTML("beforeend", newChoice);
    }

    // Call addChoice to initialize the first choice input
    addChoice();
</script>
</body>
</html>
