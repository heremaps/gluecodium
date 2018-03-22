/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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

package com.here.ivi.api.model.swift;

import java.util.Objects;

public class SwiftParameter extends SwiftTypedModelElement {

  public final String variableName;
  public final boolean differentInterfaceAndVariableName;

  public SwiftParameter(String interfaceName, SwiftType type) {
    this(interfaceName, type, null);
  }

  public SwiftParameter(String interfaceName, SwiftType type, String variableName) {
    super(interfaceName, null, type);
    this.variableName = variableName != null ? variableName : interfaceName;
    this.differentInterfaceAndVariableName =
        variableName != null && !Objects.equals(interfaceName, variableName);
  }
}
