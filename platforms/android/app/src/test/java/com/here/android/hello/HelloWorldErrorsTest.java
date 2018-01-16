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

import static junit.framework.Assert.assertEquals;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import com.here.android.hello.HelloWorldErrors.InternalErrors;
import com.here.android.matchers.FieldMatcher;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public class HelloWorldErrorsTest {

  @Rule public ExpectedException expectedException = ExpectedException.none();

  @Test
  public void helloWorldMethodWithError_throwsCrashed() throws InternalErrorsException {
    expectedException.expect(InternalErrorsException.class);
    expectedException.expectMessage(Integer.toString(InternalErrors.CRASHED.value));
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", InternalErrors.CRASHED));

    HelloWorldErrors.helloWorldMethodWithError(true);
  }

  @Test
  public void helloWorldMethodWithError_doesNotThrow() throws InternalErrorsException {
    HelloWorldErrors.helloWorldMethodWithError(false);
  }

  @Test
  public void helloWorldMethodWithErrorAndString_throwsCrashed() throws InternalErrorsException {
    expectedException.expect(InternalErrorsException.class);
    expectedException.expectMessage(Integer.toString(InternalErrors.CRASHED.value));
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", InternalErrors.CRASHED));

    HelloWorldErrors.helloWorldMethodWithErrorAndString(true);
  }

  @Test
  public void helloWorldMethodWithErrorAndString_doesNotThrow() throws InternalErrorsException {
    String result = HelloWorldErrors.helloWorldMethodWithErrorAndString(false);

    assertEquals("Hello!", result);
  }
}
