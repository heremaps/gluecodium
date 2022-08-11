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
    structs: List<LimeStruct> = emptyList(),
    enumerations: List<LimeEnumeration> = emptyList(),
    constants: List<LimeConstant> = emptyList(),
    typeAliases: List<LimeTypeAlias> = emptyList(),
    functions: List<LimeFunction> = emptyList(),
    exceptions: List<LimeException> = emptyList(),
    classes: List<LimeClass> = emptyList(),
    interfaces: List<LimeInterface> = emptyList(),
    lambdas: List<LimeLambda> = emptyList(),
    val fields: List<LimeField> = emptyList(),
    val constructorComment: LimeComment = LimeComment(),
    val fieldConstructors: List<LimeFieldConstructor> = emptyList()
) : LimeContainer(
    path = path,
    visibility = visibility,
    comment = comment,
    attributes = attributes,
    external = external,
    structs = structs,
    enumerations = enumerations,
    constants = constants,
    typeAliases = typeAliases,
    functions = functions,
    exceptions = exceptions,
    classes = classes,
    interfaces = interfaces,
    lambdas = lambdas
) {
    override val childTypes
        get() = fields.map { it.typeRef }

    val initializedFields
        get() = fields.filter { it.defaultValue != null }

    val uninitializedFields
        get() = fields.filter { it.defaultValue == null }

    @Suppress("unused")
    val deprecatedFields
        get() = fields.filter { it.attributes.have(LimeAttributeType.DEPRECATED) }

    @Suppress("unused")
    val availableFields
        get() = fields.filter { !it.attributes.have(LimeAttributeType.DEPRECATED) }

    val allFieldsConstructor
        get() = fieldConstructors.firstOrNull { it.fieldRefs.size == fields.size }

    val noFieldsConstructor
        get() = fieldConstructors.firstOrNull { it.fieldRefs.isEmpty() }
}
