package stackoverflow.ui.web.answer;

import stackoverflow.application.ServiceReg;
import stackoverflow.application.answer.ProposeAnswerCmd;
import stackoverflow.application.identitymngmt.authenticate.CurrentUserDTO;
import stackoverflow.application.question.QuestionsDTO;
import stackoverflow.domain.answer.AnswerId;
import stackoverflow.domain.question.Question;
import stackoverflow.domain.question.QuestionId;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name="SubmitAnswerCmdServlet", urlPatterns = "/submitAnswer.do")
public class SubmitAnswerPostServlet extends HttpServlet {

    @Inject
    ServiceReg serviceReg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        // if ID malformed or not given, redirect to homepage
        try {
            UUID.fromString(idParam);
        } catch (IllegalArgumentException | NullPointerException ex) {
            resp.sendRedirect("/");
            return;
        }
        CurrentUserDTO currentUser = (CurrentUserDTO) req.getSession().getAttribute("currentUser");
        QuestionId questionId = new QuestionId(req.getParameter("id"));
        ProposeAnswerCmd command = ProposeAnswerCmd.builder()
                .personId(currentUser.getId())
                .questionId(questionId)
                .text(req.getParameter("text"))
                .build();
        serviceReg.getAnswerFacade().proposeAnswer(command);

        String type = null;
        String timestamp = java.time.Clock.systemUTC().instant().toString();
        String userId = currentUser.getId().asString();

        String json = "{\"properties\": {},\"timestamp\": " + timestamp +",\"type\": postR,\"userId\": " + userId + " }";
        //todo envoi event vers API

        // todo récupérer nbAnswers
        int nbAnswers = 0;
        switch(nbAnswers) {
            case 1:
                type = "post1R";
                break;

            case 100:
                type = "post100R";
                break;

            case 1000:
                type = "post1000R";
                break;
        }
        if( type != null) {
            json = "{\"properties\": {},\"timestamp\": " + timestamp + ",\"type\": " + type + ",\"userId\": " + userId + " }";
            // todo envoi event vers api
        }

        resp.sendRedirect("/question?id=" + questionId.asString());
    }
}