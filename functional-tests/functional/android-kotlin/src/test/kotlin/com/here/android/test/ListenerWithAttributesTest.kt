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
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

class TestListenerWithAttributes : ListenerWithAttributes {
    var data: String = "Doesn't work"

    override var packedMessage: MessagePackage? = null
    override var boxedMessage: MessageBox? = null
    override var enumeratedMessage: ListenerWithReturn.MessageEnum = ListenerWithReturn.MessageEnum.NO

    override var structuredMessage: ListenerWithReturn.MessageStruct
        get() {
            return ListenerWithReturn.MessageStruct(data)
        }
        set(value) {
            data = value.message
        }

    override var message: String
        get() {
            return data
        }
        set(value) {
            data = value
        }

    override var arrayedMessage: List<String>
        get() {
            return listOf(data)
        }
        set(value) {
            data = value.get(0)
        }

    override var mappedMessage: Map<Byte, String>
        get() {
            return mapOf(0.toByte() to data)
        }
        set(value) {
            data = value[0.toByte()]!!
        }

    override var bufferedMessage: ByteArray
        get() {
            return data.toByteArray()
        }
        set(value) {
            data = String(value)
        }
}

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ListenerWithAttributesTest {

    @org.junit.Test
    fun stringRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkMessageRoundTrip(envelope))
    }

    @org.junit.Test
    fun packageRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkPackedMessageRoundTrip(envelope))
    }

    @org.junit.Test
    fun boxRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkBoxedMessageRoundTrip(envelope))
    }

    @org.junit.Test
    fun structRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkStructuredMessageRoundTrip(envelope))
    }

    @org.junit.Test
    fun enumRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkEnumeratedMessageRoundTrip(envelope))
    }

    @org.junit.Test
    fun arrayRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkArrayedMessageRoundTrip(envelope))
    }

    @org.junit.Test
    fun mapRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkMappedMessageRoundTrip(envelope))
    }

    @org.junit.Test
    fun byteBufferRoundTripWorks() {
        val envelope: ListenerWithAttributes = TestListenerWithAttributes()
        val delivery: AttributedMessageDelivery = AttributedMessageDelivery()

        assertTrue(delivery.checkBufferedMessageRoundTrip(envelope))
    }
}