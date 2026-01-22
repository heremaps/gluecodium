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
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class KotlinInteropTest {
  private int someJavaFunctionThatTakesListOfOpenClasses(List<SomeOpenNumberWrapperClass> someList) {
    return someList.size();
  }

  private int someJavaFunctionThatTakesListOfInterfaces(List<SomeDummyInterface> someList) {
    return someList.size();
  }

  private int someJavaFunctionThatTakesListOfStructs(List<SomeDummyStruct> someList) {
    return someList.size();
  }

  private int someJavaFunctionThatTakesListOfFinalClass(List<PlainDataStructures> someList) {
    return someList.size();
  }

  private int someJavaFunctionThatTakesListOfEnums(List<SomeDummyEnum> someList) {
    return someList.size();
  }

  @Test
  public void javaFunctionWithCollectionParamsCanBeCalledWithOpenClassFields() {
    SomeStructWithCollection someStruct = new SomeStructWithCollection();
    assertEquals(0, someJavaFunctionThatTakesListOfOpenClasses(someStruct.openClassList));
  }

  @Test
  public void javaFunctionWithCollectionParamsCanBeCalledWithInterfaceFields() {
    SomeStructWithCollection someStruct = new SomeStructWithCollection();
    assertEquals(0, someJavaFunctionThatTakesListOfInterfaces(someStruct.interfacesList));
  }

  @Test
  public void javaFunctionWithCollectionParamsCanBeCalledWithStructFields() {
    SomeStructWithCollection someStruct = new SomeStructWithCollection();
    assertEquals(0, someJavaFunctionThatTakesListOfStructs(someStruct.structsList));
  }

  @Test
  public void javaFunctionWithCollectionParamsCanBeCalledWithFinalClassFields() {
    SomeStructWithCollection someStruct = new SomeStructWithCollection();
    assertEquals(0, someJavaFunctionThatTakesListOfFinalClass(someStruct.finalClassList));
  }

  @Test
  public void javaFunctionWithCollectionParamsCanBeCalledWithEnumFields() {
    SomeStructWithCollection someStruct = new SomeStructWithCollection();
    assertEquals(0, someJavaFunctionThatTakesListOfEnums(someStruct.enumList));
  }

  @Test
  public void whenJavaAccessesStructFieldOfListTypeThenElementsCanBeAdded() {
    SomeStructWithCollection someStruct = new SomeStructWithCollection();
    someStruct.openClassList.add(new SomeOpenNumberWrapperClass(777));

    assertEquals(1, someJavaFunctionThatTakesListOfOpenClasses(someStruct.openClassList));
  }
}
