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

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CollectionsHelperTest {

  @SuppressWarnings("UnnecessaryBoxing")
  private static final Collection<Number> NUMBER_LIST =
      Arrays.asList(
          Float.valueOf(1),
          Integer.valueOf(2),
          Double.valueOf(3),
          Integer.valueOf(4),
          Double.valueOf(5));

  public static final int DEFAULT_VALUE = 123;

  @Test
  public void getAllOfTypeNone() {
    List<Byte> result = CollectionsHelper.getAllOfType(NUMBER_LIST, Byte.class);

    assertEquals(0, result.size());
  }

  @Test
  public void getAllOfTypeSome() {
    List<Integer> result = CollectionsHelper.getAllOfType(NUMBER_LIST, Integer.class);

    assertEquals(2, result.size());
  }

  @Test
  public void getFirstOfTypeNone() {
    Byte result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Byte.class);

    assertEquals(null, result);
  }

  @Test
  public void getFirstOfTypeNoneWithDefault() {
    Byte result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Byte.class, (byte) DEFAULT_VALUE);

    assertEquals(DEFAULT_VALUE, result.byteValue());
  }

  @Test
  public void getFirstOfTypeSome() {
    Integer result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Integer.class);

    assertEquals(2, result.intValue());
  }
}
