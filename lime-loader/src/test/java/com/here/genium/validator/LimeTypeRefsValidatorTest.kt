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

package com.here.genium.validator

import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeThrownType
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeModelLoaderException
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeTypedElement
import com.here.genium.model.lime.LimeVisibility
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import java.util.logging.Logger

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

    private val dummyLogger = object : Logger(null, null) {
        override fun severe(msg: String?) {}
    }
    private val validator = LimeTypeRefsValidator(dummyLogger)

    class DummyTypedElement(limeTypeRef: LimeTypeRef) : LimeTypedElement(
        path = EMPTY_PATH,
        visibility = LimeVisibility.PUBLIC,
        comment = "",
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
                { LimeMethod(EMPTY_PATH, returnType = LimeReturnType(it)) }
            ),
            arrayOf<(LimeTypeRef) -> LimeElement>({
                LimeMethod(
                    EMPTY_PATH,
                    thrownType = LimeThrownType(it)
                )
            }),
            arrayOf<(LimeTypeRef) -> LimeElement>(
                { LimeContainer(EMPTY_PATH, type = LimeContainer.ContainerType.CLASS, parent = it) }
            ),
            arrayOf<(LimeTypeRef) -> LimeElement>({ LimeTypeDef(EMPTY_PATH, typeRef = it) }),
            arrayOf<(LimeTypeRef) -> LimeElement>({ LimeException(EMPTY_PATH, errorEnum = it) })
        )
    }
}
