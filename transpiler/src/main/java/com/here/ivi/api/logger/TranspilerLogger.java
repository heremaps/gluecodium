/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.LogManager;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.eclipse.xtext.linking.impl.ImportedNamesAdapter;

public class TranspilerLogger {

  public static void initialize(String propertiesFile) {
    try {
      InputStream stream =
          TranspilerLogger.class.getClassLoader().getResourceAsStream(propertiesFile);
      LogManager.getLogManager().readConfiguration(stream);
      // Disable xtext info messages
      Logger.getLogger(ImportedNamesAdapter.class).setLevel(Level.WARN);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
