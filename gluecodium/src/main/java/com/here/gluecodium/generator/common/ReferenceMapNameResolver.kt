/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.common

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath

internal abstract class ReferenceMapNameResolver(
    protected val limeReferenceMap: Map<String, LimeElement>
) : NameResolver {

    protected fun getParentElement(limeElement: LimeNamedElement): LimeNamedElement =
        getParentElement(limeElement.path, limeElement is LimeParameter)

    protected fun getParentElement(limePath: LimePath, withSuffix: Boolean = false): LimeNamedElement {
        val parentPath = when {
            withSuffix -> limePath.parent.withSuffix(limePath.disambiguator)
            else -> limePath.parent
        }
        return (limeReferenceMap[parentPath.toString()] as? LimeNamedElement
            ?: throw GluecodiumExecutionException(
                "Failed to resolve parent for element $limePath"
            ))
    }
}
