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
public final class HelloWorldDefaultsTest {

  private static final HelloWorldDefaults.StructWithDefaults STRUCT_WITH_DEFAULTS =
      new HelloWorldDefaults.StructWithDefaults();

  private static boolean checkIfStructEqualsDefault(
      final HelloWorldDefaults.StructWithDefaults struct) {

    return struct.intField == 42
        && struct.floatField == 3.14F
        && struct.boolField == true
        && struct.stringField.equals("some string")
        && struct.enumField == HelloWorldDefaults.SomeEnum.BAR_VALUE;
  }

  @Test
  public void checkJavaDefaults() {

    //act
    HelloWorldDefaults.StructWithDefaults myStruct = new HelloWorldDefaults.StructWithDefaults();

    //assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }

  @Test
  public void checkCppDefaults() {

    //act
    HelloWorldDefaults.StructWithDefaults myStruct = HelloWorldDefaults.getStructWithDefaults();

    //assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }
}
