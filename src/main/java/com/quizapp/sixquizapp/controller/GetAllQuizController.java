package com.quizapp.sixquizapp.controller;

import com.quizapp.sixquizapp.model.DoneQuiz;
import com.quizapp.sixquizapp.model.Question;
import com.quizapp.sixquizapp.model.Quiz;
import com.quizapp.sixquizapp.model.User;
import com.quizapp.sixquizapp.service.DoneQuizService;
import com.quizapp.sixquizapp.service.IQuestionService;
import com.quizapp.sixquizapp.service.QuizService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class GetAllQuizController {
    @Autowired
    QuizService quizService;
    int marks = 0;
    @Autowired
    DoneQuizService doneQuizService;


    private final IQuestionService questionService;

    public GetAllQuizController(IQuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/get-all-quizzes")
    public String showAllQuestions(Model model) {
        List<Question> questions = questionService.getAllQuestions();
        for (Question question : questions) {
            question.getChoices().size(); // Initialize choices collection
        }
        model.addAttribute("questions", questions);
        return "GetAllQuiz";
    }

    @PostMapping("/delete-question")
    public String deleteQuestion(@RequestParam("id") Long id) {
        questionService.deleteQuestion(id);
        return "redirect:/get-all-quizzes";
    }
    @GetMapping("/user/availableQuiz")
    public String viewAllQuiz(Model model) {


        List<Quiz> quizList = quizService.allQuiz();
//        for (Quiz quiz : quizList) {
//            quiz.getChoices().size(); // Initialize choices collection
//        }
        model.addAttribute("quizList", quizList);
        return "userViewQuiz";
    }
    @GetMapping("/user/quiz/do/{id}")
    public String startQuiz(@PathVariable("id") Long id, Model model) {
        Quiz quiz = quizService.getById(id);
        model.addAttribute("quiz", quiz);
        model.addAttribute("currentQuestionIndex", 0); // Initialize the current question index to 0
        return "doQuizForm";
    }

    @PostMapping("/user/quiz/{id}/next")
    public String nextQuestion(@PathVariable("id") Long id, @RequestParam("currentQuestionIndex") int currentQuestionIndex, @RequestParam("userAnswer") String userAnswer, @RequestParam("questionId") Long questionId, Model model, HttpSession session){
        Quiz quiz = quizService.getById(id);
        Question question = questionService.getQuestionById(questionId).get();

        model.addAttribute("quiz", quiz);
        if(currentQuestionIndex == 0){
            marks = 0;
        }
        if(userAnswer.equals(question.getCorrectAnswers().get(0))){
            marks++;
        }
        if(currentQuestionIndex >= quiz.getQuestionList().size() - 1){
            DoneQuiz doneQuiz = new DoneQuiz();
            doneQuiz.setQuiz(quiz);
            if(session == null){
                System.out.println("session is null can not save Quiz");
                return "redirect:/error";
            }
            User user = (User) session.getAttribute("user");
            if(user == null){
                System.out.println("User is null can not save Quiz");
                return "redirect:/error";
            }
            doneQuiz.setUser(user);
            doneQuiz.setMarks(marks);
            model.addAttribute("marks",marks);
            session.setAttribute("marks",marks);
            System.out.println(doneQuiz);
            doneQuizService.saveDoneQuiz(doneQuiz);
            return "redirect:/quiz/marks";
        }
        System.out.println(marks);
        int nextQuestionIndex = currentQuestionIndex + 1;
        model.addAttribute("currentQuestionIndex", nextQuestionIndex);

        return "doQuizForm";
    }

    @GetMapping("/quiz/marks")
    public String getMarks(Model model){
        return "marks";
    }


}
