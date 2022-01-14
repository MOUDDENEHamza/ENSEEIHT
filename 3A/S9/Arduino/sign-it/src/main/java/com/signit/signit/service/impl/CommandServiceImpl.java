package com.signit.signit.service.impl;

import com.signit.signit.api.request.CommandRequest;
import com.signit.signit.persistence.entity.Command;
import com.signit.signit.persistence.repository.CommandRepositoryBasic;
import com.signit.signit.service.CommandService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.List;

@Service
public class CommandServiceImpl implements CommandService {

    Logger logger = LoggerFactory.getLogger(CommandServiceImpl.class);

    @Autowired
    CommandRepositoryBasic commandRepositoryBasic;

    @Override
    public String performRequest(CommandRequest commandRequest) {
        String result = null;
        try {
            List<Command> commandList = commandRepositoryBasic.getCommandListByQuery(commandRequest.getQuery().toLowerCase());
            if (commandList != null && commandList.size() > 0) {
                result = commandList.get(0).getResult();
                //Runtime.getRuntime().exec(cmd);
            } else {
                /**JFrame f =new JFrame();
                JOptionPane.showMessageDialog(
                        f,
                        "[CMD : " + commandRequest.getQuery() + "] can't be processed.",
                        "Error",
                        JOptionPane.ERROR_MESSAGE
                );*/
                logger.error("[CMD : " + commandRequest.getQuery() + "] can't be processed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
        return result;
    }

}
