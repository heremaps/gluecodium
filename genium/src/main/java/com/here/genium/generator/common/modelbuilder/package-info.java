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

/**
 * Generate a language specific model.
 *
 * <h1>Overview</h1>
 *
 * Generators use {@link com.here.genium.loader.ModelBuilder ModelBuilders} to generate a language
 * specific model. The {@code ModelBuilder} itself is a visitor for the language independent Franca
 * model which is traversed by the {@link com.here.genium.loader.FrancaTreeWalker}. Intermediate and
 * final results are stored in {@link com.here.genium.common.ModelBuilderContext}.
 *
 * <h1>Rationale</h1>
 *
 * The bridging layers for {@link com.here.genium.generator.jni.JniGenerator Java} and {@link
 * com.here.genium.generator.cbridge.CBridgeGenerator Swift} code generation need to forward
 * function calls and convert data types between C++ BaseAPI and Java or C++ BaseAPI and Swift. The
 * specifics of how the C++, Java and Swift code is defined by their generators. To be able to
 * generate bridging code without the need of replicating the generation details also in the
 * bridging generators these need access to the language specific models. To reduce coupling and
 * simplify finding the correspondances between the current element in the bridging generator and
 * the associated C++, Java or Swift model the language independent Franca model is traversed only
 * once for each generator suite and the generators can access the {@link
 * com.here.genium.common.ModelBuilderContext} from other generators that are run in parallel. This
 * way bridging generators can access the results of the other generators to determine the types and
 * names etc. for the conversion.
 */
package com.here.genium.generator.common.modelbuilder;
