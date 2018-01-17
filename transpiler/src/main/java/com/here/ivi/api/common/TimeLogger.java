/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.common;

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
