package com.quizapp.sixquizapp.repository;

import com.quizapp.sixquizapp.model.Question;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.List;

public interface QuestionRepository  extends JpaRepository<Question, Long> {

    @Query("SELECT DISTINCT q.subject FROM Question q")
    List<String> findDistinctSubject();
    Page<Question> findBySubject(String subject, Pageable pageable);

    @Query("SELECT q FROM Question q JOIN FETCH q.choices")
    List<Question> findAllWithChoices();

    @Query("SELECT q.correctAnswers FROM Question q WHERE q.id = :id")
    String findCorrectAnswerById(Long id);

//    List<Question> findRandomQuestionsBySubject(String subject, int numQuestions);

    @Query(value = "SELECT * FROM question WHERE subject = :subject ORDER BY RAND() LIMIT :numQuestions", nativeQuery = true)
    List<Question> findRandomQuestionsBySubject(@Param("subject") String subject, @Param("numQuestions") int numQuestions);





}