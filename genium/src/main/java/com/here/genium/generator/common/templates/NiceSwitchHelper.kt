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

package com.here.genium.generator.common.templates

import org.slf4j.LoggerFactory
import org.trimou.engine.MustacheTagInfo
import org.trimou.engine.MustacheTagType
import org.trimou.handlebars.HelperDefinition
import org.trimou.handlebars.HelperValidator
import org.trimou.handlebars.SwitchHelper

/**
 * Identical to built-in Trimou SwitchHelper, except that it does not spam the log about "comment"
 * sections found inside the "switch" block.
 *
 * Since the real validation check in SwitchHelper is in a private isValid() method, both
 * validate() and isValid() method are copy-pasted from SwitchHelper here.
 */
internal class NiceSwitchHelper : SwitchHelper() {
    override fun validate(definition: HelperDefinition) {
        // BasicHelper.validate()
        val helperClazz = this.javaClass
        HelperValidator.checkType(helperClazz, definition, *allowedTagTypes())
        HelperValidator.checkParams(helperClazz, definition, numberOfRequiredParameters())
        HelperValidator.checkHash(definition, this)

        // SwitchHelper.validate()
        val validNames = hashSetOf<String>()
        configuration.helpers.forEach { key, value ->
            if (value is SwitchHelper.CaseHelper || value is SwitchHelper.DefaultHelper) {
                validNames.add(key)
            }
        }
        definition.tagInfo.childTags.forEach { info ->
            if (!isValid(info, validNames)) {
                LOGGER.warn(
                    "Invalid content detected {}. " +
                            "This helper should only contain case, default and comment sections. " +
                            "Other types of segments are always rendered.",
                    info
                )
            }
        }
    }

    private fun isValid(info: MustacheTagInfo, validNames: Set<String>): Boolean {
        // Accept "comment" sections as valid
        if (info.type == MustacheTagType.COMMENT) {
            return true
        }

        // SwitchHelper.isValid()
        if (info.type != MustacheTagType.SECTION) {
            return false
        }
        validNames.forEach {
            if (info.text.startsWith(it)) {
                return true
            }
        }
        return false
    }

    companion object {
        private val LOGGER = LoggerFactory.getLogger(SwitchHelper::class.java)
    }
}
