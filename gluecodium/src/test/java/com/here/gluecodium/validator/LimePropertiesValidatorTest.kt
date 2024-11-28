/*
 * Copyright (C) 2016-2024 HERE Europe B.V.
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

import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimePropertiesValidatorTest {
    private val generatorOptions = GeneratorOptions(werror = setOf(GeneratorOptions.WARNING_LIME_PROPERTIES_DOCS))
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val validator = LimePropertiesValidator(mockk(relaxed = true))

    private val typePath = LimePath(emptyList(), listOf("someOuterType", "someType"))
    private val propertyPath = typePath.child("someProperty")

    private val fooPath = typePath.child("foo")
    private val barPath = typePath.child("bar")
    private val anotherTypePath = LimePath(listOf("baz"), listOf("anotherType"))
    private val anotherFooPath = anotherTypePath.child("foo")
    private val anotherBarPath = anotherTypePath.child("bar")

    private val cachedAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.CACHED).build()
    private val cppRefAttributes =
        LimeAttributes.Builder().addAttribute(LimeAttributeType.CPP, LimeAttributeValueType.REF).build()
    private val internalAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()

    private fun propertyForPath(
        path: LimePath,
        attributes: LimeAttributes? = null,
        getter: LimeFunction = getterForPath(path),
        setter: LimeFunction? = null,
        valueComment: LimeComment = LimeComment("Some property"),
    ) = LimeProperty(
        path = path,
        attributes = attributes,
        typeRef = LimeBasicTypeRef.INT,
        getter = getter,
        setter = setter,
        comment = valueComment,
    )

    private fun getterForPath(
        path: LimePath,
        comment: LimeComment = LimeComment("Integer"),
    ) = LimeFunction(
        path = path.child("get"),
        returnType = LimeReturnType(LimeBasicTypeRef.INT, comment = comment),
    )

    private fun setterForPath(
        path: LimePath,
        comment: LimeComment = LimeComment("Integer"),
    ) = LimeFunction(
        path = path.child("set"),
        parameters =
            listOf(
                LimeParameter(
                    path = propertyPath.child("set").child("param"),
                    typeRef = LimeBasicTypeRef.INT,
                    comment = comment,
                ),
            ),
    )

    @Test
    fun validateNoProperties() {
        allElements[typePath.toString()] = object : LimeContainerWithInheritance(typePath) {}
        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesNoNameClash() {
        val limePropertyFoo = propertyForPath(fooPath)
        val limePropertyBar = propertyForPath(barPath)

        allElements[fooPath.toString()] = limePropertyFoo
        allElements[barPath.toString()] = limePropertyBar
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(
                path = typePath,
                properties = listOf(limePropertyFoo, limePropertyBar),
            ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesWithNameClash() {
        // When model is built and two properties have the same name, then their paths are disambiguated via withSuffix().
        val firstFooProperty = propertyForPath(fooPath)
        val secondFooPath = fooPath.withSuffix("1")
        val secondFooProperty = propertyForPath(secondFooPath)

        allElements[fooPath.toString()] = firstFooProperty
        allElements[secondFooPath.toString()] = secondFooProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(
                path = typePath,
                properties = listOf(firstFooProperty, secondFooProperty),
            ) {}

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInheritanceNoOwnProperties() {
        // When model is built and two properties have the same name, then their paths are disambiguated via withSuffix().
        val firstFooProperty = propertyForPath(anotherFooPath)
        val secondFooPath = anotherFooPath.withSuffix("1")
        val secondFooProperty = propertyForPath(secondFooPath)

        // This parent type has name clash.
        val invalidParentType =
            object : LimeContainerWithInheritance(
                path = anotherTypePath,
                properties = listOf(firstFooProperty, secondFooProperty),
            ) {}

        // Note: parent type is not added to the model, because it would cause the validation to fail.
        // In this test case we want to check, that for derived type the validation passes.

        // The derived type does not have any properties.
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(
                typePath,
                parents = listOf(LimeDirectTypeRef(invalidParentType)),
            ) {}

        // Validation passes, because validator iterates over own properties of a given type.
        // The error should be returned when validating the parent type (not current one).
        // Parent type is not included in the model (if it was, then validation would fail).
        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesInheritanceNoNameClash() {
        // Base type has its own 'bar' property.
        val anotherBarProperty = propertyForPath(anotherBarPath)
        val parentTypeWithAnotherBar =
            object : LimeContainerWithInheritance(
                path = anotherTypePath,
                properties = listOf(anotherBarProperty),
            ) {}
        allElements[anotherBarPath.toString()] = anotherBarProperty
        allElements[anotherTypePath.toString()] = parentTypeWithAnotherBar

        // Derived type has its own 'foo' property and 'bar' property from base type.
        val fooProperty = propertyForPath(fooPath)
        allElements[fooPath.toString()] = fooProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(
                typePath,
                parents = listOf(LimeDirectTypeRef(parentTypeWithAnotherBar)),
                properties = listOf(fooProperty),
            ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesInheritanceWithNameClash() {
        // Base type has its own 'foo' property.
        val anotherFooProperty = propertyForPath(anotherFooPath)
        val parentTypeWithAnotherFoo =
            object : LimeContainerWithInheritance(
                path = anotherTypePath,
                properties = listOf(anotherFooProperty),
            ) {}
        allElements[anotherFooPath.toString()] = anotherFooProperty
        allElements[anotherTypePath.toString()] = parentTypeWithAnotherFoo

        // If only base class is in the model, then validation passes.
        assertTrue(validator.validate(limeModel))

        // However, when derived type is added to the model it should fail, because
        // the derived type has two 'foo' variables: its own and from base.
        val fooProperty = propertyForPath(fooPath)
        allElements[fooPath.toString()] = fooProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(
                typePath,
                parents = listOf(LimeDirectTypeRef(parentTypeWithAnotherFoo)),
                properties = listOf(fooProperty),
            ) {}

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateCachedReadOnlyProperty() {
        val readOnlyCachedProperty = propertyForPath(path = propertyPath, attributes = cachedAttributes)

        allElements[propertyPath.toString()] = readOnlyCachedProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(readOnlyCachedProperty)) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateCachedReadWriteProperty() {
        val readWriteCachedProperty =
            propertyForPath(path = propertyPath, attributes = cachedAttributes, setter = setterForPath(propertyPath))

        allElements[propertyPath.toString()] = readWriteCachedProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(readWriteCachedProperty)) {}

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateRefsAttributeInClass() {
        val cppRefProperty = propertyForPath(path = propertyPath, attributes = cppRefAttributes)

        allElements[propertyPath.toString()] = cppRefProperty
        allElements[typePath.toString()] = LimeClass(typePath, properties = listOf(cppRefProperty))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateRefsAttributeInInterface() {
        val cppRefProperty = propertyForPath(path = propertyPath, attributes = cppRefAttributes)

        allElements[propertyPath.toString()] = cppRefProperty
        allElements[typePath.toString()] = LimeInterface(typePath, properties = listOf(cppRefProperty))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateEmptyValueCommentWerrorEnabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true), generatorOptions)
        val noValueCommentProperty = propertyForPath(path = propertyPath, valueComment = LimeComment())

        allElements[propertyPath.toString()] = noValueCommentProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(noValueCommentProperty)) {}

        assertFalse(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateEmptyValueCommentWerrorDisabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true))
        val noValueCommentProperty = propertyForPath(path = propertyPath, valueComment = LimeComment())

        allElements[propertyPath.toString()] = noValueCommentProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(noValueCommentProperty)) {}

        assertTrue(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateMissingGetterReturnDocsWerrorEnabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true), generatorOptions)
        val notDocumentedGetter = getterForPath(path = propertyPath, comment = LimeComment())
        val propertyWithNotDocumentedGetter = propertyForPath(path = propertyPath, getter = notDocumentedGetter)

        allElements[propertyPath.toString()] = propertyWithNotDocumentedGetter
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(propertyWithNotDocumentedGetter)) {}

        assertFalse(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateMissingGetterReturnDocsWerrorDisabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true))
        val notDocumentedGetter = getterForPath(path = propertyPath, comment = LimeComment())
        val propertyWithNotDocumentedGetter = propertyForPath(path = propertyPath, getter = notDocumentedGetter)

        allElements[propertyPath.toString()] = propertyWithNotDocumentedGetter
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(propertyWithNotDocumentedGetter)) {}

        assertTrue(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateMissingSetterParamDocsWerrorEnabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true), generatorOptions)
        val notDocumentedSetter = setterForPath(path = propertyPath, comment = LimeComment())
        val propertyWithNotDocumentedSetterParam = propertyForPath(path = propertyPath, setter = notDocumentedSetter)

        allElements[propertyPath.toString()] = propertyWithNotDocumentedSetterParam
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(propertyWithNotDocumentedSetterParam)) {}

        assertFalse(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateMissingSetterParamDocsWerrorDisabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true))
        val notDocumentedSetter = setterForPath(path = propertyPath, comment = LimeComment())
        val propertyWithNotDocumentedSetterParam = propertyForPath(path = propertyPath, setter = notDocumentedSetter)

        allElements[propertyPath.toString()] = propertyWithNotDocumentedSetterParam
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(propertyWithNotDocumentedSetterParam)) {}

        assertTrue(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateEmptyValueCommentInternalPropertyWerrorEnabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true), generatorOptions)
        val noValueCommentProperty = propertyForPath(path = propertyPath, attributes = internalAttributes, valueComment = LimeComment())

        allElements[propertyPath.toString()] = noValueCommentProperty
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(noValueCommentProperty)) {}

        // Validation passes, because documentation check is skipped for internal properties.
        assertTrue(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateMissingGetterReturnDocsForPropertyOfInternalTypeDocsWerrorEnabled() {
        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true), generatorOptions)
        val notDocumentedGetter = getterForPath(path = propertyPath, comment = LimeComment())
        val propertyWithNotDocumentedGetterReturn = propertyForPath(path = propertyPath, getter = notDocumentedGetter)

        allElements[propertyPath.toString()] = propertyWithNotDocumentedGetterReturn
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(
                path = typePath,
                attributes = internalAttributes,
                properties = listOf(propertyWithNotDocumentedGetterReturn),
            ) {}

        // Validation passes, because documentation check is skipped for properties of internal types.
        assertTrue(werrorValidator.validate(limeModel))
    }

    @Test
    fun validateMissingSetterParamDocsForPropertyOfTypeNestedInInternalOneWerrorEnabled() {
        val internalOuterType = object : LimeContainerWithInheritance(typePath.parent, attributes = internalAttributes) {}
        allElements[typePath.parent.toString()] = internalOuterType

        val werrorValidator = LimePropertiesValidator(mockk(relaxed = true), generatorOptions)
        val notDocumentedSetter = setterForPath(path = propertyPath, comment = LimeComment())
        val propertyWithNotDocumentedSetterParam = propertyForPath(path = propertyPath, setter = notDocumentedSetter)

        allElements[propertyPath.toString()] = propertyWithNotDocumentedSetterParam
        allElements[typePath.toString()] =
            object : LimeContainerWithInheritance(typePath, properties = listOf(propertyWithNotDocumentedSetterParam)) {}

        // Validation passes, because documentation check is skipped because the type hierarchy above property has internal attribute.
        assertTrue(werrorValidator.validate(limeModel))
    }
}
