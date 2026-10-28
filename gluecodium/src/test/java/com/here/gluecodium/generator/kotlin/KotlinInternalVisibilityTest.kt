/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class KotlinInternalVisibilityTest {
    private val referenceMap = mutableMapOf<String, LimeElement>()
    private val predicate = KotlinInternalVisibilityPredicate(referenceMap)
    private val visibility = KotlinVisibilityResolver(referenceMap, predicate)
    private val synthetic = KotlinSyntheticResolver(predicate)
    private val internal = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
    private val outerPath = LimePath(emptyList(), listOf("Outer"))

    @Test
    fun publicMemberRemainsPublicAndNonSynthetic() {
        val function = LimeFunction(outerPath.child("work"))
        referenceMap[outerPath.toString()] = LimeClass(outerPath)

        assertFalse(predicate.isConceptuallyInternal(function))
        assertEquals("", visibility.resolveName(function))
        assertEquals("", synthetic.resolveName(function))
    }

    @Test
    fun nestedMemberInheritsInternalVisibilityFromAnyAncestor() {
        val nestedPath = outerPath.child("Nested")
        val function = LimeFunction(nestedPath.child("work"))
        referenceMap[outerPath.toString()] = LimeClass(outerPath, attributes = internal)
        referenceMap[nestedPath.toString()] = LimeClass(nestedPath)

        assertTrue(predicate.isConceptuallyInternal(function))
        assertEquals("internal ", visibility.resolveName(function))
        assertEquals("@JvmSynthetic ", synthetic.resolveName(function))
    }

    @Test
    fun internalInterfaceMemberIsSyntheticWithoutInternalModifier() {
        val function = LimeFunction(outerPath.child("work"))
        referenceMap[outerPath.toString()] = LimeInterface(outerPath, attributes = internal)

        assertEquals("", visibility.resolveName(function))
        assertEquals("@JvmSynthetic ", synthetic.resolveName(function))
    }

    @Test
    fun kotlinSpecificInternalAttributeHidesMembers() {
        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.INTERNAL).build()
        referenceMap[outerPath.toString()] = LimeClass(outerPath, attributes = attributes)

        assertEquals("@JvmSynthetic ", synthetic.resolveName(LimeFunction(outerPath.child("work"))))
    }

    @Test
    fun fieldOfInternalTypeIsInternalAndSynthetic() {
        val type = LimeClass(outerPath, attributes = internal)
        val field = LimeField(outerPath.child("field"), typeRef = LimeDirectTypeRef(type))

        assertEquals("internal ", visibility.resolveName(field))
        assertEquals("@JvmSynthetic ", synthetic.resolveName(field))
    }

    @Test
    fun membersOfTypeWithKotlinConverterAreInternalAndSynthetic() {
        val external = LimeExternalDescriptor.Builder().addValue(LimeExternalDescriptor.KOTLIN_TAG, "converter", "Converter").build()
        val converted = LimeStruct(outerPath, external = external)
        referenceMap[outerPath.toString()] = converted
        val field = LimeField(outerPath.child("field"), typeRef = LimeDirectTypeRef(LimeClass(LimePath(emptyList(), listOf("Value")))))

        assertTrue(predicate.isConceptuallyInternal(converted))
        assertEquals("internal ", visibility.resolveName(field))
        assertEquals("@JvmSynthetic ", synthetic.resolveName(field))
    }

    @Test
    fun publicFieldOfTypeWithKotlinConverterRemainsPublic() {
        val external = LimeExternalDescriptor.Builder().addValue(LimeExternalDescriptor.KOTLIN_TAG, "converter", "Converter").build()
        val converted = LimeStruct(LimePath(emptyList(), listOf("Converted")), external = external)
        referenceMap[outerPath.toString()] = LimeStruct(outerPath)
        val field = LimeField(outerPath.child("field"), typeRef = LimeDirectTypeRef(converted))

        assertFalse(predicate.isConceptuallyInternal(field))
        assertEquals("", visibility.resolveName(field))
        assertEquals("", synthetic.resolveName(field))
    }

    @Test
    fun unsupportedElementsFailExplicitly() {
        assertThrows(GluecodiumExecutionException::class.java) { predicate.isConceptuallyInternal("invalid") }
        assertThrows(GluecodiumExecutionException::class.java) { synthetic.resolveName("invalid") }
        assertThrows(GluecodiumExecutionException::class.java) { visibility.resolveName("invalid") }
    }
}
