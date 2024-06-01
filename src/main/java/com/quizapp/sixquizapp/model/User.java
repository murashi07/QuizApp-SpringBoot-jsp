package com.quizapp.sixquizapp.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@Entity
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String username;

    @NotBlank
    private String email;

    @NotBlank
    private String password;

    private boolean isAdmin;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<QuizResult> quizResults;

    public User() {
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

}
