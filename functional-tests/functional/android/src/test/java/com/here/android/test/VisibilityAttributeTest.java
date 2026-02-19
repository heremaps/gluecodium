/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
import static org.junit.Assert.assertThrows;

import android.os.Build;
import com.here.android.RobolectricApplication;
import java.util.List;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class VisibilityAttributeTest {

  @Test
  public void internalConstructorOfClassCanBeCalled() {
    SomeClassWithInternalMembers someObject = new SomeClassWithInternalMembers();
  }

  @Test
  public void internalFreeArgsCtorCanBeCalled() {
    SomeStructWithInternalFreeArgsCtor someObject = new SomeStructWithInternalFreeArgsCtor(33);

    // Note: 'someObject.someString' is a public field of public structure.
    assertEquals("Special string", someObject.someString);
  }

  @Test
  public void internalAllArgsCtorCanBeCalled() {
    SomeStructWithInternalAllArgsCtor someObject = new SomeStructWithInternalAllArgsCtor(11, "QWERTY");
  }

  @Test
  public void internalFieldCtorCanBeCalled() {
    SomeStructWithInternalFieldConstructor someObject = new SomeStructWithInternalFieldConstructor(77);

    // Note: 'someObject.someString' is a public field of public structure.
    assertEquals("QAZWSX", someObject.someString);
  }

  @Test
  public void valueOfInternalEnumCanBeAccessed() {
    SomeInternalEnum someObject = SomeInternalEnum.TWO;
    assertEquals(SomeInternalEnum.TWO, someObject);
  }

  @Test
  public void internalExceptionCanBeThrown() {
    SomethingBadHappenedException exception = assertThrows(SomethingBadHappenedException.class, () -> {
      throw new SomethingBadHappenedException(SomeInternalEnum.ONE);
    });

    assertEquals(exception.error, SomeInternalEnum.ONE);
  }
}
