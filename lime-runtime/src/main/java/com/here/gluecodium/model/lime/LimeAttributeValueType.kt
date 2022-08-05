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

package com.here.gluecodium.model.lime

enum class LimeAttributeValueType(private val tag: String) {
    NAME("Name"),
    ACCESSORS("Accessors"),
    ATTRIBUTE("Attribute"),
    CONST("Const"),
    CSTRING("CString"),
    DEFAULT("Default"),
    ENABLE_IF("EnableIf"),
    FULL_NAME("FullName"),
    FUNCTION_NAME("FunctionName"),
    INTERNAL("Internal"),
    LABEL("Label"),
    MESSAGE("Message"),
    OPTION_SET("OptionSet"),
    PARAMETER_DEFAULTS("ParameterDefaults"),
    POSITIONAL_DEFAULTS("PositionalDefaults"),
    PUBLIC("Public"),
    REF("Ref"),
    SKIP("Skip"),
    TAG("Tag"),
    TYPE("Type"),
    TO_STRING("ToString"),
    WEAK("Weak");

    override fun toString() = tag
}
