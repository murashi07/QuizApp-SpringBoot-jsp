<%@ page import="java.util.List" %>
<%@ page import="com.quizapp.sixquizapp.model.Question" %>
<%@ page import="com.quizapp.sixquizapp.controller.QuestionController" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All Quiz Questions</title>
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

    h4 {
      color: #007bff;
      margin-bottom: 20px;
    }

    hr {
      margin-bottom: 20px;
      border-color: #007bff;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      border: 1px solid #dee2e6;
      padding: 8px;
      text-align: left;
    }

    th {
      background-color: #f8f9fa;
    }

    ul {
      padding-left: 20px;
    }

    .btn {
      font-size: 0.875rem;
      padding: 0.25rem 0.5rem;
    }

    .btn-outline-primary {
      color: #007bff;
      border-color: #007bff;
    }

    .btn-outline-primary:hover {
      color: #0056b3;
      background-color: transparent;
      border-color: #0056b3;
    }

    .btn-outline-warning {
      color: #ffc107;
      border-color: #ffc107;
    }

    .btn-outline-warning:hover {
      color: #d39e00;
      background-color: transparent;
      border-color: #d39e00;
    }

    .btn-outline-danger {
      color: #dc3545;
      border-color: #dc3545;
    }

    .btn-outline-danger:hover {
      color: #a71d2a;
      background-color: transparent;
      border-color: #a71d2a;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row mt-5">
    <div class="col-md-6 mb-2 md-mb-0" style="color: GrayText;">
      <h4>All Quiz Questions</h4>
    </div>
    <div class="col-md-4 d-flex justify-content-end">
      <a href="/add-question" >
        <button class="btn btn-sm btn-outline-primary mr-2">Add Question</button>

        <a href="/admin" class="nav-link">return to Admin home</a>
      </a>
    </div>
  </div>
  <hr>
  <table id="questionsTable" class="table table-striped">
    <thead>
    <tr>
      <th>Question</th>
      <th>Subject</th>
      <th>Question Type</th>
      <th>Choices</th>
      <th>Correct Answers</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="question" items="${questions}">
      <tr>
        <td><c:out value="${question.question}" /></td>
        <td><c:out value="${question.subject}" /></td>
        <td><c:out value="${question.questionType}" /></td>
        <td>
          <ul>
            <c:forEach var="choice" items="${question.choices}">
              <li><c:out value="${choice}" /></li>
            </c:forEach>
          </ul>
        </td>
        <td><c:out value="${question.correctAnswers}" /></td>
        <td>
          <a href="<c:url value="/update-question/${question.id}" />">
            <button class="btn btn-sm btn-outline-warning mr-2">Edit</button>
          </a>
          <button class="btn btn-sm btn-outline-danger deleteQuestion" data-id="${question.id}">Delete</button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<script src="file:///C:/Users/USER/3D%20Objects/Web%20Tech/css-js/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
<script>
  const deleteQuestionBtns = document.querySelectorAll('.deleteQuestion');

  deleteQuestionBtns.forEach(btn => {
    btn.addEventListener('click', async () => {
      if (window.confirm('Are you sure you want to delete this question?')) {
        const id = btn.dataset.id;
        const response = await fetch(`/api/quizzes/question/delete/${id}`, {
          method: 'DELETE' // Change the method to DELETE
        });

        if (response.ok) {
          btn.closest('tr').remove();
        } else {
          const error = await response.text();
          window.alert(error);
        }
      }
    });
  });
</script>
</body>
</html>
