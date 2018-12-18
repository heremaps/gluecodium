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

import static junit.framework.Assert.assertTrue;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.Collections;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
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
public class ListenerWithAttributesTest {

  static class TestListener implements ListenerWithAttributes {

    private String data = "Doesn't work";
    private MessagePackage pakage;
    private MessageBox box;
    private ListenerWithReturn.MessageEnum enumData = ListenerWithReturn.MessageEnum.NO;

    @Override
    public String getMessage() {
      return data;
    }

    @Override
    public void setMessage(String value) {
      data = value;
    }

    @Override
    public MessagePackage getPackedMessage() {
      return pakage;
    }

    @Override
    public void setPackedMessage(MessagePackage value) {
      pakage = value;
    }

    @Override
    public MessageBox getBoxedMessage() {
      return box;
    }

    @Override
    public void setBoxedMessage(MessageBox value) {
      box = value;
    }

    @Override
    public ListenerWithReturn.MessageStruct getStructuredMessage() {
      return new ListenerWithReturn.MessageStruct(data);
    }

    @Override
    public void setStructuredMessage(ListenerWithReturn.MessageStruct value) {
      data = value.message;
    }

    @Override
    public ListenerWithReturn.MessageEnum getEnumeratedMessage() {
      return enumData;
    }

    @Override
    public void setEnumeratedMessage(ListenerWithReturn.MessageEnum value) {
      enumData = value;
    }

    @Override
    public List<String> getArrayedMessage() {
      return Collections.singletonList(data);
    }

    @Override
    public void setArrayedMessage(List<String> value) {
      data = value.get(0);
    }

    @Override
    public Map<Byte, String> getMappedMessage() {
      return Collections.singletonMap((byte)0, data);
    }

    @Override
    public void setMappedMessage(Map<Byte, String> value) {
      data = value.get((byte)0);
    }

    @Override
    public byte[] getBufferedMessage() {
      return data.getBytes();
    }

    @Override
    public void setBufferedMessage(byte[] value) {
      data = new String(value);
    }
  }

  @Test
  public void stringRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkMessageRoundTrip(envelope));
  }

  @Test
  public void packageRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkPackedMessageRoundTrip(envelope));
  }

  @Test
  public void boxRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkBoxedMessageRoundTrip(envelope));
  }

  @Test
  public void structRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkStructuredMessageRoundTrip(envelope));
  }

  @Test
  public void enumRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkEnumeratedMessageRoundTrip(envelope));
  }

  @Test
  public void arrayRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkArrayedMessageRoundTrip(envelope));
  }

  @Test
  public void mapRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkMappedMessageRoundTrip(envelope));
  }

  @Test
  public void byteBufferRoundTripWorks() {
    ListenerWithAttributes envelope = new TestListener();

    AttributedMessageDelivery delivery = new AttributedMessageDelivery();

    assertTrue(delivery.checkBufferedMessageRoundTrip(envelope));
  }
}
