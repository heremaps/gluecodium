/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.logger

import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.xtext.linking.impl.ImportedNamesAdapter
import java.io.IOException
import java.util.logging.LogManager

/** Initialize logging framework with logging.properties file.  */
object GeniumLogger {
    fun initialize(propertiesFile: String) {
        try {
            LogManager.getLogManager().readConfiguration(
                GeniumLogger::class.java.classLoader.getResourceAsStream(propertiesFile)
            )
            // Disable Xtext info messages
            Logger.getLogger(ImportedNamesAdapter::class.java).level = Level.WARN
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }
}
