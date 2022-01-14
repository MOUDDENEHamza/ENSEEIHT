package com.signit.signit.api.request;

import lombok.Getter;

public class CommandRequest {

    @Getter
    private String query;

    public CommandRequest() {
    }

    public CommandRequest(String query) {
        this.query = query;
    }

}
