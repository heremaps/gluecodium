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

import java.util.ServiceLoader

/**
 * Abstraction for modules that load the LIME models from some source (usually files) into the
 * in-memory representation. The intent is to reduce the coupling between loader modules and the
 * rest of the binary to an absolute minimum.
 */
interface LimeModelLoader {
    fun loadModel(idlSources: List<String>, auxiliaryIdlSources: List<String>): LimeModel

    companion object {
        fun getLoaders() = ServiceLoader.load(LimeModelLoader::class.java).iterator().asSequence()
    }
}
