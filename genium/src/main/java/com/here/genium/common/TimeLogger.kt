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

package com.here.genium.common;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TimeLogger {

  private final List<TimedLogEntry> timedEntries = new LinkedList<>();
  private final NumberFormat formatter = new DecimalFormat();
  private final Logger logger;
  private final TimeUnit timeUnit;
  private final Level loggingLevel;

  private class TimedLogEntry {
    public final long time;
    public final String message;

    TimedLogEntry(final String message) {
      time = System.nanoTime();
      this.message = message;
    }
  }

  public TimeLogger(final Logger logger, final TimeUnit timeUnit, final Level loggingLevel) {
    this.logger = logger;
    this.timeUnit = timeUnit;
    this.loggingLevel = loggingLevel;
  }

  public void start() {
    if (!timedEntries.isEmpty()) {
      throw new IllegalStateException("Calling start() multiple times is illegal");
    }
    timedEntries.add(new TimedLogEntry(""));
  }

  public void addLogEntry(final String message) {
    if (timedEntries.isEmpty()) {
      throw new IllegalStateException(
          "Adding a log entry without having called start() in advance is illegal");
    }
    timedEntries.add(new TimedLogEntry(message));
  }

  public void log() {

    if (timedEntries.size() < 2) {
      return;
    }
    Iterator<TimedLogEntry> iterator = timedEntries.iterator();
    long lastTime = iterator.next().time;
    while (iterator.hasNext()) {
      TimedLogEntry current = iterator.next();
      long elapsedTime = current.time - lastTime;
      logger.log(
          loggingLevel,
          formatter.format(timeUnit.convert(elapsedTime, TimeUnit.NANOSECONDS))
              + " "
              + timeUnitName(timeUnit)
              + " <"
              + current.message
              + ">");
      lastTime = current.time;
    }
  }

  private static String timeUnitName(TimeUnit unit) {
    switch (unit) {
      case NANOSECONDS:
        return "ns";
      case MICROSECONDS:
        return "\u00B5s";
      case MILLISECONDS:
        return "ms";
      case SECONDS:
        return "s";
      case MINUTES:
        return "min";
      case HOURS:
        return "h";
      case DAYS:
        return "d";
      default:
        return null;
    }
  }
}
