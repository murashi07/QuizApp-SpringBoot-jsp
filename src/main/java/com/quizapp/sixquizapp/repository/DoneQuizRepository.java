package com.quizapp.sixquizapp.repository;

import com.quizapp.sixquizapp.model.DoneQuiz;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DoneQuizRepository extends JpaRepository<DoneQuiz,Long> {
}
