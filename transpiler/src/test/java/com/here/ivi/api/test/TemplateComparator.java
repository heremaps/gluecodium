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

package com.here.ivi.api.test;

import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.stream.Collectors;
import org.junit.Assert;

/**
 * Compare template snippets with generated template. Multiple expected snippets can be added and
 * then compared at once. The order is ignored, so is whitespace between individual snippets.
 *
 * <p>Example Usage: TemplateComparator.expect("snippet 1").expect("snippet
 * 2").ignoreUnexpected().assertEquals("actual");
 * TemplateComparator.expect("snippet").assertEquals("Test failure message", "snippet");
 */
public final class TemplateComparator {
  public static final String INCLUDES = "#include.*";

  /**
   * Actual comparison implementation. This is used to reduce the amount of boilerplate a use of
   * this class has to write.
   */
  public static final class Comparison {
    private static final String BLOCK_SEPARATOR =
        "\n========================= next block ==============================\n";
    private final List<String> expectedBlocks = new LinkedList<>();
    private final List<String> actualSplits = new LinkedList<>();
    private boolean ignoreUnexpectedBlocks;

    public Comparison expect(String expected) {
      expectedBlocks.add(expected);
      return this;
    }

    public Comparison ignoreUnexpected() {
      this.ignoreUnexpectedBlocks = true;
      return this;
    }

    public void assertEquals(String actual) {
      assertEquals("", actual);
    }

    public void assertEquals(String message, String actual) {
      actualSplits.add(actual);

      ListIterator<String> block = expectedBlocks.listIterator();
      while (block.hasNext()) {
        if (findAndSplit(block.next())) {
          block.remove();
        }
      }

      List<String> remaining =
          actualSplits
              .stream()
              .filter(split -> !split.trim().isEmpty())
              .collect(Collectors.toList());

      if (!expectedBlocks.isEmpty() || (!remaining.isEmpty() && !ignoreUnexpectedBlocks)) {
        Assert.assertEquals(
            message,
            String.join(BLOCK_SEPARATOR, expectedBlocks),
            String.join(BLOCK_SEPARATOR, remaining));
      }
    }

    /**
     * Find the expected snippet in the actual text. If it is found the actual text is split up into
     * a block before and after the found block. This is done to avoid matching a block which only
     * exists because a previous match was removed in between.
     *
     * @param expected Expected code block
     * @return true if a match was found, false otherwise
     */
    private boolean findAndSplit(String expected) {
      ListIterator<String> split = actualSplits.listIterator();
      while (split.hasNext()) {
        String actual = split.next();
        int index = actual.indexOf(expected);
        if (index != -1) {
          String before = actual.substring(0, index).trim();
          String after = actual.substring(index + expected.length()).trim();
          split.set(before);
          split.add(after);
          return true;
        }
      }
      return false;
    }

    private Comparison() {}
  }

  public static Comparison expect(String expected) {
    return new Comparison().expect(expected);
  }

  public static Comparison ignoreUnexpected() {
    return new Comparison().ignoreUnexpected();
  }

  private TemplateComparator() {}
}
