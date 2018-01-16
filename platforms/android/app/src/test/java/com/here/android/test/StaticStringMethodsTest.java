/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
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
import static junit.framework.Assert.assertTrue;

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
public final class StaticStringMethodsTest {
  @Test
  public void returnInputString() {
    // Arrange
    String inputString = "Foo";

    // Act
    String returnedString = StaticStringMethods.returnInputString(inputString);

    // Assert
    assertEquals(inputString, returnedString);
  }

  @Test
  public void concatenateStrings() {
    // Arrange
    String inputString1 = "Hello";
    String inputString2 = "World";

    // Act
    String returnedString = StaticStringMethods.concatenateStrings(inputString1, inputString2);

    // Assert
    assertEquals(inputString1 + inputString2, returnedString);
  }

  @Test
  public void returnHelloString() {
    // Arrange, act
    String returnedString = StaticStringMethods.returnHelloString();

    // Assert
    assertEquals("hello", returnedString);
  }

  @Test
  public void returnEmpty() {
    // Arrange, act
    String returnedString = StaticStringMethods.returnEmpty();

    // Assert
    assertTrue(returnedString.isEmpty());
  }
}
