package com.here.ivi.api.logger;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.eclipse.xtext.linking.impl.ImportedNamesAdapter;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.LogManager;

public class TranspilerLogger {

    static public void initialize(String propertiesFile){
        try {
            InputStream stream = TranspilerLogger.class.getClassLoader().getResourceAsStream(propertiesFile);
            LogManager.getLogManager().readConfiguration(stream);
            // Disable xtext info messages
            Logger.getLogger(ImportedNamesAdapter.class).setLevel(Level.WARN);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
}