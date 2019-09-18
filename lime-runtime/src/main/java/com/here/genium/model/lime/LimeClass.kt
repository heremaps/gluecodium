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

package com.here.genium.model.lime

class LimeClass(
    path: LimePath,
    visibility: LimeVisibility = LimeVisibility.PUBLIC,
    comment: LimeComment = LimeComment(),
    attributes: LimeAttributes? = null,
    structs: List<LimeStruct> = emptyList(),
    enumerations: List<LimeEnumeration> = emptyList(),
    constants: List<LimeConstant> = emptyList(),
    typeAliases: List<LimeTypeAlias> = emptyList(),
    functions: List<LimeFunction> = emptyList(),
    properties: List<LimeProperty> = emptyList(),
    exceptions: List<LimeException> = emptyList(),
    classes: List<LimeClass> = emptyList(),
    interfaces: List<LimeInterface> = emptyList(),
    lambdas: List<LimeLambda> = emptyList(),
    parent: LimeTypeRef? = null
) : LimeContainerWithInheritance(
    path = path,
    visibility = visibility,
    comment = comment,
    attributes = attributes,
    structs = structs,
    enumerations = enumerations,
    constants = constants,
    typeAliases = typeAliases,
    functions = functions,
    properties = properties,
    exceptions = exceptions,
    classes = classes,
    interfaces = interfaces,
    lambdas = lambdas,
    parent = parent
)
