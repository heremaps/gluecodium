/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper

internal class DartDeclarationImportsCollector(
    private val importResolver: DartDeclarationImportResolver
) : ImportsCollector<DartImport> {

    override fun collectImports(limeElement: LimeNamedElement): List<DartImport> {
        val allTypes = LimeTypeHelper.getAllTypes(limeElement).filterNot { it is LimeTypeAlias }
        return allTypes.flatMap { importResolver.resolveElementImports(it) }
    }
}
