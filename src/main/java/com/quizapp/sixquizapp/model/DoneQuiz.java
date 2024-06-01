package com.quizapp.sixquizapp.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class DoneQuiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private User user;
    @ManyToOne
    private Quiz quiz;
    private int marks;
//    private
}
