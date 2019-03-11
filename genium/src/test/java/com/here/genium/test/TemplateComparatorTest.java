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

import org.hamcrest.core.IsNot;
import org.hamcrest.core.StringContains;
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
    TemplateComparator.expect("block 1").build().assertMatchesExactly("block 1");
  }

  @Test
  public void simpleFailing() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1").build().assertMatchesExactly("block 2");
  }

  @Test
  public void multipleBlocksDifferentOrderPassing() {
    TemplateComparator.expect("block 1")
        .expect("block 2")
        .expect("block 3")
        .build()
        .assertMatchesExactly("block 1\nblock 3\nblock 2");
  }

  @Test
  public void duplicateBlocksFail() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1").build().assertMatchesExactly("block 1\nblock 1");
  }

  @Test
  public void multipleSameBlocksPassing() {
    TemplateComparator.expect("block 1")
        .expect("block 1")
        .build()
        .assertMatchesExactly("block 1\nblock 1");
  }

  @Test
  public void unexpectedBlockFails() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("").build().assertMatchesExactly("block 1");
  }

  @Test
  public void ignoreUnexpectedBlocksPasses() {
    TemplateComparator.expect("").build().assertMatches("block 1");
  }

  @Test
  public void missingExpectedBlockFails() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1").build().assertMatchesExactly("");
  }

  @Test
  public void intermixedBlocksFail() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1")
        .expect("block 2")
        .build()
        .assertMatchesExactly("block block 2 1");
  }

  @Test
  public void onlyIgnoredBlocksRemainingPasses() {
    TemplateComparator.expect("block 1").ignore("block 2").build().assertMatchesExactly("block 1");
  }

  @Test
  public void expectedBlockIgnoredPasses() {
    TemplateComparator.expect("block 1").ignore("block 1").build().assertMatchesExactly("block 1");
  }

  @Test
  public void ignoredRegexPasses() {
    TemplateComparator.expect("block 1")
        .ignore(".*")
        .build()
        .assertMatchesExactly("block 1block 2");
  }

  @Test
  public void ignoredDoesNotMatchFails() {
    thrown.expect(AssertionError.class);
    TemplateComparator.expect("block 1")
        .ignore("block 2")
        .build()
        .assertMatchesExactly("block 1\nblock 3");
  }

  @Test
  public void blocksWithTrailingWhitespacePass() {
    TemplateComparator.expect("block 1\n")
        .expect("block 2\n")
        .build()
        .assertMatchesExactly("block 1\nblock 2\n");
  }

  @Test
  public void multipleIgnoredLinesAreIgnored() {
    TemplateComparator.expect("block 1").build().assertMatches("\nignored 1\n\nignored 2\nblock 1");
  }

  @Test
  public void unmatchedBlocksAreContainedInErrorMessage() {
    thrown.expect(AssertionError.class);
    thrown.expectMessage("block 2");
    thrown.expectMessage("block 3");
    TemplateComparator.expect("block 1\n")
        .expect("block 2\n")
        .build()
        .assertMatches("block 1\nblock 3\n");
  }

  @Test
  public void matchedBlocksAreNotContainedInErrorMessage() {
    thrown.expect(AssertionError.class);
    thrown.expectMessage(IsNot.not(new StringContains("block 1")));
    TemplateComparator.expect("block 1\n")
        .expect("block 2\n")
        .build()
        .assertMatches("block 1\nblock 3\n");
  }
}
