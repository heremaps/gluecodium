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

import static org.junit.Assert.assertEquals;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class InterfaceWithStaticTest {

  private static class InterfaceWithStaticImpl implements InterfaceWithStatic {
    private String foo = "buzz2";

    @Override
    public String regularFunction() { return "buzz1"; }

    @Override
    public String getRegularProperty() { return foo; }

    @Override
    public void setRegularProperty(final String value) { foo = value; }
  }

  @Test
  public void callStaticFunction() {
    final String result = InterfaceWithStatic.staticFunction();

    assertEquals("bar1", result);
  }

  @Test
  public void callStaticPropertyGetter() {
    final String result = InterfaceWithStatic.getStaticProperty();

    assertEquals("bar2", result);
  }

  @Test
  public void callStaticPropertySetter() {
    InterfaceWithStatic.setStaticProperty("wizz1");
    final String result = InterfaceWithStatic.getStaticProperty();
    UseInterfaceWithStatic.resetStaticValue();

    assertEquals("wizz1", result);
  }

  @Test
  public void callStaticFunctionOnProxy() {
    final InterfaceWithStatic instance = new InterfaceWithStaticImpl();

    final String result = UseInterfaceWithStatic.invokeStaticFunction(instance);

    assertEquals("bar1", result);
  }

  @Test
  public void callStaticPropertyGetterOnProxy() {
    final InterfaceWithStatic instance = new InterfaceWithStaticImpl();

    final String result = UseInterfaceWithStatic.invokeStaticGetter(instance);

    assertEquals("bar2", result);
  }

  @Test
  public void callStaticPropertySetterOnProxy() {
    final InterfaceWithStatic instance = new InterfaceWithStaticImpl();

    UseInterfaceWithStatic.invokeStaticSetter(instance, "wizz2");
    final String result = UseInterfaceWithStatic.invokeStaticGetter();
    UseInterfaceWithStatic.resetStaticValue();

    assertEquals("wizz2", result);
  }
}
