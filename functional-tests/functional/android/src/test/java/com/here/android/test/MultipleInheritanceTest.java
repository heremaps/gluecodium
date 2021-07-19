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

import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class MultipleInheritanceTest {

  private static class MultiInterfaceImpl implements MultiInterface {
    @Override
    public void childFunction() { }

    @Override
    public String getChildProperty() {
      return "";
    }

    @Override
    public void setChildProperty(final String value) { }

    @Override
    public void parentFunction() { }

    @Override
    public String getParentProperty() {
      return "";
    }

    @Override
    public void setParentProperty(final String value) { }

    @Override
    public String parentFunctionLight() {
      return "java face faces";
    }

    @Override
    public String getParentPropertyLight() {
      return "";
    }

    @Override
    public void setParentPropertyLight(final String value) { }
  }

  @Test
  public void fromCppSendUpcastSucceeds() {
    MultiClass instance = MultipleInheritanceFactory.getMultiClass();

    boolean result = instance instanceof NarrowInterface;

    assertTrue(result);
  }

  @Test
  public void fromCppSendDowncastFails() {
    NarrowInterface instance = MultipleInheritanceFactory.getMultiClassAsNarrow();

    boolean result = instance instanceof MultiClass;

    assertFalse(result);
  }

  @Test
  public void fromCppSendTwiceEquals() {
    NarrowInterface instance1 = MultipleInheritanceFactory.getMultiClassSingleton();
    NarrowInterface instance2 = MultipleInheritanceFactory.getMultiClassSingleton();

    boolean result = instance1 == instance2;

    assertTrue(result);
  }

  @Test
  public void fromCppRoundTripNotEquals() {
    NarrowInterface instance = MultipleInheritanceFactory.getMultiClassSingleton();

    boolean result = MultipleInheritanceChecker.checkSingletonEquality(instance);

    assertFalse(result);
  }

  @Test
  public void fromCppRoundTripWithUpcastNotEquals() {
    MultiClass uncastInstance = MultipleInheritanceFactory.getMultiClass();
    NarrowInterface instance = (NarrowInterface)uncastInstance;

    boolean result = MultipleInheritanceChecker.checkSingletonEquality(instance);

    assertFalse(result);
  }

  @Test
  public void fromJavaSendUpcastSucceeds() {
    MultiInterface instance = new MultiInterfaceImpl();

    boolean result = MultipleInheritanceChecker.checkIsNarrow(instance);

    assertTrue(result);
  }

  @Test
  public void fromJavaSendDowncastFails() {
    MultiInterface uncastInstance = new MultiInterfaceImpl();
    NarrowInterface instance = (NarrowInterface)uncastInstance;

    boolean result = MultipleInheritanceChecker.checkIsMultiInterface(instance);

    assertFalse(result);
  }

  @Test
  public void fromJavaSendTwiceEquals() {
    NarrowInterface instance = new MultiInterfaceImpl();

    boolean result = MultipleInheritanceChecker.checkNarrowEquality(instance, instance);

    assertTrue(result);
  }

  @Test
  public void fromJavaRoundTripEquals() {
    MultiInterface uncastInstance = new MultiInterfaceImpl();
    NarrowInterface instance = (NarrowInterface)uncastInstance;

    boolean result = uncastInstance == MultipleInheritanceChecker.narrowRoundTrip(instance);

    assertTrue(result);
  }

  @Test
  public void fromJavaRoundTripWithUpcastNotEquals() {
    MultiInterface instance = new MultiInterfaceImpl();

    boolean result =
        instance == MultipleInheritanceFactory.upcastMultiInterfaceToNarrow(instance);

    assertFalse(result);
  }
}
