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

package com.here.genium.model.jni;

import java.util.LinkedList;
import java.util.List;
import lombok.Builder;
import lombok.EqualsAndHashCode;

@Builder(builderClassName = "Builder")
@EqualsAndHashCode
public final class JniMethod implements JniElement {

  public JniContainer owningContainer;

  public final String javaMethodName;
  public final String cppMethodName;
  public final JniType returnType;
  public final boolean isStatic;
  public final boolean isConst;
  public final boolean isOverloaded;
  public final JniException exception;

  public final List<JniParameter> parameters = new LinkedList<>();

  @SuppressWarnings("unused")
  public static class Builder {
    private String javaMethodName;
    private String cppMethodName;

    Builder() {
      this(null, null);
    }

    public Builder(final String javaMethodName, final String cppMethodName) {
      this.javaMethodName = javaMethodName;
      this.cppMethodName = cppMethodName;
    }
  }
}
