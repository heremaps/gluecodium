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
package com.here.android.hello;

import static org.junit.Assert.assertEquals;

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
public class HelloWorldTypeDefTest {
  private final HelloWorldTypedefs.SomeStruct inputStruct = new HelloWorldTypedefs.SomeStruct();

  @Test
  public void methodWithTypeDef() {
    // Arrange
    inputStruct.text = "foo";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("FOO", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_stringWithSpace() {
    // Arrange
    inputStruct.text = "foo bar";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("FOO BAR", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_stringWithNumber() {
    // Arrange
    inputStruct.text = "1a";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("1A", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_emptyString() {
    // Arrange
    inputStruct.text = "";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_nullString() {
    // Arrange
    inputStruct.text = null;

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("", outputStruct.text);
  }
}
