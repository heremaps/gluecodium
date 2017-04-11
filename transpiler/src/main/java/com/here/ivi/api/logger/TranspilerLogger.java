package com.here.ivi.api.logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.LogManager;

public class TranspilerLogger {

    static public void initialize(String propertiesFile){
        try {
            InputStream stream = TranspilerLogger.class.getClassLoader().getResourceAsStream(propertiesFile);
            LogManager.getLogManager().readConfiguration(stream);
        }
        catch(IOException e) {
            e.printStackTrace();
        }
    }
}