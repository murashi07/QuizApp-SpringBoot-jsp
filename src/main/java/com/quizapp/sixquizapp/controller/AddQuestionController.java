package com.quizapp.sixquizapp.controller;

import com.quizapp.sixquizapp.model.Question;
import com.quizapp.sixquizapp.service.IQuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AddQuestionController {

    private final IQuestionService questionService;

    public AddQuestionController(IQuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/add-question")
    public String showAddQuestionForm(Model model) {
        model.addAttribute("question", new Question());
        return "add-question";
    }

    @PostMapping("/add-question")
    public String saveQuestion(@RequestParam("question") String questionText,
                               @RequestParam("subject") String subject,
                               @RequestParam("choices") List<String> choices,
                               @RequestParam("correctAnswers") List<String> correctAnswers,
                               @RequestParam("questionType") String questionType,
                               Model model,
                               HttpServletRequest request) {
        Question question = new Question();
        question.setQuestion(questionText);
        question.setSubject(subject);
        question.setChoices(choices);
        question.setCorrectAnswers(correctAnswers);
        question.setQuestionType(questionType);
        // Set other properties as needed

        questionService.createQuestion(question);

        // Update session with a success message
        HttpSession session = request.getSession();
        session.setAttribute("message", "Question added successfully!");

        return "redirect:/add-question"; // Redirect to the add question form
    }
}
