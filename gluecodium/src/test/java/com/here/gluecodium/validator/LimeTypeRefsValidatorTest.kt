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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.LimeVisibility
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeTypeRefsValidatorTest(private val createElement: (LimeTypeRef) -> LimeElement) {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val dummyTypeRef = object : LimeTypeRef() {
        override val elementFullName = ""
        override val type = LimeBasicType(LimeBasicType.TypeId.VOID)
        override val isNullable = false
        override fun asNullable() = this
    }
    private val throwingTypeRef = object : LimeTypeRef() {
        override val elementFullName = ""
        override val type
            get() = throw LimeModelLoaderException("")
        override val isNullable = false
        override fun asNullable() = this
    }

    private val validator = LimeTypeRefsValidator(mockk(relaxed = true))

    class DummyTypedElement(limeTypeRef: LimeTypeRef) : LimeTypedElement(
        path = EMPTY_PATH,
        visibility = LimeVisibility.PUBLIC,
        comment = LimeComment(),
        attributes = null,
        typeRef = limeTypeRef
    )

    @Test
    fun validateWithValidRef() {
        allElements[""] = createElement(dummyTypeRef)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateInvalidRef() {
        allElements[""] = createElement(throwingTypeRef)

        assertFalse(validator.validate(limeModel))
    }

    companion object {
        @Suppress("RemoveExplicitTypeArguments")
        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf<(LimeTypeRef) -> LimeElement>({ DummyTypedElement(it) }),
            arrayOf<(LimeTypeRef) -> LimeElement>(
                { LimeFunction(EMPTY_PATH, returnType = LimeReturnType(it)) }
            ),
            arrayOf<(LimeTypeRef) -> LimeElement>({
                LimeFunction(
                    EMPTY_PATH,
                    thrownType = LimeThrownType(it)
                )
            }),
            arrayOf<(LimeTypeRef) -> LimeElement>({ LimeClass(EMPTY_PATH, parent = it) }),
            arrayOf<(LimeTypeRef) -> LimeElement>({ LimeTypeAlias(EMPTY_PATH, typeRef = it) }),
            arrayOf<(LimeTypeRef) -> LimeElement>({ LimeException(EMPTY_PATH, errorType = it) })
        )
    }
}
