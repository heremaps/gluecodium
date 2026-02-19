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

class ImplementationOfSomeInternalInterface implements SomeInternalInterface {
  @Override
  public int foo() {
    return 709;
  }

  @Override
  public long bar() {
    return 121;
  }
}

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class VisibilityAttributeTest {

  @Test
  public void internalConstructorOfClassCanBeCalled() {
    SomeClassWithInternalMembers someObject = new SomeClassWithInternalMembers();
  }

  @Test
  public void functionOfInternalClassCanBeCalled() {
    SomeInternalClassWithMembers someObject = SomeInternalClassWithMembers.create();
    assertEquals(987, someObject.someFunction());
  }

  @Test
  public void staticFunctionOfInternalClassCanBeCalled() {
    assertEquals(765, SomeInternalClassWithMembers.someStaticFunction());
  }

  @Test
  public void fieldOfInternalStructCanBeAccessed() {
    SomeInternalStructWithMembers someObject = SomeInternalStructWithMembers.create();
    assertEquals(123, someObject.someInteger);
    assertEquals(456, someObject.someLong);
  }

  @Test
  public void functionOfInternalStructCanBeCalled() {
    SomeInternalStructWithMembers someObject = SomeInternalStructWithMembers.create();
    assertEquals(32, someObject.someFunction());
  }

  @Test
  public void internalFieldOfStructCanBeAccessed() {
    SomeStructWithInternalMembers someObject = new SomeStructWithInternalMembers(21);
    assertEquals(21, someObject.someInteger);
    assertEquals(444, someObject.someLong);
  }

  @Test
  public void internalFreeArgsCtorCanBeCalled() {
    SomeStructWithInternalFreeArgsCtor someObject = new SomeStructWithInternalFreeArgsCtor(33);
    assertEquals("Special string", someObject.someString);
  }

  @Test
  public void internalAllArgsCtorCanBeCalled() {
    SomeStructWithInternalAllArgsCtor someObject = new SomeStructWithInternalAllArgsCtor(11, "QWERTY");
  }

  @Test
  public void internalFieldCtorCanBeCalled() {
    SomeStructWithInternalFieldConstructor someObject = new SomeStructWithInternalFieldConstructor(77);
    assertEquals("QAZWSX", someObject.someString);
  }

  @Test
  public void valueOfInternalEnumCanBeAccessed() {
    SomeInternalEnum someObject = SomeInternalEnum.TWO;
    assertEquals(SomeInternalEnum.TWO, someObject);
  }

  @Test
  public void internaInterfaceFromJavaCanBeUsed() {
    ImplementationOfSomeInternalInterface someInterfaceImpl = new ImplementationOfSomeInternalInterface();
    SomeStructWithInternalMembers someObject = new SomeStructWithInternalMembers(21);
  }

  @Test
  public void internalExceptionCanBeThrown() {
    SomethingBadHappenedException exception = assertThrows(SomethingBadHappenedException.class, () -> {
      throw new SomethingBadHappenedException(SomeInternalEnum.ONE);
    });

    assertEquals(exception.error, SomeInternalEnum.ONE);
  }
}
