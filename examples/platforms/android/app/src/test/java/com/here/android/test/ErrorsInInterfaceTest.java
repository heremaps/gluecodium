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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import com.here.android.another.AdditionalErrors.ExternalErrorCode;
import com.here.android.another.AdditionalErrors.ExternalException;
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
public class ErrorsInInterfaceTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  static class TestListener implements ErrorsInInterface {

    private String data = "Doesn't work";

    @Override
    public String getMessage() throws ExternalException {
      return data;
    }

    @Override
    public void setMessage(String value) throws ExternalException {
      data = value;
    }

    @Override
    public String getMessageWithPayload() throws WithPayloadException {
      return data;
    }

    @Override
    public void setMessageWithPayload(String value) throws WithPayloadException {
      data = value;
    }
  }

  static class ThrowingListener implements ErrorsInInterface {

    @Override
    public String getMessage() throws ExternalException {
      throw new ExternalException(ExternalErrorCode.FAILED);
    }

    @Override
    public void setMessage(String value) throws ExternalException {
      throw new ExternalException(ExternalErrorCode.FAILED);
    }

    @Override
    public String getMessageWithPayload() throws WithPayloadException {
      throw new WithPayloadException(new Payload(42, "foo"));
    }

    @Override
    public void setMessageWithPayload(String value) throws WithPayloadException {
      throw new WithPayloadException(new Payload(42, "foo"));
    }
  }

  @Test
  public void stringRoundTripWorks() throws ExternalException {
    ErrorsInInterface listener = new TestListener();

    ErrorMessenger messenger = new ErrorMessenger();
    messenger.setMessage(listener, "Works");
    String result = messenger.getMessage(listener);

    assertEquals("Works", result);
  }

  @Test
  public void getMessageErrorRethrown() throws ExternalException {
    expectedException.expect(ExternalException.class);
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", ExternalErrorCode.FAILED));

    new ErrorMessenger().getMessage(new ThrowingListener());
  }

  @Test
  public void setMessageErrorRethrown() throws ExternalException {
    expectedException.expect(ExternalException.class);
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", ExternalErrorCode.FAILED));

    new ErrorMessenger().setMessage(new ThrowingListener(), "Foo");
  }

  @Test
  public void getMessageWithPayloadErrorRethrown() throws WithPayloadException {
    expectedException.expect(WithPayloadException.class);
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", new Payload(42, "foo")));

    new ErrorMessenger().getMessageWithPayload(new ThrowingListener());
  }

  @Test
  public void setMessageWithPayloadErrorRethrown() throws WithPayloadException {
    expectedException.expect(WithPayloadException.class);
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", new Payload(42, "foo")));

    new ErrorMessenger().setMessageWithPayload(new ThrowingListener(), "Foo");
  }
}
