/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.model.node

class NodeFile : NodeElement() {
    val classes = listOf<NodeClass>()
    val structs = listOf<NodeContainerType>()
    val enums = listOf<NodeEnum>()
    val typeDefs = listOf<NodeTypeDef>()
    val arrays = listOf<NodeArray>()
    val dictionaries = listOf<NodeDictionary>()

    val isEmpty: Boolean
        get() = (classes.isEmpty() &&
                structs.isEmpty() &&
                enums.isEmpty() &&
                typeDefs.isEmpty() &&
                arrays.isEmpty() &&
                dictionaries.isEmpty())
}
