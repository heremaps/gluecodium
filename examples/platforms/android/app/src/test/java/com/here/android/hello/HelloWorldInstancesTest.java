/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
package com.here.android.hello;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

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
  constants = BuildConfig.class
)
public class HelloWorldInstancesTest {

  private static final String TEST_STRING = "TestString";

  @Test
  public void simpleInstantiable_setAndGet() {
    SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();

    simpleInstantiable.setStringValue(TEST_STRING);

    assertEquals(TEST_STRING, simpleInstantiable.getStringValue());
  }

  @Test
  public void nestedInstantiable_create() {
    SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();

    NestedInstantiable nestedInstantiable = HelloWorldFactory.createNested(simpleInstantiable);

    assertNotNull(nestedInstantiable);
  }

  @Test
  public void nestedInstantiable_get() {
    NestedInstantiable nestedInstantiable =
        HelloWorldFactory.createNested(HelloWorldFactory.createSimple());

    nestedInstantiable.getInstantiable().setStringValue(TEST_STRING);

    assertEquals(TEST_STRING, nestedInstantiable.getInstantiable().getStringValue());
  }

  @Test
  public void nestedInstantiable_set() {
    NestedInstantiable nestedInstantiable =
        HelloWorldFactory.createNested(HelloWorldFactory.createSimple());
    SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();
    simpleInstantiable.setStringValue(TEST_STRING);

    nestedInstantiable.setInstantiable(simpleInstantiable);

    assertEquals(TEST_STRING, nestedInstantiable.getInstantiable().getStringValue());
  }
}
