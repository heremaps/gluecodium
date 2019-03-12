/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.LogManager;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.eclipse.xtext.linking.impl.ImportedNamesAdapter;

/** Initialize logging framework with logging.properties file. */
public class GeniumLogger {

  public static void initialize(String propertiesFile) {
    try {
      InputStream stream = GeniumLogger.class.getClassLoader().getResourceAsStream(propertiesFile);
      LogManager.getLogManager().readConfiguration(stream);
      // Disable Xtext info messages
      Logger.getLogger(ImportedNamesAdapter.class).setLevel(Level.WARN);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
