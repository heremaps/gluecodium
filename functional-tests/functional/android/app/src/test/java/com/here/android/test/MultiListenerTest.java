/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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
import com.here.android.RobolectricApplication;
import com.here.gluecodium.test.functional.BuildConfig;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public class MultiListenerTest {

  static class MultiReceiver implements ReceiverA, ReceiverB {
    public List<String> log = new ArrayList<>();

    @Override
    public void receiveA(String message) {
      log.add("ReceiverA: received from Sender: " + message);
    }

    @Override
    public void receiveB(String message) {
      log.add("ReceiverB: received from Sender: " + message);
    }
  }

  @Test
  public void multiSender() {
    MultiSender mySender = new MultiSender();
    MultiReceiver myMultiReceiver = new MultiReceiver();

    mySender.addReceiverA(myMultiReceiver);
    mySender.addReceiverB(myMultiReceiver);

    mySender.notifyAReceivers();
    mySender.notifyBReceivers();

    assertEquals(2, myMultiReceiver.log.size());
    assertEquals("ReceiverA: received from Sender: Sent from A", myMultiReceiver.log.get(0));
    assertEquals("ReceiverB: received from Sender: Sent from B", myMultiReceiver.log.get(1));
  }
}
