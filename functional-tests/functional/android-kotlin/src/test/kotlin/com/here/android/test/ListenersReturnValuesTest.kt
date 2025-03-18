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
import org.junit.Assert.assertEquals
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

class TestMessagePackage : MessagePackage {
    override fun unpackMessage(): String = "Works"
}

class TestListener : ListenerWithReturn {
    override fun getMessage(): String = "Works"
    override fun getPackedMessage(): MessagePackage = TestMessagePackage()
    override fun getBoxedMessage(): MessageBox = MessageBox()
    override fun getStructuredMessage(): ListenerWithReturn.MessageStruct = ListenerWithReturn.MessageStruct("Works")
    override fun getEnumeratedMessage(): ListenerWithReturn.MessageEnum = ListenerWithReturn.MessageEnum.YES
    override fun getArrayedMessage(): MutableList<String> = mutableListOf("Works")
    override fun getMappedMessage(): MutableMap<Byte, String> = mutableMapOf(0.toByte() to "Works")
    override fun getBufferedMessage(): ByteArray = "Works".toByteArray()
}

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ListenersReturnValuesTest {

    @org.junit.Test
    fun stringReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("Works", delivery.getMessage(envelope))
    }

    @org.junit.Test
    fun packageReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("Works", delivery.getPackedMessage(envelope))
    }

    @org.junit.Test
    fun boxReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("Works", delivery.getBoxedMessage(envelope))
    }

    @org.junit.Test
    fun structReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("Works", delivery.getStructuredMessage(envelope))
    }

    @org.junit.Test
    fun enumReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("YES", delivery.getEnumeratedMessage(envelope))
    }

    @org.junit.Test
    fun arrayReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("Works", delivery.getArrayedMessage(envelope))
    }

    @org.junit.Test
    fun mapReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("Works", delivery.getMappedMessage(envelope))
    }

    @org.junit.Test
    fun byteBufferReturnWorks() {
        val envelope: ListenerWithReturn = TestListener()
        val delivery: MessageDelivery = MessageDelivery()

        assertEquals("Works", delivery.getBufferedMessage(envelope))
    }
}