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

package com.here.genium.model.cpp;

import com.here.genium.model.common.Include;
import java.util.Collection;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public final class CppTypeDefRef extends CppTypeRef {

  public final CppTypeRef actualType;

  public CppTypeDefRef(String name, CppTypeRef type, Include... includes) {
    super(name, includes);
    actualType = type;
  }

  public CppTypeDefRef(String name, CppTypeRef type, final Collection<Include> includes) {
    super(name, includes);
    actualType = type;
  }

  @Override
  public boolean refersToValueType() {
    return actualType.refersToValueType();
  }

  @Override
  public boolean refersToEnumType() {
    return actualType.refersToEnumType();
  }

  @Override
  public String getShortName() {
    return actualType.getShortName();
  }

  @Override
  public CppTypeRef getActualType() {
    return actualType;
  }
}
