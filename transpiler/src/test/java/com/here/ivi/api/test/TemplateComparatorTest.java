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

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class TemplateComparatorTest {

  @Rule public ExpectedException thrown = ExpectedException.none();

  @Test
  public void simplePassing() {
    TemplateComparator.expect("block 1").build().assertContainsExpectedOnly("block 1");
  }

  @Test
  public void simpleFailing() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1").build().assertContainsExpectedOnly("block 2");
  }

  @Test
  public void multipleBlocksDifferentOrderPassing() {
    TemplateComparator.expect("block 1")
        .expect("block 2")
        .expect("block 3")
        .build()
        .assertContainsExpectedOnly("block 1\nblock 3\nblock 2");
  }

  @Test
  public void duplicateBlocksFail() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1").build().assertContainsExpectedOnly("block 1\nblock 1");
  }

  @Test
  public void multipleSameBlocksPassing() {
    TemplateComparator.expect("block 1")
        .expect("block 1")
        .build()
        .assertContainsExpectedOnly("block 1\nblock 1");
  }

  @Test
  public void unexpectedBlockFails() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("").build().assertContainsExpectedOnly("block 1");
  }

  @Test
  public void ignoreUnexpectedBlocksPasses() {
    TemplateComparator.expect("").build().assertContainsExpected("block 1");
  }

  @Test
  public void missingExpectedBlockFails() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1").build().assertContainsExpectedOnly("");
  }

  @Test
  public void intermixedBlocksFail() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1")
        .expect("block 2")
        .build()
        .assertContainsExpectedOnly("block block 2 1");
  }

  @Test
  public void onlyIgnoredBlocksRemainingPasses() {
    TemplateComparator.expect("block 1")
        .ignore("block 2")
        .build()
        .assertContainsExpectedOnly("block 1");
  }

  @Test
  public void expectedBlockIgnoredPasses() {
    TemplateComparator.expect("block 1")
        .ignore("block 1")
        .build()
        .assertContainsExpectedOnly("block 1");
  }

  @Test
  public void ignoredRegexPasses() {
    TemplateComparator.expect("block 1")
        .ignore(".*")
        .build()
        .assertContainsExpectedOnly("block 1block 2");
  }

  @Test
  public void ignoredDoesNotMatchFails() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1")
        .ignore("block 2")
        .build()
        .assertContainsExpectedOnly("block 1\nblock 3");
  }

  @Test
  public void blocksWithTrailingWhitespacePass() {
    TemplateComparator.expect("block 1\n")
        .expect("block 2\n")
        .build()
        .assertContainsExpectedOnly("block 1\nblock 2\n");
  }

  @Test
  public void multipleIgnoredLinesAreIgnored() {
    TemplateComparator.expect("block 1")
        .build()
        .assertContainsExpected("\nignored 1\n\nignored 2\nblock 1");
  }
}
