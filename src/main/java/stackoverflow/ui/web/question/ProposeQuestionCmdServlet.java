package stackoverflow.ui.web.question;

import stackoverflow.application.ServiceReg;
import stackoverflow.application.question.ProposeQuestionCmd;
import stackoverflow.application.question.QuestionFacade;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="SubmitQuestionCommandHandler", urlPatterns = "/submitQuestion.do")
public class ProposeQuestionCmdServlet extends HttpServlet {

    @Inject
    ServiceReg serviceReg;

    private QuestionFacade questionFacade = serviceReg.getQuestionFacade();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProposeQuestionCmd command = ProposeQuestionCmd.builder()
                .author("anonymous")
                .text(req.getParameter("text"))
                .build();
        questionFacade.proposeQuestion(command);
        resp.sendRedirect("/questions");
    }
}