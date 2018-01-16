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
public class EnumsTest {

  @Test
  public void flipEnumTC() {
    InternalErrorTypeCollection errorEnum = InternalErrorTypeCollection.ERROR_FATAL;
    assertEquals(
        InternalErrorTypeCollection.ERROR_NONE,
        EnumsTypeCollectionMethods.flipEnumValue(errorEnum));
  }

  @Test
  public void flipEnum() {
    Enums.InternalError errorEnum = Enums.InternalError.ERROR_FATAL;
    assertEquals(Enums.InternalError.ERROR_NONE, Enums.flipEnumValue(errorEnum));
  }

  @Test
  public void extractEnumFromStruct() {
    Enums.ErrorStruct errorStruct = new Enums.ErrorStruct();
    errorStruct.type = Enums.InternalError.ERROR_NONE;
    assertEquals(Enums.InternalError.ERROR_FATAL, Enums.extractEnumFromStruct(errorStruct));
  }

  @Test
  public void extractEnumFromStructTC() {
    ErrorStructTypeCollection errorStruct = new ErrorStructTypeCollection();
    errorStruct.type = InternalErrorTypeCollection.ERROR_NONE;
    assertEquals(
        InternalErrorTypeCollection.ERROR_FATAL,
        EnumsTypeCollectionMethods.extractEnumFromStruct(errorStruct));
  }

  @Test
  public void createStructWithEnumInside() {
    String message = "myMessage";
    Enums.ErrorStruct result =
        Enums.createStructWithEnumInside(Enums.InternalError.ERROR_FATAL, message);

    assertEquals(Enums.InternalError.ERROR_NONE, result.type);
    assertEquals(message, result.message);
  }

  @Test
  public void createStructWithEnumInsideTC() {
    String message = "myMessage";
    ErrorStructTypeCollection result =
        EnumsTypeCollectionMethods.createStructWithEnumInside(
            InternalErrorTypeCollection.ERROR_FATAL, message);

    assertEquals(InternalErrorTypeCollection.ERROR_NONE, result.type);
    assertEquals(message, result.message);
  }
}
