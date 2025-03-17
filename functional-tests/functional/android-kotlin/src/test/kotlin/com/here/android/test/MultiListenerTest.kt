/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.junit.Assert.assertEquals
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class MultiListenerTest {

    class MultiReceiver : ReceiverA, ReceiverB {
        var log: MutableList<String> = mutableListOf<String>()

        override fun receiveA(message: String) {
            log.add("ReceiverA: received from Sender: $message")
        }

        override fun receiveB(message: String) {
            log.add("ReceiverB: received from Sender: $message")
        }
    }

    @org.junit.Test
    fun multiSender() {
        val mySender: MultiSender = MultiSender()
        val myMultiReceiver: MultiReceiver = MultiReceiver()

        mySender.addReceiverA(myMultiReceiver)
        mySender.addReceiverB(myMultiReceiver)

        mySender.notifyAReceivers()
        mySender.notifyBReceivers()

        assertEquals(2, myMultiReceiver.log.size)
        assertEquals("ReceiverA: received from Sender: Sent from A", myMultiReceiver.log[0])
        assertEquals("ReceiverB: received from Sender: Sent from B", myMultiReceiver.log[1])
    }
}