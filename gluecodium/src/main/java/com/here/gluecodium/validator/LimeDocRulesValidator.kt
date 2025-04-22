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
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import java.util.regex.PatternSyntaxException

class LimeDocRulesValidator(private val logger: LimeLogger, docValidationRules: List<LimeDocValidationRule>) {
    private val ruleToRegex: Map<String, Regex> = createRuleToRegexMapping(docValidationRules)
    private val elementToRules: Map<String, List<LimeDocValidationRule>> = createElementToRulesMapping(docValidationRules)

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val validationResults =
            elementToRules.map {
                when (it.key) {
                    "class" -> applyRules(allElements.filterIsInstance<LimeClass>(), it.value)
                    "struct" -> applyRules(allElements.filterIsInstance<LimeStruct>(), it.value)
                    "interface" -> applyRules(allElements.filterIsInstance<LimeInterface>(), it.value)
                    "lambda" -> applyRules(allElements.filterIsInstance<LimeLambda>(), it.value)
                    "enum" -> applyRules(allElements.filterIsInstance<LimeEnumeration>(), it.value)
                    "function" -> applyRules(allElements.filterIsInstance<LimeFunction>(), it.value)
                    "property" ->
                        applyRules(
                            allElements.filterIsInstance<LimeContainerWithInheritance>().flatMap {
                                    container ->
                                container.properties
                            },
                            it.value,
                        )
                    else -> throw OptionReaderException("Unknown lime element type for docs validation rules '${it.key}'")
                }
            }
        return !validationResults.contains(false)
    }

    private fun applyRules(
        elements: List<LimeNamedElement>,
        rules: List<LimeDocValidationRule>,
    ): Boolean {
        return !elements.map { element ->
            !rules.map { rule -> applySingleRule(element, rule) }.contains(false)
        }.contains(false)
    }

    private fun applySingleRule(
        element: LimeNamedElement,
        rule: LimeDocValidationRule,
    ): Boolean {
        val regex = ruleToRegex[rule.name]!!
        val applyResult = regex.containsMatchIn(element.comment.toString())

        if (!applyResult) {
            logRuleApplicationFailed(rule, element)
        }

        return rule.isWarningOnly || applyResult
    }

    private fun logRuleApplicationFailed(
        rule: LimeDocValidationRule,
        element: LimeNamedElement,
    ) {
        val errorMessage = "LimeDocValidationRule '${rule.name}' failed for ${element.fullName}"
        if (rule.isWarningOnly) {
            logger.warning(element, errorMessage)
        } else {
            logger.error(element, errorMessage)
        }
    }

    companion object {
        private fun createRuleToRegexMapping(docValidationRules: List<LimeDocValidationRule>): Map<String, Regex> {
            val mapping: MutableMap<String, Regex> = mutableMapOf()
            for (rule in docValidationRules) {
                if (mapping.contains(rule.name)) {
                    throw OptionReaderException("Multiple doc validation rules with the same name = '${rule.name}'")
                }

                try {
                    mapping[rule.name] = Regex(rule.regex)
                } catch (e: PatternSyntaxException) {
                    throw OptionReaderException("Cannot compile regex for doc validation rule '${rule.name}'. Exception = '${e.message}'")
                }
            }
            return mapping
        }

        private fun createElementToRulesMapping(docValidationRules: List<LimeDocValidationRule>): Map<String, List<LimeDocValidationRule>> {
            val mapping: MutableMap<String, MutableList<LimeDocValidationRule>> = mutableMapOf()
            for (rule in docValidationRules) {
                if (rule.limeElements.isEmpty()) {
                    throw OptionReaderException("No lime elements specified for doc validation rule: '${rule.name}'")
                }

                for (elementType in rule.limeElements) {
                    if (!isKnownElementType(elementType)) {
                        throw OptionReaderException("Unknown element type '$elementType' for rule '${rule.name}'")
                    }

                    if (!mapping.contains(elementType)) {
                        mapping[elementType] = mutableListOf(rule)
                    } else {
                        mapping[elementType]!!.add(rule)
                    }
                }
            }
            return mapping
        }

        private fun isKnownElementType(elementType: String): Boolean {
            return LIME_ELEMENTS.contains(elementType)
        }

        private val LIME_ELEMENTS: Set<String> =
            setOf(
                "class",
                "struct",
                "interface",
                "lambda",
                "enum",
                "function",
                "property",
            )
    }
}
