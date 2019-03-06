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

package com.here.genium.generator.node

import com.here.genium.generator.common.NameHelper
import com.here.genium.model.franca.DefinedBy
import org.franca.core.franca.FArgument
import org.franca.core.franca.FMethod
import org.franca.core.franca.FTypeCollection
import java.io.File

object NodeNameRules {
    private val TARGET_DIRECTORY = "node${File.separator}"

    fun getImplementationFileName(francaTypeCollection: FTypeCollection) =
        ("$TARGET_DIRECTORY${DefinedBy.getPackages(
            francaTypeCollection
        ).joinToString(File.separator)}${File.separator}${getFileName(francaTypeCollection)}.cpp")

    private fun getFileName(francaTypeCollection: FTypeCollection) =
        NodeNameRules.getClassName(francaTypeCollection.name)

    fun getMethodName(method: FMethod) = NameHelper.toLowerCamelCase(method.name)

    fun getParameterName(argument: FArgument) = NameHelper.toLowerCamelCase(argument.name)

    fun getClassName(name: String) = NameHelper.toUpperCamelCase(name)
}
