package com.quizapp.sixquizapp.repository;

import com.quizapp.sixquizapp.model.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizRepository extends JpaRepository<Quiz,Long> {

}
