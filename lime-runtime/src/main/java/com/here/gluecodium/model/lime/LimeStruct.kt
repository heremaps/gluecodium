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

class LimeStruct(
    path: LimePath,
    visibility: LimeVisibility = LimeVisibility.PUBLIC,
    comment: LimeComment = LimeComment(),
    attributes: LimeAttributes? = null,
    external: LimeExternalDescriptor? = null,
    functions: List<LimeFunction> = emptyList(),
    exceptions: List<LimeException> = emptyList(),
    constants: List<LimeConstant> = emptyList(),
    structs: List<LimeStruct> = emptyList(),
    classes: List<LimeClass> = emptyList(),
    interfaces: List<LimeInterface> = emptyList(),
    enumerations: List<LimeEnumeration> = emptyList(),
    val fields: List<LimeField> = emptyList(),
    val constructorComment: LimeComment = LimeComment(),
    val fieldConstructors: List<LimeFieldConstructor> = emptyList()
) : LimeContainer(
    path = path,
    visibility = visibility,
    comment = comment,
    attributes = attributes,
    external = external,
    functions = functions,
    exceptions = exceptions,
    constants = constants,
    structs = structs,
    classes = classes,
    interfaces = interfaces,
    enumerations = enumerations
) {
    override val childTypes
        get() = fields.map { it.typeRef }

    @Suppress("unused")
    val initializedFields
        get() = fields.filter { it.defaultValue != null }

    val uninitializedFields
        get() = fields.filter { it.defaultValue == null }

    val publicFields
        get() = fields.filter { !it.visibility.isInternal }

    val internalFields
        get() = fields.filter { it.visibility.isInternal }

    val allFieldsConstructor
        get() = fieldConstructors.firstOrNull { it.fieldRefs.size == fields.size }

    val noFieldsConstructor
        get() = fieldConstructors.firstOrNull { it.fieldRefs.isEmpty() }
}
