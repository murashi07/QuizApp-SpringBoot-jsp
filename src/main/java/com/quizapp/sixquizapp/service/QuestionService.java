package com.quizapp.sixquizapp.service;

import com.quizapp.sixquizapp.model.Question;
import com.quizapp.sixquizapp.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class QuestionService implements IQuestionService{

    private final QuestionRepository questionRepository;
    @Override
    public Question createQuestion(Question question) {
        return questionRepository.save(question);
    }

    @Override
    public List<Question> getAllQuestions() {
        return questionRepository.findAll();
    }

    @Override
    public Optional<Question> getQuestionById(Long id) {
        return questionRepository.findById(id);
    }

    @Override
    public List<String> findAllSubjects() {
        return null;
    }

    @Override
    public List<String> getAllSubjects() {
        return questionRepository.findDistinctSubject();
    }

//    @Override
//    public List<Question> getQuestionsBySubject(String subject, int numQuestions) {
//        return questionRepository.findRandomQuestionsBySubject(subject, numQuestions);
//    }

    @Override
    public Question updateQuestion(Long id, Question question) throws ChangeSetPersister.NotFoundException {
        Optional<Question> theQuestion = this.getQuestionById(id);
        if (theQuestion.isPresent()){
            Question updatedQuestion = theQuestion.get();
            updatedQuestion.setQuestion(question.getQuestion());
            updatedQuestion.setQuestionType(question.getQuestionType());
            updatedQuestion.setSubject(question.getSubject());
            updatedQuestion.setChoices(question.getChoices());
            updatedQuestion.setCorrectAnswers(question.getCorrectAnswers());
            return questionRepository.save(updatedQuestion);
        }else {
            throw new ChangeSetPersister.NotFoundException();
        }

    }

    @Override
    public void deleteQuestion(Long id) {
        questionRepository.deleteById(id);

    }

    @Override
    public List<Question> getQuestionsForUser(Integer numOfQuestions, String subject) {
        Pageable pageable = PageRequest.of(0, numOfQuestions);
        return questionRepository.findBySubject(subject, pageable).getContent();
    }

    @Override
    public Question getRandomQuestion() {
        return null;
    }

    @Override
    public Question getQuestion() {
        return null;
    }

    @Override
    public List<Question> getQuestionsForSubject(String subject, int numQuestions) {
        return null;
    }

    @Override
    public List<Question> getQuestionsBySubject(String subject, int numQuestions) {
        return questionRepository.findRandomQuestionsBySubject(subject, numQuestions);
    }

    @Override
    public List<String> findDistinctSubject() {
        return questionRepository.findDistinctSubject();
    }

    @Override
    public List<Question> findRandomQuestionsBySubject(String subject, int numQuestions) {
        List<Question> questions = questionRepository.findBySubject(subject, PageRequest.of(0, numQuestions)).getContent();
        List<Question> modifiableQuestions = new ArrayList<>(questions);
        Collections.shuffle(modifiableQuestions);
        return modifiableQuestions;
    }


    @Override
    public Question findById(long id) {
        return questionRepository.findById(id).orElse(null);
    }

    @Override
    public String findCorrectAnswerById(Long id) {
        return questionRepository.findCorrectAnswerById(id);
    }

    @Override
    public List<Question> fetchQuizQuestions(int selectedNumQuestions, String selectedSubject) {
        return null;
    }

    public void save(Question question) {
        questionRepository.save(question);
    }
}
