/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;

import android.os.Build;
import android.support.compat.BuildConfig;
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
    SimpleInterfaceOne instanceOne = InstancesFactory.createSimpleInterfaceOne();
    SimpleInterfaceOne instanceTwo = InstancesFactory.createSimpleInterfaceOne();
    NestedInterfaceOne nestedInterfaceOne = InstancesFactory.createNestedInterfaceOne();
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
    SimpleInterfaceOne instanceOne = InstancesFactory.createSimpleInterfaceOne();
    NestedInterfaceOne nestedInterfaceOne = InstancesFactory.createNestedInterfaceOne();
    instanceOne.setStringValue(INSTANCE_ONE_STRING);

    nestedInterfaceOne.setSameTypeInterfaces(instanceOne, instanceOne);

    SimpleInterfaceOne resultOne = nestedInterfaceOne.getInterfaceOne();
    SimpleInterfaceOne resultTwo = nestedInterfaceOne.getInterfaceTwo();
    assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue());
    assertEquals(INSTANCE_ONE_STRING, resultTwo.getStringValue());
  }

  @Test
  public void setSameTypeInterfaces_getNullInterface() {
    NestedInterfaceOne nestedInterfaceOne = InstancesFactory.createNestedInterfaceOne();

    assertNull(nestedInterfaceOne.getInterfaceOne());
    assertNull(nestedInterfaceOne.getInterfaceTwo());
  }

  @Test
  public void setSameTypeInterfaces_setNullInterface() {
    NestedInterfaceOne nestedInterfaceOne = InstancesFactory.createNestedInterfaceOne();

    nestedInterfaceOne.setSameTypeInterfaces(null, null);

    assertNull(nestedInterfaceOne.getInterfaceOne());
    assertNull(nestedInterfaceOne.getInterfaceTwo());
  }

  @Test
  public void setMultipleTypeInterface() {
    SimpleInterfaceOne simpleInterfaceOne = InstancesFactory.createSimpleInterfaceOne();
    SimpleInterfaceOne otherInterfaceOne = InstancesFactory.createSimpleInterfaceOne();
    SimpleInterfaceTwo simpleInterfaceTwo = InstancesFactory.createSimpleInterfaceTwo();
    NestedInterfaceOne nested = InstancesFactory.createNestedInterfaceOne();
    NestedInterfaceTwo nestedInterfaceTwo = InstancesFactory.createNestedInterfaceTwo();
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
    NestedInterfaceTwo nestedInstance = InstancesFactory.createNestedInterfaceTwo();
    SimpleInterfaceOne simpleInterfaceOne = InstancesFactory.createSimpleInterfaceOne();
    simpleInterfaceOne.setStringValue(INSTANCE_ONE_STRING);
    nestedInstance.setMultipleTypeInterfaces(simpleInterfaceOne, null, null);

    nestedInstance.setSelfInterface(nestedInstance);

    NestedInterfaceTwo selfInterface = nestedInstance.getSelfInterface();
    assertEquals(INSTANCE_ONE_STRING, selfInterface.getInterfaceOne().getStringValue());
  }
}
