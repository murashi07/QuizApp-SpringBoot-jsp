package com.quizapp.sixquizapp.model;

import jakarta.persistence.ManyToMany;
import lombok.Data;

import java.util.List;
@Data
public class QuizWrapper {
    private String subject;
    private int numQuestions;
    private int duration;
    private String name;
}
