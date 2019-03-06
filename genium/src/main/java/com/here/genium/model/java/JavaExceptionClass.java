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

package com.here.genium.model.java;

public class JavaExceptionClass extends JavaTopLevelElement {
  public final JavaEnumType enumTypeRef;

  public JavaExceptionClass(final String exceptionName, final JavaEnumType enumTypeRef) {
    super(exceptionName);

    super.javaPackage = new JavaPackage(enumTypeRef.packageNames);
    this.enumTypeRef = enumTypeRef;
  }
}
