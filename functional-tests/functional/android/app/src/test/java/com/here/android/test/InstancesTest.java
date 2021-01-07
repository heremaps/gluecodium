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
import com.here.android.RobolectricApplication;
import com.here.gluecodium.test.functional.BuildConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public class InstancesTest {

  private static final String INSTANCE_ONE_STRING = "simpleInstanceOne";
  private static final String INSTANCE_TWO_STRING = "simpleInstanceTwo";
  private static final String INSTANCE_OTHER_STRING = "simpleInstanceOther";

  @Test
  public void setSameTypeInstances() {
    SimpleInstantiableOne instanceOne = InstancesFactory.createSimpleInstantiableOne();
    SimpleInstantiableOne instanceTwo = InstancesFactory.createSimpleInstantiableOne();
    NestedInstantiableOne nestedInstanceOne = InstancesFactory.createNestedInstantiableOne();
    instanceOne.setStringValue(INSTANCE_ONE_STRING);
    instanceTwo.setStringValue(INSTANCE_TWO_STRING);

    nestedInstanceOne.setSameTypeInstances(instanceOne, instanceTwo);

    SimpleInstantiableOne resultOne = nestedInstanceOne.getInstanceOne();
    SimpleInstantiableOne resultTwo = nestedInstanceOne.getInstanceTwo();
    assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue());
    assertEquals(INSTANCE_TWO_STRING, resultTwo.getStringValue());
  }

  @Test
  public void setSameTypeInstances_identicalInstances() {
    SimpleInstantiableOne instanceOne = InstancesFactory.createSimpleInstantiableOne();
    NestedInstantiableOne nestedInstanceOne = InstancesFactory.createNestedInstantiableOne();
    instanceOne.setStringValue(INSTANCE_ONE_STRING);

    nestedInstanceOne.setSameTypeInstances(instanceOne, instanceOne);

    SimpleInstantiableOne resultOne = nestedInstanceOne.getInstanceOne();
    SimpleInstantiableOne resultTwo = nestedInstanceOne.getInstanceTwo();
    assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue());
    assertEquals(INSTANCE_ONE_STRING, resultTwo.getStringValue());
  }

  @Test
  public void setSameTypeInstances_getNullInstances() {
    NestedInstantiableOne nestedInstanceOne = InstancesFactory.createNestedInstantiableOne();

    assertNull(nestedInstanceOne.getInstanceOne());
    assertNull(nestedInstanceOne.getInstanceTwo());
  }

  @Test
  public void setSameTypeInstances_setNullInstances() {
    NestedInstantiableOne nestedInstanceOne = InstancesFactory.createNestedInstantiableOne();

    nestedInstanceOne.setSameTypeInstances(null, null);

    assertNull(nestedInstanceOne.getInstanceOne());
    assertNull(nestedInstanceOne.getInstanceTwo());
  }

  @Test
  public void setMultipleTypeInstances() {
    SimpleInstantiableOne simpleInstanceOne = InstancesFactory.createSimpleInstantiableOne();
    SimpleInstantiableOne otherInstanceOne = InstancesFactory.createSimpleInstantiableOne();
    SimpleInstantiableTwo simpleInstanceTwo = InstancesFactory.createSimpleInstantiableTwo();
    NestedInstantiableOne nested = InstancesFactory.createNestedInstantiableOne();
    NestedInstantiableTwo nestedInstantiableTwo = InstancesFactory.createNestedInstantiableTwo();
    simpleInstanceOne.setStringValue(INSTANCE_ONE_STRING);
    simpleInstanceTwo.setStringValue(INSTANCE_TWO_STRING);
    otherInstanceOne.setStringValue(INSTANCE_OTHER_STRING);
    nested.setSameTypeInstances(simpleInstanceOne, otherInstanceOne);

    nestedInstantiableTwo.setMultipleTypeInstances(simpleInstanceOne, simpleInstanceTwo, nested);

    assertEquals(INSTANCE_ONE_STRING, nestedInstantiableTwo.getInstantiableOne().getStringValue());
    assertEquals(INSTANCE_TWO_STRING, nestedInstantiableTwo.getInstantiableTwo().getStringValue());
    NestedInstantiableOne nestedInstantiable = nestedInstantiableTwo.getNestedInstantiable();
    assertEquals(INSTANCE_ONE_STRING, nestedInstantiable.getInstanceOne().getStringValue());
    assertEquals(INSTANCE_OTHER_STRING, nestedInstantiable.getInstanceTwo().getStringValue());
  }

  @Test
  public void setSelfInstantiable() {
    NestedInstantiableTwo nestedInstance = InstancesFactory.createNestedInstantiableTwo();
    SimpleInstantiableOne simpleInstanceOne = InstancesFactory.createSimpleInstantiableOne();
    simpleInstanceOne.setStringValue(INSTANCE_ONE_STRING);
    nestedInstance.setMultipleTypeInstances(simpleInstanceOne, null, null);

    nestedInstance.setSelfInstantiable(nestedInstance);

    NestedInstantiableTwo selfInstantiable = nestedInstance.getSelfInstantiable();
    assertEquals(INSTANCE_ONE_STRING, selfInstantiable.getInstantiableOne().getStringValue());
  }
}
