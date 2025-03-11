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
import com.here.android.another.*
import com.here.android.another.AdditionalErrors.ExternalErrorCode
import com.here.android.another.AdditionalErrors.ExternalException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ErrorsTest {

    @org.junit.Test
    fun methodWithError_throws() {
        val exception = assertThrows(Errors.InternalException::class.java) {
            Errors.methodWithError(true)
        }
        assertEquals(exception.error, Errors.InternalErrorCode.CRASHED)
    }

    @org.junit.Test
    fun methodWithError_doesNotThrow() {
        Errors.methodWithError(false)
    }

    @org.junit.Test
    fun otherMethodWithError_throws() {
        val exception = assertThrows(OtherErrors.InternalException::class.java) {
            OtherErrors.methodWithError(true)
        }
        assertEquals(exception.error, OtherErrors.InternalErrorCode.CRASHED)
    }

    @org.junit.Test
    fun otherMethodWithError_doesNotThrow() {
        OtherErrors.methodWithError(false)
    }

    @org.junit.Test
    fun methodWithErrorAndString_throws() {
        val exception = assertThrows(ExternalException::class.java) {
            Errors.methodWithErrorAndString(true)
        }
        assertEquals(exception.error, ExternalErrorCode.FAILED)
    }

    @org.junit.Test
    fun methodWithErrorAndString_doesNotThrow() {
        val result = Errors.methodWithErrorAndString(false)
        assertEquals("SUCCEEDED", result)
    }

    @org.junit.Test
    fun methodThatExplodes_throws() {
        val exception = assertThrows(TypeCollectionWithEnums.ExplosiveException::class.java) {
            ArraysByteBuffer.methodThatExplodes(true)
        }
        assertEquals(exception.error, TypeCollectionWithEnums.ExplosiveErrorCode.EXPLODED)
    }

    @org.junit.Test
    fun methodThatExplodes_doesNotThrow() {
        val result: ByteArray = ArraysByteBuffer.methodThatExplodes(false)

        assertEquals(0, result[0].toInt())
        assertEquals(1, result[1].toInt())
        assertEquals(2, result[2].toInt())
    }

    @org.junit.Test
    fun methodWithGoodAndBad_throws() {
        val exception = assertThrows(TypeCollectionWithEnums.YetAnotherException::class.java) {
            Errors.methodWithGoodAndBad(true)
        }
        assertEquals(exception.error, TypeCollectionWithEnums.YetAnotherErrorCode.BAD)
    }

    @org.junit.Test
    fun methodWithGoodAndBad_doesNotThrow() {
        val result: TypeCollectionWithEnums.SomeEnum = Errors.methodWithGoodAndBad(false)
        assertEquals(TypeCollectionWithEnums.SomeEnum.ANOTHER_RESULT, result)
    }

    @org.junit.Test
    fun methodWithExternalError_throws() {
        val exception = assertThrows(Errors.ExternalException::class.java) {
            Errors.methodWithExternalError(true)
        }
        assertEquals(exception.error, Errors.ExternalErrorCode.BOOM)
    }

    @org.junit.Test
    fun methodWithExternalError_doesNotThrow() {
        Errors.methodWithExternalError(false)
    }

    @org.junit.Test
    fun getErrorCategoryMessage() {
        val result: String = Errors.getErrorCategoryMessage(Errors.InternalErrorCode.CRASHED)
        assertEquals("::test::Errors::InternalErrorCode::CRASHED", result)
    }

    @org.junit.Test
    fun methodWithPayloadError_throws() {
        val exception = assertThrows(WithPayloadException::class.java) {
            Errors.methodWithPayloadError(true)
        }
        assertEquals(exception.error, Payload(42, "foo error"))
    }

    @org.junit.Test
    fun methodWithPayloadError_doesNotThrow() {
        Errors.methodWithPayloadError(false)
    }

    @org.junit.Test
    fun methodWithPayloadErrorAndValue_throws() {
        val exception = assertThrows(WithPayloadException::class.java) {
            Errors.methodWithPayloadErrorAndReturnValue(true)
        }
        assertEquals(exception.error, Payload(42, "foo error"))
    }

    @org.junit.Test
    fun methodWithPayloadErrorAndValue_doesNotThrow() {
        val result: String = Errors.methodWithPayloadErrorAndReturnValue(false)
        assertEquals("bar value", result)
    }

    @org.junit.Test
    fun testCrashingConstructor() {
        assertThrows(ErrorsNonTrivial.InstantiationException::class.java) {
            ErrorsNonTrivial(object: ErrorsNonTrivial.Callback {
                override fun doSomething() {}
            })
        }
    }

    @org.junit.Test
    fun testCrashingMakeFunction() {
        assertThrows(ErrorsNonTrivial.InstantiationException::class.java) {
            ErrorsNonTrivial.factoryMake(object: ErrorsNonTrivial.Callback {
                override fun doSomething() {}
            })
        }
    }
}