/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
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
public class ListenerWithErrorsTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  static class TestListener implements ListenerWithErrors {

    private String data = "Doesn't work";

    @Override
    public String getMessage() throws ListenerWithErrors.ErrorEnumException {
      return data;
    }

    @Override
    public void setMessage(String value) throws ListenerWithErrors.ErrorEnumException {
      data = value;
    }
  }

  static class ThrowingListener implements ListenerWithErrors {

    @Override
    public String getMessage() throws ListenerWithErrors.ErrorEnumException {
      throw new ListenerWithErrors.ErrorEnumException(ListenerWithErrors.ErrorEnum.BROKEN);
    }

    @Override
    public void setMessage(String value) throws ListenerWithErrors.ErrorEnumException {
      throw new ListenerWithErrors.ErrorEnumException(ListenerWithErrors.ErrorEnum.BROKEN);
    }
  }

  @Test
  public void stringRoundTripWorks() throws ListenerWithErrors.ErrorEnumException {
    ListenerWithErrors listener = new TestListener();

    ErrorMessenger messenger = ErrorMessenger.create();
    messenger.setMessage(listener, "Works");
    String result = messenger.getMessage(listener);

    assertEquals("Works", result);
  }

  @Test
  public void getMessageErrorRethrown() throws ListenerWithErrors.ErrorEnumException {
    expectedException.expect(ListenerWithErrors.ErrorEnumException.class);
    expectedException.expect(
        FieldMatcher.hasFieldWithValue("error", ListenerWithErrors.ErrorEnum.BROKEN));

    ErrorMessenger.create().getMessage(new ThrowingListener());
  }

  @Test
  public void setMessageErrorRethrown() throws ListenerWithErrors.ErrorEnumException {
    expectedException.expect(ListenerWithErrors.ErrorEnumException.class);
    expectedException.expect(
        FieldMatcher.hasFieldWithValue("error", ListenerWithErrors.ErrorEnum.BROKEN));

    ErrorMessenger.create().setMessage(new ThrowingListener(), "Foo");
  }
}
