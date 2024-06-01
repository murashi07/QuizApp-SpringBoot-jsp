package com.quizapp.sixquizapp.controller;

import com.quizapp.sixquizapp.controller.NotFoundException;
import com.quizapp.sixquizapp.model.Question;
import com.quizapp.sixquizapp.service.IQuestionService;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UpdateQuestionController {

    private final IQuestionService questionService;

    public UpdateQuestionController(IQuestionService questionService) {
        this.questionService = questionService;
    }

    @PostMapping("/update-question")
    public String updateQuestion(@RequestParam("id") Long id,
                                 @RequestParam("question") String questionText,
                                 @RequestParam("subject") String subject,
                                 @RequestParam("questionType") String questionType,
                                 @RequestParam("choices") List<String> choices,
                                 @RequestParam("correctAnswers") List<String> correctAnswers,
                                 Model model) {
        try {
            Question questionToUpdate = questionService.getQuestionById(id)
                    .orElseThrow(() -> new NotFoundException("Question not found"));
            questionToUpdate.setQuestion(questionText);
            questionToUpdate.setSubject(subject);
            questionToUpdate.setChoices(choices);
            questionToUpdate.setQuestionType(questionType);
            questionToUpdate.setCorrectAnswers(correctAnswers);
            questionService.updateQuestion(id, questionToUpdate);
            return "redirect:/get-all-quizzes";
        } catch (NotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "it's not working"; // or any other error handling logic
        } catch (ChangeSetPersister.NotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
