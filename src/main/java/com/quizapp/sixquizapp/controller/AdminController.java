package com.quizapp.sixquizapp.controller;

import com.quizapp.sixquizapp.model.Question;
import com.quizapp.sixquizapp.model.Quiz;
import com.quizapp.sixquizapp.model.QuizWrapper;
import com.quizapp.sixquizapp.service.QuestionService;
import com.quizapp.sixquizapp.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.quizapp.sixquizapp.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
public class AdminController {
    @Autowired
    QuestionService questionService;
    @Autowired
    QuizService quizService;

    @GetMapping("/admin")
    public String showAdminPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        // Check if the user is logged in as an admin
        if (session.getAttribute("user") != null) {
            // User is logged in, check if user is an admin
            User user = (User) session.getAttribute("user");
            if (user.isAdmin()) {
                // User is an admin, show admin page
                return "admin";
            } else {
                // User is not an admin, redirect to home page
                model.addAttribute("error", "Access denied. You are not an admin.");
                return "redirect:/";
            }
        } else {
            // User is not logged in, redirect to login page
            return "redirect:/login";
        }
    }
    @GetMapping("/createQuiz")
    public String quizForm(Model model){
        model.addAttribute("quizWrapper",new QuizWrapper());
        return "quizpage";
    }

    @PostMapping("/createQuiz")
    public String getQuiz(Model model,HttpServletRequest request){
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        Integer duration  = Integer.parseInt(request.getParameter("duration"));
        Integer size  = Integer.parseInt(request.getParameter("numQuestions"));


        Quiz quiz = new Quiz();
        List<Question> questionList =  questionService.getQuestionsBySubject(subject,size);
        quiz.setQuestionList(questionList);
        quiz.setDuration(duration);
        quiz.setName(name);
        System.out.println(quiz);
        System.out.println(quizService.saveQuiz(quiz));
        return "redirect:/getAllQuiz";
    }
    @GetMapping("/getAllQuiz")
    public String showAllQuiz(Model model) {
        List<Quiz> quizList = quizService.allQuiz();
//        for (Quiz quiz : quizList) {
//            quiz.getChoices().size(); // Initialize choices collection
//        }
        model.addAttribute("quizList", quizList);
        return "viewQuiz";
    }
}
