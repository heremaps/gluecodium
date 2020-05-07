/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public final class SimpleEqualityTest {

  final NonEquatableClass class1 = NonEquatableFactory.createNonEquatableClass();
  final NonEquatableClass class2 = NonEquatableFactory.createNonEquatableClass();
  final NonEquatableInterface interface1 = NonEquatableFactory.createNonEquatableInterface();
  final NonEquatableInterface interface2 = NonEquatableFactory.createNonEquatableInterface();

  @Test
  public void simpleEqualityForStructs() {
    SimpleEquatableStruct struct1 =
        new SimpleEquatableStruct(class1, interface1, class2, interface2);
    SimpleEquatableStruct struct2 =
        new SimpleEquatableStruct(class1, interface1, class2, interface2);

    assertEquals(struct1, struct2);
    assertEquals(struct1.hashCode(), struct2.hashCode());
  }

  @Test
  public void simpleEqualityForStructsWithNulls() {
    SimpleEquatableStruct struct1 = new SimpleEquatableStruct(class1, interface1, null, null);
    SimpleEquatableStruct struct2 = new SimpleEquatableStruct(class1, interface1, null, null);

    assertEquals(struct1, struct2);
    assertEquals(struct1.hashCode(), struct2.hashCode());
  }

  @Test
  public void simpleInequalityForStructs() {
    SimpleEquatableStruct struct1 =
        new SimpleEquatableStruct(class1, interface1, class2, interface2);
    SimpleEquatableStruct struct2 =
        new SimpleEquatableStruct(class2, interface2, class1, interface1);

    assertNotEquals(struct1, struct2);
    assertNotEquals(struct1.hashCode(), struct2.hashCode());
  }

  @Test
  public void simpleInequalityForStructsWithNulls() {
    SimpleEquatableStruct struct1 = new SimpleEquatableStruct(class1, interface1, class2, null);
    SimpleEquatableStruct struct2 = new SimpleEquatableStruct(class1, interface1, null, interface2);

    assertNotEquals(struct1, struct2);
    assertNotEquals(struct1.hashCode(), struct2.hashCode());
  }
}
