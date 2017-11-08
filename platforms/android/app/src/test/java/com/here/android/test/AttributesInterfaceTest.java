package com.here.android.test;


import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public class AttributesInterfaceTest {

  private final AttributesInterface attributes
      = AttributesInterfaceFactory.createAttributesInterface();

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
