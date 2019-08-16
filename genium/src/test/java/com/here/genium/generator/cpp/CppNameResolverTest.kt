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

package com.here.genium.generator.cpp

import com.here.genium.Genium
import com.here.genium.generator.common.nameRuleSetFromConfig
import com.here.genium.model.lime.LimeAttributeType.CPP
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_NAME
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_TYPE
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypesCollection
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class CppNameResolverTest(
    private val parentElement: LimeType?,
    private val expectedNormalResult: String,
    private val expectedExternalResult: String
) {
    private val elementPath = (parentElement?.path ?: LIME_ROOT_PATH).child("an_Element")
    private val rootNamespace = listOf("ro", "ot")
    private val nameRuleSet = nameRuleSetFromConfig(Genium.testOptions().cppNameRules)
    private var nameResolver = CppNameResolver(
        rootNamespace,
        parentElement?.let { mapOf(parentElement.fullName to parentElement) } ?: emptyMap(),
        CppNameRules(rootNamespace, nameRuleSet)
    )

    @Test
    fun getNameForNormalElement() {
        val limeElement = object : LimeType(elementPath) { }
        val result = nameResolver.getFullyQualifiedName(limeElement)

        assertEquals(expectedNormalResult, result)
    }

    @Test
    fun getNameForExternalElement() {
        val limeAttributes =
            LimeAttributes.Builder().addAttribute(CPP, EXTERNAL_TYPE).build()
        val limeElement = object : LimeType(elementPath, attributes = limeAttributes) { }

        val result = nameResolver.getFullyQualifiedName(limeElement)

        assertEquals(expectedExternalResult, result)
    }

    @Test
    fun getNameForExternalElementWithExternalName() {
        val limeAttributes = LimeAttributes.Builder()
            .addAttribute(CPP, EXTERNAL_TYPE)
            .addAttribute(CPP, EXTERNAL_NAME, "EXTERNAL_NAME")
            .build()
        val limeElement = object : LimeType(elementPath, attributes = limeAttributes) { }

        val result = nameResolver.getFullyQualifiedName(limeElement)

        assertEquals("EXTERNAL_NAME", result)
    }

    companion object {
        private val LIME_ROOT_PATH = LimePath(listOf("mo", "del"), emptyList())

        @JvmStatic
        @Parameterized.Parameters
        fun testData(): Collection<Array<Any?>> {
            val limeExternalAttributes =
                LimeAttributes.Builder().addAttribute(CPP, EXTERNAL_TYPE).build()
            val limeExternalAttributesWithName =
                LimeAttributes.Builder()
                    .addAttribute(CPP, EXTERNAL_TYPE)
                    .addAttribute(CPP, EXTERNAL_NAME, "ALIEN_PARENT")
                    .build()

            @Suppress("RemoveExplicitTypeArguments")
            return listOf(
                arrayOf<Any?>(
                    null,
                    "::ro::ot::mo::del::AnElement",
                    "::ro::ot::mo::del::an_Element"
                ), arrayOf<Any?>(
                    LimeTypesCollection(LIME_ROOT_PATH.child("type_Collection")),
                    "::ro::ot::mo::del::AnElement",
                    "::ro::ot::mo::del::an_Element"
                ), arrayOf<Any?>(
                    object : LimeType(LIME_ROOT_PATH.child("parent_Element")) {},
                    "::ro::ot::mo::del::ParentElement::AnElement",
                    "::ro::ot::mo::del::ParentElement::an_Element"
                ), arrayOf<Any?>(
                    object : LimeType(
                        LIME_ROOT_PATH.child("parent_Element"),
                        attributes = limeExternalAttributes
                    ) {},
                    "::ro::ot::mo::del::parent_Element::an_Element",
                    "::ro::ot::mo::del::parent_Element::an_Element"
                ), arrayOf<Any?>(
                    object : LimeType(
                        LIME_ROOT_PATH.child("parent_Element"),
                        attributes = limeExternalAttributesWithName
                    ) {},
                    "ALIEN_PARENT::an_Element",
                    "ALIEN_PARENT::an_Element"
                )
            )
        }
    }
}
