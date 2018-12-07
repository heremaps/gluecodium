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

package com.here.genium.common

import java.text.DecimalFormat
import java.util.concurrent.TimeUnit
import java.util.logging.Level
import java.util.logging.Logger

class TimeLogger(
    private val logger: Logger,
    private val timeUnit: TimeUnit,
    private val loggingLevel: Level
) {
    private val timedEntries = mutableListOf<TimedLogEntry>()
    private val formatter = DecimalFormat()

    private inner class TimedLogEntry(val message: String) {
        val time = System.nanoTime()
    }

    fun start() {
        if (!timedEntries.isEmpty()) {
            throw IllegalStateException("Calling start() multiple times is illegal")
        }
        timedEntries.add(TimedLogEntry(""))
    }

    fun addLogEntry(message: String) {
        if (timedEntries.isEmpty()) {
            throw IllegalStateException(
                "Adding a log entry without having called start() in advance is illegal"
            )
        }
        timedEntries.add(TimedLogEntry(message))
    }

    fun log() {
        if (timedEntries.size < 2) {
            return
        }
        val iterator = timedEntries.iterator()
        var lastTime = iterator.next().time
        while (iterator.hasNext()) {
            val current = iterator.next()
            val elapsedTime = current.time - lastTime
            logger.log(
                loggingLevel,
                "${formatter.format(timeUnit.convert(elapsedTime,TimeUnit.NANOSECONDS))} ${timeUnitName(timeUnit)} <${current.message}>"
            )
            lastTime = current.time
        }
    }

    private fun timeUnitName(unit: TimeUnit) = when (unit) {
        TimeUnit.NANOSECONDS -> "ns"
        TimeUnit.MICROSECONDS -> "\u00B5s"
        TimeUnit.MILLISECONDS -> "ms"
        TimeUnit.SECONDS -> "s"
        TimeUnit.MINUTES -> "min"
        TimeUnit.HOURS -> "h"
        TimeUnit.DAYS -> "d"
        else -> null
    }
}
