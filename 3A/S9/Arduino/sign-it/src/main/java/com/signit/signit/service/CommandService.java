package com.signit.signit.service;

import com.signit.signit.api.request.CommandRequest;

public interface CommandService {

    String performRequest(CommandRequest commandRequest);

}
