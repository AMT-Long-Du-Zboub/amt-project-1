package stackoverflow.application.question;

import stackoverflow.domain.question.IQuestionRepo;
import stackoverflow.domain.question.Question;
import stackoverflow.domain.question.QuestionId;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public class QuestionFacade {

    private IQuestionRepo questionRepository;
    public QuestionFacade(IQuestionRepo questionRepository) { this.questionRepository = questionRepository; }

    public void proposeQuestion(ProposeQuestionCmd command) {
        Question submittedQuestion = Question.builder()
            .author(command.getAuthor())
            .title(command.getTitle())
            .text(command.getText())
            .id(command.getId())
            .build();
        questionRepository.save(submittedQuestion);
    }

    public QuestionsDTO getQuestions(QuestionsQuery query){
        Collection<Question> allQuestions = questionRepository.find(query);

        List<QuestionsDTO.QuestionDTO> allQuestionsDTO = allQuestions.stream().map(question -> QuestionsDTO.QuestionDTO.builder()
                .title(question.getTitle())
                .text(question.getText())
                .id(question.getId())
                .build()).collect(Collectors.toList());

        return QuestionsDTO.builder()
                .questions(allQuestionsDTO)
                .build();
    }

    public QuestionsDTO.QuestionDTO getQuestionbyId(QuestionId id){
        Question question = questionRepository.findById(id).orElse(null);
        if( question == null)
            return null;
        return QuestionsDTO.QuestionDTO.builder()
                .text(question.getText())
                .id(question.getId())
                .title(question.getTitle())
                .build();
    }


}
