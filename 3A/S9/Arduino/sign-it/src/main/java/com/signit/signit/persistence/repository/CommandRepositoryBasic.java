package com.signit.signit.persistence.repository;

import com.signit.signit.persistence.entity.Command;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommandRepositoryBasic extends CrudRepository<Command, Long> {

    @Query("SELECT c FROM Command c WHERE c.query = :query")
    List<Command> getCommandListByQuery(@Param("query") String query);

}
