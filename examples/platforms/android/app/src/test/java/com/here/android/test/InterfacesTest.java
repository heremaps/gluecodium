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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;

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
public class InterfacesTest {

  private static final String INSTANCE_ONE_STRING = "simpleInterfaceOne";
  private static final String INSTANCE_TWO_STRING = "simpleInterfaceTwo";
  private static final String INSTANCE_OTHER_STRING = "simpleInstanceOther";

  @Test
  public void setSameTypeInterfaces() {
    SimpleInterfaceOne instanceOne = InterfacesFactory.createSimpleInterfaceOne();
    SimpleInterfaceOne instanceTwo = InterfacesFactory.createSimpleInterfaceOne();
    NestedInterfaceOne nestedInterfaceOne = InterfacesFactory.createNestedInterfaceOne();
    instanceOne.setStringValue(INSTANCE_ONE_STRING);
    instanceTwo.setStringValue(INSTANCE_TWO_STRING);

    nestedInterfaceOne.setSameTypeInterfaces(instanceOne, instanceTwo);

    SimpleInterfaceOne resultOne = nestedInterfaceOne.getInterfaceOne();
    SimpleInterfaceOne resultTwo = nestedInterfaceOne.getInterfaceTwo();
    assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue());
    assertEquals(INSTANCE_TWO_STRING, resultTwo.getStringValue());
  }

  @Test
  public void setSameTypeInterfaces_identicalInterface() {
    SimpleInterfaceOne instanceOne = InterfacesFactory.createSimpleInterfaceOne();
    NestedInterfaceOne nestedInterfaceOne = InterfacesFactory.createNestedInterfaceOne();
    instanceOne.setStringValue(INSTANCE_ONE_STRING);

    nestedInterfaceOne.setSameTypeInterfaces(instanceOne, instanceOne);

    SimpleInterfaceOne resultOne = nestedInterfaceOne.getInterfaceOne();
    SimpleInterfaceOne resultTwo = nestedInterfaceOne.getInterfaceTwo();
    assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue());
    assertEquals(INSTANCE_ONE_STRING, resultTwo.getStringValue());
  }

  @Test
  public void setSameTypeInterfaces_getNullInterface() {
    NestedInterfaceOne nestedInterfaceOne = InterfacesFactory.createNestedInterfaceOne();

    assertNull(nestedInterfaceOne.getInterfaceOne());
    assertNull(nestedInterfaceOne.getInterfaceTwo());
  }

  @Test
  public void setSameTypeInterfaces_setNullInterface() {
    NestedInterfaceOne nestedInterfaceOne = InterfacesFactory.createNestedInterfaceOne();

    nestedInterfaceOne.setSameTypeInterfaces(null, null);

    assertNull(nestedInterfaceOne.getInterfaceOne());
    assertNull(nestedInterfaceOne.getInterfaceTwo());
  }

  @Test
  public void setMultipleTypeInterface() {
    SimpleInterfaceOne simpleInterfaceOne = InterfacesFactory.createSimpleInterfaceOne();
    SimpleInterfaceOne otherInterfaceOne = InterfacesFactory.createSimpleInterfaceOne();
    SimpleInterfaceTwo simpleInterfaceTwo = InterfacesFactory.createSimpleInterfaceTwo();
    NestedInterfaceOne nested = InterfacesFactory.createNestedInterfaceOne();
    NestedInterfaceTwo nestedInterfaceTwo = InterfacesFactory.createNestedInterfaceTwo();
    simpleInterfaceOne.setStringValue(INSTANCE_ONE_STRING);
    simpleInterfaceTwo.setStringValue(INSTANCE_TWO_STRING);
    otherInterfaceOne.setStringValue(INSTANCE_OTHER_STRING);
    nested.setSameTypeInterfaces(simpleInterfaceOne, otherInterfaceOne);

    nestedInterfaceTwo.setMultipleTypeInterfaces(simpleInterfaceOne, simpleInterfaceTwo, nested);

    assertEquals(INSTANCE_ONE_STRING, nestedInterfaceTwo.getInterfaceOne().getStringValue());
    assertEquals(INSTANCE_TWO_STRING, nestedInterfaceTwo.getInterfaceTwo().getStringValue());
    NestedInterfaceOne nestedInterface = nestedInterfaceTwo.getNestedInterface();
    assertEquals(INSTANCE_ONE_STRING, nestedInterface.getInterfaceOne().getStringValue());
    assertEquals(INSTANCE_OTHER_STRING, nestedInterface.getInterfaceTwo().getStringValue());
  }

  @Test
  public void setSelfInterface() {
    NestedInterfaceTwo nestedInstance = InterfacesFactory.createNestedInterfaceTwo();
    SimpleInterfaceOne simpleInterfaceOne = InterfacesFactory.createSimpleInterfaceOne();
    simpleInterfaceOne.setStringValue(INSTANCE_ONE_STRING);
    nestedInstance.setMultipleTypeInterfaces(simpleInterfaceOne, null, null);

    nestedInstance.setSelfInterface(nestedInstance);

    NestedInterfaceTwo selfInterface = nestedInstance.getSelfInterface();
    assertEquals(INSTANCE_ONE_STRING, selfInterface.getInterfaceOne().getStringValue());
  }

  @Test
  public void setSelfInterfaceNull() {
    NestedInterfaceTwo nestedInstance = InterfacesFactory.createNestedInterfaceTwo();

    nestedInstance.setSelfInterface(null);

    assertNull(nestedInstance.getSelfInterface());
  }
}
