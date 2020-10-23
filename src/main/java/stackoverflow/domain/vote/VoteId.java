package stackoverflow.domain.vote;

import stackoverflow.domain.Id;

import java.util.UUID;

public class VoteId extends Id {

    public VoteId() {
        super();
    }

    public VoteId(String id){
        super(id);
    }

    public VoteId(UUID id){
        super(id);
    }
}
