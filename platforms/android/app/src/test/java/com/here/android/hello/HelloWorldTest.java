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
public final class HelloWorldTest {
  private static final String HELLO_PREFIX = "Hello ";

  @Test
  public void helloWorldMethod_String() {
    // Arrange
    String input = "User";

    // Act
    String result = HelloWorld.helloWorldMethod(input);

    // Assert
    assertEquals(HELLO_PREFIX + input, result);
  }

  @Test
  public void helloWorldMethod_EmptyString() {
    // Arrange, act
    String result = HelloWorld.helloWorldMethod("");

    // Assert
    assertEquals(HELLO_PREFIX, result);
  }

  @Test
  public void helloWorldMethod_Null() {
    // Arrange, act
    String result = HelloWorld.helloWorldMethod(null);

    // Assert
    assertEquals(HELLO_PREFIX, result);
  }
}
