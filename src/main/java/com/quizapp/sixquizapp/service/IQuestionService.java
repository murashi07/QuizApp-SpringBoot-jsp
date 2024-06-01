package com.quizapp.sixquizapp.service;

import com.quizapp.sixquizapp.model.Question;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;

import java.util.List;
import java.util.Optional;

public interface IQuestionService {

    Question createQuestion(Question question);

    List<Question> getAllQuestions();

    Optional<Question> getQuestionById(Long id);

    List<String> findAllSubjects(); // Changed method name to follow Java naming conventions

    List<String> getAllSubjects();

    Question updateQuestion(Long id, Question question) throws NotFoundException; // Changed exception type

    void deleteQuestion(Long id);

    List<Question> getQuestionsForUser(Integer numOfQuestions, String subject);

    Question getRandomQuestion(); // Clarified method name and purpose

    List<Question> fetchQuizQuestions(int selectedNumQuestions, String selectedSubject); // Clarified method purpose

    Question getQuestion();

    List<Question> getQuestionsForSubject(String subject, int numQuestions);

    List<Question> getQuestionsBySubject(String subject, int numQuestions);

    List<String> findDistinctSubject();

    List<Question> findRandomQuestionsBySubject(String subject, int numQuestions);

    Question findById(long l);

    String findCorrectAnswerById(Long id);


//    List<Question> getQuestionsBySubject(String subject, int numQuestions);


}
