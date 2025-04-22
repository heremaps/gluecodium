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

package com.here.gluecodium.validator

import com.here.gluecodium.cli.OptionReaderException
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeDocRulesValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val outerTypePath = LimePath(emptyList(), listOf("SomeOuterType"))
    private val innerTypePath = outerTypePath.child("SomeInnerType")

    @Test
    fun creationFailsForTwoRulesWithTheSameName() {
        // Given two validation rules with the same name.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = listOf("class", "struct"),
                    regex = "It is a special type",
                    isWarningOnly = false,
                ),
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = listOf("interface", "class", "struct"),
                    regex = "@SPECIAL_TYPE",
                    isWarningOnly = false,
                ),
            )

        // When constructing validator.
        val exception =
            assertThrows(OptionReaderException::class.java) {
                LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)
            }

        // Then error is raised.
        assertTrue(exception.message!!.startsWith("Multiple doc validation rules with the same name = 'SPECIAL_RULE'"))
    }

    @Test
    fun creationFailsForRuleWithRegexThatDoesNotCompile() {
        // Given a validation rule with invalid regex [missing ')']
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "MY_RULE",
                    limeElements = listOf("class", "struct"),
                    regex = "(a|b",
                    isWarningOnly = false,
                ),
            )

        // When constructing validator.
        val exception =
            assertThrows(OptionReaderException::class.java) {
                LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)
            }

        // Then error is raised.
        assertTrue(exception.message!!.startsWith("Cannot compile regex for doc validation rule 'MY_RULE'. Exception ="))
    }

    @Test
    fun creationFailsForRuleWithoutLimeElementsDefined() {
        // Given a validation rule without specified lime elements.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = emptyList(),
                    regex = "It is a special type",
                    isWarningOnly = false,
                ),
            )

        // When constructing validator.
        val exception =
            assertThrows(OptionReaderException::class.java) {
                LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)
            }

        // Then error is raised.
        assertTrue(exception.message!!.startsWith("No lime elements specified for doc validation rule: 'SPECIAL_RULE'"))
    }

    @Test
    fun creationFailsForRuleWithUnknownElementTypeDefined() {
        // Given a validation rule with unknown lime element specified.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = listOf("class", "mixin"),
                    regex = "It is a special type",
                    isWarningOnly = false,
                ),
            )

        // When constructing validator.
        val exception =
            assertThrows(OptionReaderException::class.java) {
                LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)
            }

        // Then error is raised.
        assertTrue(exception.message!!.startsWith("Unknown element type 'mixin' for rule 'SPECIAL_RULE'"))
    }

    @Test
    fun validationPassesForClassMatchingSimpleRule() {
        // Given two classes in LimeModel, that are obeying the rules.
        allElements[outerTypePath.toString()] =
            LimeClass(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type class. ",
                                "" to "It is a special type",
                            ),
                    ),
            )

        allElements[innerTypePath.toString()] =
            LimeClass(
                path = innerTypePath,
                comment =
                    LimeComment(
                        path = innerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important inner type class. ",
                                "" to "It is a special type",
                            ),
                    ),
            )

        // And given a correct validation rule for classes.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = listOf("class"),
                    regex = "It is a special type",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationFailsForClassNotMatchingRule() {
        // Given two classes in LimeModel, where one does not comply with the rule.
        allElements[outerTypePath.toString()] =
            LimeClass(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type class. ",
                                "" to "It is a special type",
                            ),
                    ),
            )

        allElements[innerTypePath.toString()] =
            LimeClass(
                path = innerTypePath,
                comment =
                    LimeComment(
                        path = innerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important inner type class. ",
                                "" to "It is a normal type",
                            ),
                    ),
            )

        // And given a correct validation rule for classes.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = listOf("class"),
                    regex = "It is a special type",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(validationResult)
    }

    @Test
    fun validationPassesForClassesMatchingComplexRule() {
        // Given two classes in LimeModel, that are obeying the rules.
        allElements[outerTypePath.toString()] =
            LimeClass(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type class. ",
                                "" to "It is a STRONG type",
                            ),
                    ),
            )

        allElements[innerTypePath.toString()] =
            LimeClass(
                path = innerTypePath,
                comment =
                    LimeComment(
                        path = innerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important inner type class. ",
                                "" to "It is a WEAK type",
                            ),
                    ),
            )

        // And given a correct validation rule for classes.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = listOf("class"),
                    regex = "It is a (STRONG|WEAK) type",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationPassesForStructMatchingRule() {
        // Given a struct in LimeModel, which obeys the rules.
        allElements[outerTypePath.toString()] =
            LimeStruct(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type struct. ",
                                "" to "@POD_STRUCT",
                            ),
                    ),
            )

        // And given a correct validation rule for structs.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Plain old data structure",
                    limeElements = listOf("struct"),
                    regex = "@POD_STRUCT",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationFailsForStructNotMatchingRule() {
        // Given a struct in LimeModel, which does not obey the rules.
        allElements[outerTypePath.toString()] =
            LimeStruct(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type struct. ",
                            ),
                    ),
            )

        // And given a correct validation rule for structs.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Plain old data structure",
                    limeElements = listOf("struct"),
                    regex = "@POD_STRUCT",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(validationResult)
    }

    @Test
    fun validationPassesForInterfaceMatchingRule() {
        // Given an interface in LimeModel, which obeys the rules.
        allElements[outerTypePath.toString()] =
            LimeInterface(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type interface. ",
                                "" to "@PUBLIC_INTERFACE",
                            ),
                    ),
            )

        // And given a correct validation rule for interfaces.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Public interface",
                    limeElements = listOf("interface"),
                    regex = "@PUBLIC_INTERFACE",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationFailsForInterfaceNotMatchingRule() {
        // Given an interface in LimeModel, which does not obey the rules.
        allElements[outerTypePath.toString()] =
            LimeInterface(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type interface. ",
                            ),
                    ),
            )

        // And given a correct validation rule for interfaces.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Public interface",
                    limeElements = listOf("interface"),
                    regex = "@PUBLIC_INTERFACE",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(validationResult)
    }

    @Test
    fun validationPassesForEnumMatchingRule() {
        // Given an enumeration in LimeModel, which obeys the rules.
        allElements[outerTypePath.toString()] =
            LimeEnumeration(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type enumeration. ",
                                "" to "@ERROR_CODE",
                            ),
                    ),
            )

        // And given a correct validation rule for enumerations.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Error code",
                    limeElements = listOf("enum"),
                    regex = "@ERROR_CODE",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationFailsForEnumNotMatchingRule() {
        // Given an enumeration in LimeModel, which does not obey the rules.
        allElements[outerTypePath.toString()] =
            LimeEnumeration(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type enumeration. ",
                            ),
                    ),
            )

        // And given a correct validation rule for enumerations.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Error code",
                    limeElements = listOf("enum"),
                    regex = "@ERROR_CODE",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(validationResult)
    }

    @Test
    fun validationPassesForFunctionMatchingRule() {
        // Given a class with function in LimeModel, which obeys the rules.
        val functionPath = outerTypePath.child("someFunction")
        val function =
            LimeFunction(
                path = functionPath,
                comment =
                    LimeComment(
                        path = functionPath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important function. ",
                                "" to "@CallingConvention('Standard')",
                            ),
                    ),
            )

        allElements[functionPath.toString()] = function
        allElements[outerTypePath.toString()] = LimeClass(path = outerTypePath, functions = listOf(function))

        // And given a correct validation rule for functions.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Standard calling convention",
                    limeElements = listOf("function"),
                    regex = "@CallingConvention\\('Standard'\\)",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationFailsForFunctionNotMatchingRule() {
        // Given a class with function in LimeModel, which does not obey the rules.
        val functionPath = outerTypePath.child("someFunction")
        val function =
            LimeFunction(
                path = functionPath,
                comment =
                    LimeComment(
                        path = functionPath.child("comment"),
                        taggedSections = listOf("" to "This is some important function. "),
                    ),
            )

        allElements[functionPath.toString()] = function
        allElements[outerTypePath.toString()] = LimeClass(path = outerTypePath, functions = listOf(function))

        // And given a correct validation rule for functions.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Standard calling convention",
                    limeElements = listOf("function"),
                    regex = "@CallingConvention\\('Standard'\\)",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(validationResult)
    }

    @Test
    fun validationPassesForLambdaMatchingRule() {
        // Given a lambda in LimeModel, which obeys the rules.
        allElements[outerTypePath.toString()] =
            LimeLambda(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important lambda. ",
                                "" to "Available only in online mode",
                            ),
                    ),
            )

        // And given a correct validation rule for lambdas.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Available only online",
                    limeElements = listOf("lambda"),
                    regex = "Available only in online mode",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationFailsForLambdaNotMatchingRule() {
        // Given a lambda in LimeModel, which does not obey the rules.
        allElements[outerTypePath.toString()] =
            LimeLambda(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections = listOf("" to "This is some important lambda. "),
                    ),
            )

        // And given a correct validation rule for lambdas.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Available only online",
                    limeElements = listOf("lambda"),
                    regex = "Available only in online mode",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(validationResult)
    }

    @Test
    fun validationPassesForMultipleRulesForMultipleElements() {
        // Given a few elements in LimeModel, which obey the rules.
        val lambdaPath = LimePath(emptyList(), listOf("SomeLambda"))
        val classPath = LimePath(emptyList(), listOf("SomeClass"))
        val structPath = LimePath(emptyList(), listOf("SomeStruct"))
        val functionPath = classPath.child("someFunction")

        val function =
            LimeFunction(
                path = functionPath,
                comment =
                    LimeComment(
                        path = functionPath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important function. ",
                                "" to "@CallingConvention('Standard')",
                            ),
                    ),
            )

        allElements[classPath.toString()] =
            LimeClass(
                path = classPath,
                comment =
                    LimeComment(
                        path = classPath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important class. ",
                                "" to "Available only in offline mode",
                            ),
                    ),
                functions = listOf(function),
            )

        allElements[lambdaPath.toString()] =
            LimeLambda(
                path = lambdaPath,
                comment =
                    LimeComment(
                        path = lambdaPath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important lambda. ",
                                "" to "Available only in online mode",
                            ),
                    ),
            )

        allElements[structPath.toString()] =
            LimeStruct(
                path = structPath,
                comment =
                    LimeComment(
                        path = structPath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important struct. ",
                                "" to "Available only in online mode",
                            ),
                    ),
            )

        // And given correct validation rules.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Available online/offline",
                    limeElements = listOf("class", "struct", "lambda"),
                    regex = "Available only in (offline|online) mode",
                    isWarningOnly = false,
                ),
                LimeDocValidationRule(
                    name = "Standard calling convention",
                    limeElements = listOf("function"),
                    regex = "@CallingConvention\\('Standard'\\)",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun whenRuleIsNotObeyedButWarningOnlyFlagIsSetThenValidationResultIsPositive() {
        // Given a lambda in LimeModel, which does not obey the rules.
        allElements[outerTypePath.toString()] =
            LimeLambda(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections = listOf("" to "This is some important lambda. "),
                    ),
            )

        // And given a correct validation rule for lambdas that generates only warnings.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "Available only online",
                    limeElements = listOf("lambda"),
                    regex = "Available only in online mode",
                    isWarningOnly = true,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes (because of isWarningOnly = true).
        assertTrue(validationResult)
    }

    @Test
    fun validationPassesForPropertiesMatchingRule() {
        // Given a class with property in LimeModel, which obeys the rules.
        val propertyPath = outerTypePath.child("someProperty")
        allElements[outerTypePath.toString()] =
            LimeClass(
                path = outerTypePath,
                properties =
                    listOf(
                        LimeProperty(
                            path = propertyPath,
                            typeRef = LimeBasicTypeRef.INT,
                            getter =
                                LimeFunction(
                                    path = propertyPath.child("get"), returnType = LimeReturnType(LimeBasicTypeRef.INT),
                                ),
                            comment =
                                LimeComment(
                                    path = outerTypePath.child("comment"),
                                    taggedSections = listOf("" to "It is a normal property"),
                                ),
                        ),
                    ),
            )

        // And given a correct validation rule for properties.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "PROPERTY_RULE",
                    limeElements = listOf("property"),
                    regex = "It is a (special|normal) property",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }

    @Test
    fun validationFailsForPropertiesNotMatchingRule() {
        // Given a class with property in LimeModel, which does not obey the rules.
        val propertyPath = outerTypePath.child("someProperty")
        allElements[outerTypePath.toString()] =
            LimeClass(
                path = outerTypePath,
                properties =
                    listOf(
                        LimeProperty(
                            path = propertyPath,
                            typeRef = LimeBasicTypeRef.INT,
                            getter =
                                LimeFunction(
                                    path = propertyPath.child("get"), returnType = LimeReturnType(LimeBasicTypeRef.INT),
                                ),
                            comment =
                                LimeComment(
                                    path = outerTypePath.child("comment"),
                                    taggedSections = listOf("" to "This is some random property"),
                                ),
                        ),
                    ),
            )

        // And given a correct validation rule for properties.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "PROPERTY_RULE",
                    limeElements = listOf("property"),
                    regex = "It is a (special|normal) property",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(validationResult)
    }

    @Test
    fun validationOfCommentWithPlaceholders() {
        // Given a class in LimeModel, which obeys the rules.
        allElements[outerTypePath.toString()] =
            LimeClass(
                path = outerTypePath,
                comment =
                    LimeComment(
                        path = outerTypePath.child("comment"),
                        taggedSections =
                            listOf(
                                "" to "This is some important outer type class. ",
                                "Placeholder" to "AvailableOnline",
                            ),
                        placeholders = mapOf("AvailableOnline" to LimeComment("This type is available only online")),
                    ),
            )

        // And given a correct validation rule for classes that uses the placeholder.
        val docValidationRules: List<LimeDocValidationRule> =
            listOf(
                LimeDocValidationRule(
                    name = "SPECIAL_RULE",
                    limeElements = listOf("class"),
                    regex = "\\{@Placeholder AvailableOnline\\}",
                    isWarningOnly = false,
                ),
            )

        // And given correctly constructed validator.
        val validator = LimeDocRulesValidator(mockk(relaxed = true), docValidationRules)

        // When trying to verify if rules are obeyed.
        val validationResult = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(validationResult)
    }
}
