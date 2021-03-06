package stackoverflow.application.vote;

import stackoverflow.domain.comment.CommentId;
import stackoverflow.domain.person.PersonId;
import stackoverflow.domain.question.QuestionId;
import stackoverflow.domain.vote.IVoteRepo;
import stackoverflow.domain.vote.Vote;

import java.util.Optional;


public class VoteFacade {
    private IVoteRepo voteRepo;

    public VoteFacade(IVoteRepo voteRepo){
        this.voteRepo = voteRepo;
    }

    public void proposeVote(ProposeVoteCmd proposeVoteCmd){
        Vote vote = Vote.builder()
                .personId(proposeVoteCmd.getPersonId())
                .questionId(proposeVoteCmd.getQuestionId())
                .commentId(proposeVoteCmd.getCommentId())
                .build();
        voteRepo.toggle(vote);
    }

    public boolean hasVotedQuestion(QuestionId questionId, PersonId currentUser){
        return voteRepo.hasVotedQuestion(questionId, currentUser);
    }
    public int nbrVoteQuestion(QuestionId questionId){
        return voteRepo.nbrVoteQuestion(questionId);
    }

    public boolean hasVotedComment(CommentId commentId, PersonId personId){
        return voteRepo.hasVotedComment(commentId, personId);
    }

    public int nbrVoteComment(CommentId commentId){
        return voteRepo.nbrVoteComment(commentId);
    }

    public void unvoteForQuestion(QuestionId questionId, PersonId personId) {
        voteRepo.unvoteForQuestion(questionId, personId);
    }

    public void unvoteForComment(CommentId commentId, PersonId personId) {
        voteRepo.unvoteForComment(commentId, personId);
    }

    public Optional<Integer> getCountVoteOfUser(PersonId id) {
        return voteRepo.countAllOfUser(id);
    }

    public Optional<Integer> getCountVote() {
        return voteRepo.countAll();
    }
}
