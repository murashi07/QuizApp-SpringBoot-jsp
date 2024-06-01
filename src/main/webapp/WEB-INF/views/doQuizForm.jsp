<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${quiz.name}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        .timer {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .question-counter {
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
        }

        .question-container {
            margin-bottom: 2rem;
        }

        .form-check {
            margin-bottom: 0.5rem;
        }

        .animate__animated {
            animation-duration: 0.5s;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body>
<div class="container">
    <h1>${quiz.name}</h1>
    <div class="timer">
        <span id="timer">${quiz.duration}</span> seconds remaining
    </div>
    <div class="question-counter">
        Question <span id="currentQuestionIndex">${currentQuestionIndex + 1}</span> of ${quiz.questionList.size()}
    </div>
    <div class="question-container animate__animated animate__fadeIn">
        <c:set var="question" value="${quiz.questionList[currentQuestionIndex]}" />
        <h3>${question.question}</h3>
        <form id="quizForm" action="/user/quiz/${quiz.id}/next" method="post">
            <c:forEach var="choice" items="${question.choices}" varStatus="loop">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="userAnswer" id="choice${loop.index}" value="${choice}">
                    <label class="form-check-label" for="choice${loop.index}">${choice}</label>
                </div>
            </c:forEach>
            <input type="hidden" name="currentQuestionIndex" value="${currentQuestionIndex}">
            <!-- Add a hidden input field for the question ID -->
            <input type="hidden" name="questionId" value="${question.id}">
            <c:if test="${currentQuestionIndex == quiz.questionList.size() - 1}">
                <button type="submit" class="btn btn-primary" id="submitQuiz">Submit Quiz</button>
            </c:if>
            <c:if test="${currentQuestionIndex != quiz.questionList.size() - 1}">
                <button type="submit" class="btn btn-primary" id="nextQuestion">Next</button>
            </c:if>
        </form>
    </div>
</div>

<script>
    let timerInterval;
    let timeRemaining = ${quiz.duration} * 60;

    function startTimer() {
        timerInterval = setInterval(function() {
            timeRemaining--;
            document.getElementById("timer").textContent = timeRemaining;

            if (timeRemaining === 0) {
                clearInterval(timerInterval);
                submitQuiz();
            }
        }, 1000);
    }

    function submitQuiz() {
        document.getElementById("quizForm").submit();
    }

    document.getElementById("quizForm").addEventListener("submit", function(event) {
        const selectedOption = document.querySelector('input[name="answer"]:checked');

        // if (!selectedOption) {
        //     event.preventDefault();
        //     alert("Please select an option before proceeding.");
        // }
    });

    startTimer();
</script>
</body>
</html>