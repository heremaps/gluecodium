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
 * Module to allow validation on the syntax and the content of fidl/fdepl files.
 *
 * <h1>Input</h1>
 *
 * For content validation, the input is a FrancaModel. For syntax validation, the input is the
 * collection of fidl/fdepl files.
 *
 * <h1>Output</h1>
 *
 * Boolean return on valid or invalid. Validation failure diagnostics will be output to the {@link
 * com.here.genium.logger.GeniumLogger}. In the future, when more validation rules comes to mind, we
 * can extend the result to support different types of syntanx/content violations.
 */
package com.here.genium.validator;
