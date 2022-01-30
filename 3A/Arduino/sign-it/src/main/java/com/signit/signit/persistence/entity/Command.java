package com.signit.signit.persistence.entity;

import javax.persistence.*;

@Entity
@Table(name = "command")
public class Command {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "query", nullable = false)
    private String query;

    @Column(name = "result", nullable = false)
    private String result;

    public Command() {
    }

    public Command(String query, String result) {
        this.query = query;
        this.result = result;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

}
