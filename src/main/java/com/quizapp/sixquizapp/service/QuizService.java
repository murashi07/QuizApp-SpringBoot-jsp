package com.quizapp.sixquizapp.service;

import com.quizapp.sixquizapp.model.Quiz;
import com.quizapp.sixquizapp.repository.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService {
    @Autowired
    QuizRepository quizRepository;

    public Quiz saveQuiz(Quiz quiz){
        return quizRepository.save(quiz);
    }
    public List<Quiz> allQuiz(){
        return quizRepository.findAll();
    }
    public Quiz getById(Long id){
        return quizRepository.findById(id).get();
    }

}
