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

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class VisibilityAttributeTest {

  @Test
  public void internalFunctionCanBeCalled() {
    SomeClassWithInternalMembers someObject = SomeClassWithInternalMembers.create();
    assertEquals(567, someObject.someInternalFunction());
  }

  @Test
  public void internalConstructorOfClassCanBeCalled() {
    SomeClassWithInternalMembers someObject = new SomeClassWithInternalMembers();
    assertEquals(567, someObject.someInternalFunction());
  }

  @Test
  public void staticInternalFunctionCanBeCalled() {
    assertEquals(123, SomeClassWithInternalMembers.someStaticInternalFunction());
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
    assertEquals("ABCDEF", someObject.someInternalString);
  }

  @Test
  public void internaFunctionOfStructCanBeCalled() {
    SomeStructWithInternalMembers someObject = new SomeStructWithInternalMembers(21);
    assertEquals(888, someObject.someInternalFunction());
  }

}
