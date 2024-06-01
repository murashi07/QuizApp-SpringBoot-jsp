package com.quizapp.sixquizapp.service;

import com.quizapp.sixquizapp.model.DoneQuiz;
import com.quizapp.sixquizapp.model.Quiz;
import com.quizapp.sixquizapp.repository.DoneQuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DoneQuizService {
    @Autowired
    DoneQuizRepository quizRepository;

    public DoneQuiz saveDoneQuiz(DoneQuiz doneQuiz){
        return quizRepository.save(doneQuiz);
    }
}
