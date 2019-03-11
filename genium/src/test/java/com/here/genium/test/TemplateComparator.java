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

package com.here.genium.test;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import lombok.Builder;
import lombok.Singular;
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

  private static final String UNMATCHED_HEADER =
      "=============== following blocks could not be matched ================\n";
  private static final String UNEXPECTED_HEADER =
      "= following blocks remained unmatched after applying ignore patterns =\n";
  private static final String IGNORE_PATTERNS_HEADER =
      "======================== ignore patterns =============================\n";
  private static final String UNMATCHED_BLOCK_SEPARATOR =
      "\n======================= unmatched block ============================\n";
  private static final String IGNORED_BLOCK_SEPARATOR =
      "\n======================= ignored pattern ============================\n";

  private List<String> expectedBlocks = new LinkedList<>();
  private List<Pattern> ignoredBlocks = new LinkedList<>();
  private List<String> actualSplits = new LinkedList<>();

  @Builder
  @SuppressWarnings("unused")
  private static TemplateComparator create(
      @Singular("expect") List<String> expectedBlocks,
      @Singular("ignore") List<String> ignoredBlocks) {
    TemplateComparator comparator = new TemplateComparator();
    comparator.expectedBlocks = expectedBlocks;
    comparator.ignoredBlocks =
        ignoredBlocks.stream().map(Pattern::compile).collect(Collectors.toList());
    return comparator;
  }

  /** Shortcut for builder().expect(expected) */
  public static TemplateComparatorBuilder expect(String expected) {
    return builder().expect(expected);
  }

  public void assertMatches(String actual) {
    ignoredBlocks.add(Pattern.compile(".*"));
    assertMatchesExactly(actual);
  }

  public void assertMatchesExactly(String actual) {
    // ignore empty lines
    actualSplits.add(actual.replaceAll("( *\n)+", "\n"));
    List<String> unmatchedExpectedBlocks = new ArrayList<>(expectedBlocks);

    ListIterator<String> block = unmatchedExpectedBlocks.listIterator();
    while (block.hasNext()) {
      if (findAndSplit(block.next(), actualSplits)) {
        block.remove();
      }
    }

    if (!unmatchedExpectedBlocks.isEmpty()) {
      Assert.assertEquals(
          UNMATCHED_HEADER + String.join(UNMATCHED_BLOCK_SEPARATOR, unmatchedExpectedBlocks),
          UNMATCHED_HEADER + String.join(UNMATCHED_BLOCK_SEPARATOR, actualSplits));
    }

    for (Pattern ignore : ignoredBlocks) {
      actualSplits =
          actualSplits.stream().flatMap(ignore::splitAsStream).collect(Collectors.toList());
    }
    List<String> remaining =
        actualSplits.stream().filter(split -> !split.trim().isEmpty()).collect(Collectors.toList());

    if (!remaining.isEmpty()) {
      Assert.assertEquals(
          IGNORE_PATTERNS_HEADER
              + String.join(
                  IGNORED_BLOCK_SEPARATOR,
                  ignoredBlocks.stream().map(Pattern::toString).collect(Collectors.toList())),
          UNEXPECTED_HEADER + String.join(UNMATCHED_BLOCK_SEPARATOR, remaining));
    }
  }

  /**
   * Find the expected snippet in the actual text. If it is found the actual text is split up into a
   * block before and after the found block. This is done to avoid matching a block which only
   * exists because a previous match was removed in between.
   *
   * @param expected Expected code block
   * @return true if a match was found, false otherwise
   */
  private static boolean findAndSplit(String expected, List<String> actualSplits) {
    ListIterator<String> split = actualSplits.listIterator();
    while (split.hasNext()) {
      String actual = split.next();
      int index = actual.indexOf(expected);
      if (index != -1) {
        String before = actual.substring(0, index);
        String after = actual.substring(index + expected.length());
        split.set(before);
        split.add(after);
        return true;
      }
    }
    return false;
  }
}
