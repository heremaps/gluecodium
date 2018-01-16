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
import static junit.framework.Assert.assertNotNull;

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
public class AttributesInterfaceTest {

  private final AttributesInterface attributes =
      AttributesInterfaceFactory.createAttributesInterface();

  @Test
  public void setGetBuiltInTypeAttribute() {
    final long value = 42;

    attributes.setBuiltInTypeAttribute(value);
    long result = attributes.getBuiltInTypeAttribute();

    assertEquals(value, result);
  }

  @Test
  public void setGetStructAttribute() {
    AttributesInterface.ExampleStruct structValue = new AttributesInterface.ExampleStruct();
    structValue.value = 2.71;

    attributes.setStructAttribute(structValue);
    AttributesInterface.ExampleStruct result = attributes.getStructAttribute();

    assertNotNull(result);
    assertEquals(structValue.value, result.value);
  }
}
