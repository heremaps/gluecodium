/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import java.util.Iterator;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class OptimizedListsTest {
  @Test
  public void optimizedListFromMethod() {
    List<VeryBigStruct> result = UseOptimizedList.fetchTheBigOnes();

    assertNotNull(result);
    assertEquals(2, result.size());
    assertEquals("foo", result.get(0).field);
    assertEquals("bar", result.get(1).field);
  }

  @Test
  public void optimizedListIteratorFromMethod() {
    Iterator<VeryBigStruct> result = UseOptimizedList.fetchTheBigOnes().iterator();

    assertNotNull(result);
    assertTrue(result.hasNext());
    assertEquals("foo", result.next().field);
    assertTrue(result.hasNext());
    assertEquals("bar", result.next().field);
    assertFalse(result.hasNext());
  }

  @Test
  public void optimizedListFromProperty() {
    List<UnreasonablyLazyClass> result = UseOptimizedList.getLazyOnes();

    assertNotNull(result);
    assertEquals(2, result.size());
    assertNotNull(result.get(0));
    assertNotNull(result.get(1));
  }

  @Test
  public void optimizedListIteratorFromProperty() {
    Iterator<UnreasonablyLazyClass> result = UseOptimizedList.getLazyOnes().iterator();

    assertNotNull(result);
    assertTrue(result.hasNext());
    assertNotNull(result.next());
    assertTrue(result.hasNext());
    assertNotNull(result.next());
    assertFalse(result.hasNext());
  }

  @Test
  public void optimizedListFromStruct() {
    List<VeryBigStruct> result = UseOptimizedList.getStruct().structs;

    assertNotNull(result);
    assertEquals(2, result.size());
    assertEquals("foo", result.get(0).field);
    assertEquals("bar", result.get(1).field);
  }
}
