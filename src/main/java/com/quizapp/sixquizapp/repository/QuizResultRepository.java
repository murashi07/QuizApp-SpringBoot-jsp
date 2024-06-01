package com.quizapp.sixquizapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.quizapp.sixquizapp.model.QuizResult;
import com.quizapp.sixquizapp.model.User;

import java.util.List;

@Repository
public interface QuizResultRepository extends JpaRepository<QuizResult, Long> {
    List<QuizResult> findByUser(User user);
    //List<QuizResult> findByUserAndQuizId(User user, Long quizId);
    // Other query methods as needed
}

