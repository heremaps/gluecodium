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
import com.here.android.another.AdditionalErrors.ExternalErrorCode
import com.here.android.another.AdditionalErrors.ExternalException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ErrorsInInterfaceTest {
    class TestListener : ErrorsInInterface {
        private var messagePayload: String = "Doesn't work"

        override fun getMessage(): String {
            return messagePayload
        }
        override fun setMessage(message: String) {
            messagePayload = message
        }

        override fun getMessageWithPayload(): String {
            return messagePayload
        }
        override fun setMessageWithPayload(message: String) {
            messagePayload = message
        }
    }

    class ThrowingListener : ErrorsInInterface {
        override fun getMessage(): String {
            throw ExternalException(ExternalErrorCode.FAILED)
        }
        override fun setMessage(message: String) {
            throw ExternalException(ExternalErrorCode.FAILED)
        }

        override fun getMessageWithPayload(): String {
            throw WithPayloadException(Payload(42, "foo"))
        }
        override fun setMessageWithPayload(message: String) {
            throw WithPayloadException(Payload(42, "foo"))
        }
    }

    @org.junit.Test
    fun stringRoundTripWorks() {
        val listener: ErrorsInInterface = TestListener()
        val messenger: ErrorMessenger = ErrorMessenger()
        messenger.setMessage(listener, "Works")

        val result: String = messenger.getMessage(listener)
        assertEquals("Works", result)
    }

    @org.junit.Test
    fun getMessageErrorRethrown() {
        val exception = assertThrows(ExternalException::class.java) {
            ErrorMessenger().getMessage(ThrowingListener())
        }
        assertEquals(exception.error, ExternalErrorCode.FAILED)
    }

    @org.junit.Test
    fun setMessageErrorRethrown() {
        val exception = assertThrows(ExternalException::class.java) {
            ErrorMessenger().setMessage(ThrowingListener(), "Foo")
        }
        assertEquals(exception.error, ExternalErrorCode.FAILED)
    }

    @org.junit.Test
    fun getMessageWithPayloadErrorRethrown() {
        val exception = assertThrows(WithPayloadException::class.java) {
            ErrorMessenger().getMessageWithPayload(ThrowingListener())
        }
        assertEquals(exception.error, Payload(42, "foo"))
    }

    @org.junit.Test
    fun setMessageWithPayloadErrorRethrown() {
        val exception = assertThrows(WithPayloadException::class.java) {
            ErrorMessenger().setMessageWithPayload(ThrowingListener(), "foo")
        }
        assertEquals(exception.error, Payload(42, "foo"))
    }
}