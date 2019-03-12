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
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.Collections;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import org.junit.Ignore;
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
public class ListenersReturnValuesTest {

  static class TestMessagePackage implements MessagePackage {
    @Override
    public String unpackMessage() {
      return "Works";
    }
  }

  static class TestListener implements ListenerWithReturn {
    @Override
    public String getMessage() {
      return "Works";
    }

    @Override
    public MessagePackage getPackedMessage() {
      return new TestMessagePackage();
    }

    @Override
    public MessageBox getBoxedMessage() {
      return new MessageBox();
    }

    @Override
    public MessageStruct getStructuredMessage() {
      return new MessageStruct("Works");
    }

    @Override
    public MessageEnum getEnumeratedMessage() {
      return MessageEnum.YES;
    }

    @Override
    public List<String> getArrayedMessage() {
      return Collections.singletonList("Works");
    }

    @Override
    public Map<Byte, String> getMappedMessage() {
      return Collections.singletonMap((byte)0, "Works");
    }

    @Override
    public byte[] getBufferedMessage() {
      return "Works".getBytes();
    }
  }

  @Test
  public void stringReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("Works", delivery.getMessage(envelope));
  }

  @Test
  public void packageReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("Works", delivery.getPackedMessage(envelope));
  }

  @Test
  public void boxReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("Works", delivery.getBoxedMessage(envelope));
  }

  @Test
  public void structReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("Works", delivery.getStructuredMessage(envelope));
  }

  @Test
  public void enumReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("YES", delivery.getEnumeratedMessage(envelope));
  }

  @Test
  public void arrayReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("Works", delivery.getArrayedMessage(envelope));
  }

  @Test
  public void mapReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("Works", delivery.getMappedMessage(envelope));
  }

  @Ignore("TODO: APIGEN-1458: this test is flaky. Fix the underlying issue and unignore it.")
  @Test
  public void byteBufferReturnWorks() {
    ListenerWithReturn envelope = new TestListener();

    MessageDelivery delivery = new MessageDelivery();

    assertEquals("Works", delivery.getBufferedMessage(envelope));
  }
}
