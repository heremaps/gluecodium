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
package com.here.android.hello;

import static junit.framework.Assert.assertEquals;

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import com.here.android.hello.HelloWorldErrors.InternalErrorCode;
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
    constants = BuildConfig.class)
public class HelloWorldErrorsTest {

  @Rule public ExpectedException expectedException = ExpectedException.none();

  @Test
  public void helloWorldMethodWithError_throwsCrashed() throws HelloWorldErrors.InternalException {
    expectedException.expect(HelloWorldErrors.InternalException.class);
    expectedException.expectMessage(InternalErrorCode.CRASHED.toString());
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", InternalErrorCode.CRASHED));

    HelloWorldErrors.helloWorldMethodWithError(true);
  }

  @Test
  public void helloWorldMethodWithError_doesNotThrow() throws HelloWorldErrors.InternalException {
    HelloWorldErrors.helloWorldMethodWithError(false);
  }

  @Test
  public void helloWorldMethodWithErrorAndString_throwsCrashed()
      throws HelloWorldErrors.InternalException {
    expectedException.expect(HelloWorldErrors.InternalException.class);
    expectedException.expectMessage(InternalErrorCode.CRASHED.toString());
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", InternalErrorCode.CRASHED));

    HelloWorldErrors.helloWorldMethodWithErrorAndString(true);
  }

  @Test
  public void helloWorldMethodWithErrorAndString_doesNotThrow()
      throws HelloWorldErrors.InternalException {
    String result = HelloWorldErrors.helloWorldMethodWithErrorAndString(false);

    assertEquals("Hello!", result);
  }
}
