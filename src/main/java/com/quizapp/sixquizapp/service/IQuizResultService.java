package com.quizapp.sixquizapp.service;

import com.quizapp.sixquizapp.model.QuizResult;
import com.quizapp.sixquizapp.model.User;

import java.util.List;

public interface IQuizResultService {
    QuizResult saveQuizResult(QuizResult quizResult);

    List<QuizResult> getQuizResultsByUser(User user);

    List<QuizResult> getQuizResultsByUserAndQuiz(User user, Long quizId);

    // Other methods as needed
}
