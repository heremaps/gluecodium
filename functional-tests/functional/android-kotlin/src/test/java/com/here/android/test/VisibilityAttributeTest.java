/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

// Internal constructors of Kotlin types are private and are created through synthetic factories,
// therefore Java code cannot call them. Kotlin calls them with regular constructor syntax.
@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class VisibilityAttributeTest {
  @Test
  public void internalConstructorOfClassIsHiddenFromJava() throws ReflectiveOperationException {
    assertHiddenConstructor(SomeClassWithInternalMembers.class);
  }

  @Test
  public void internalFreeArgsCtorIsHiddenFromJava() throws ReflectiveOperationException {
    assertHiddenConstructor(SomeStructWithInternalFreeArgsCtor.class, int.class);
  }

  @Test
  public void internalAllArgsCtorIsHiddenFromJava() throws ReflectiveOperationException {
    assertHiddenConstructor(SomeStructWithInternalAllArgsCtor.class, int.class, String.class);
  }

  @Test
  public void internalFieldCtorIsHiddenFromJava() throws ReflectiveOperationException {
    assertHiddenConstructor(SomeStructWithInternalFieldConstructor.class, int.class);
  }

  @Test
  public void valueOfInternalEnumCanBeAccessed() {
    assertEquals(SomeInternalEnum.TWO, SomeInternalEnum.TWO);
  }

  @Test
  public void internalExceptionConstructorIsHiddenFromJava() throws ReflectiveOperationException {
    assertHiddenConstructor(SomethingBadHappenedException.class, SomeInternalEnum.class);
  }

  private static void assertHiddenConstructor(Class<?> type, Class<?>... parameterTypes)
      throws ReflectiveOperationException {
    assertTrue(Modifier.isPrivate(type.getDeclaredConstructor(parameterTypes).getModifiers()));

    Class<?> companion = type.getField("Companion").getType();
    boolean hasFactory = false;
    for (Method method : companion.getDeclaredMethods()) {
      if (method.getName().startsWith("invoke")) {
        hasFactory = true;
        assertTrue(method.toString(), method.isSynthetic());
      }
    }
    assertTrue(type.getName(), hasFactory);
  }
}
