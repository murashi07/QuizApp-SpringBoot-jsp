package com.quizapp.sixquizapp.service;

import com.quizapp.sixquizapp.model.QuizResult;
import com.quizapp.sixquizapp.model.User;
import jakarta.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
public class QuizResultService implements IQuizResultService {

    @Autowired
    private EntityManager entityManager;

    @Override
    @Transactional
    public QuizResult saveQuizResult(QuizResult quizResult) {
        entityManager.persist(quizResult);
        return quizResult;
    }

    @Override
    public List<QuizResult> getQuizResultsByUser(User user) {
        // Implement this method to retrieve quiz results for a user from your database
        return null;
    }

    @Override
    public List<QuizResult> getQuizResultsByUserAndQuiz(User user, Long quizId) {
        // Implement this method to retrieve quiz results for a user and quiz from your database
        return null;
    }
}
