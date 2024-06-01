package com.quizapp.sixquizapp.controller;

import com.quizapp.sixquizapp.model.Question;
import com.quizapp.sixquizapp.service.IQuestionService;
import jakarta.persistence.Parameter;
import jakarta.persistence.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class QuizPageController {

    private final IQuestionService questionService;
    private Query request;

    public QuizPageController(IQuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/quiz-page")
    public String showQuizPage(Model model) {
        List<String> subjects = questionService.findDistinctSubject();
        model.addAttribute("subjects", subjects);
        return "quizpage";
    }

    @PostMapping("/quiz-start")
    public String startQuiz(@RequestParam("subject") String subject,
                            @RequestParam("numQuestions") int numQuestions,
                            Model model) {
        List<Question> questions = questionService.findRandomQuestionsBySubject(subject, numQuestions);
        if (questions.isEmpty()) {
            // Handle case where no questions are found for the selected subject
            return "redirect:/quiz-page"; // Redirect back to the quiz page or display an error message
        }
        model.addAttribute("questions", questions);
        return "Quiz"; // Redirect to the endpoint for displaying the quiz questions
    }

    @PostMapping("/quiz-process")
    public String processQuiz(@RequestParam Map<String, String> answers, Model model) {
        int score = 0;
        for (Map.Entry<String, String> entry : answers.entrySet()) {
            String key = entry.getKey(); // This will be in the format answer1, answer2, etc.
            int questionNumber = Integer.parseInt(key.substring(6)); // Extract the question number from the key
            String userAnswer = entry.getValue();
            Question question = questionService.findById(Long.parseLong(key.substring(6)));
            if (question != null) {
                String correctAnswer = questionService.findCorrectAnswerById(question.getId());
                if (correctAnswer != null && userAnswer.equals(correctAnswer)) {
                    score++; // Increment score if the user's answer is correct
                }
            }
        }
        model.addAttribute("score", score);
        return "QuizResult"; // Assuming a QuizResult.jsp for displaying the result
    }




}
