package com.signit.signit.api;

import com.signit.signit.api.request.CommandRequest;
import com.signit.signit.service.CommandService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/command/")
@CrossOrigin(origins = "http://localhost:4200")
public class CommandController {

    Logger logger = LoggerFactory.getLogger(CommandController.class);

    @Autowired
    CommandService commandService;

    @PostMapping(value = "perform")
    public String performRequest(@RequestBody CommandRequest commandRequest) {
        String result = null;
        try {
            result = commandService.performRequest(commandRequest);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return result;
    }

}
