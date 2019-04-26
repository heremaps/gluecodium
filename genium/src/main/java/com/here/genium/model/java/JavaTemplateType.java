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

import java.util.*;
import java.util.stream.Collectors;

public final class JavaTemplateType extends JavaCustomType {

  public static final JavaPackage JAVA_UTIL = new JavaPackage(Arrays.asList("java", "util"));
  public static final String IMPLICIT_TEMPLATE_DECLARATION = "<>";

  public final JavaCustomType implementationType;

  public enum TemplateClass {
    LIST("List", JAVA_UTIL, "ArrayList"),
    MAP("Map", JAVA_UTIL, "HashMap");

    public final String name;
    public final JavaCustomType implementationType;
    public final JavaImport javaImport;
    public final List<String> packageNames;

    TemplateClass(final String name, final JavaPackage javaPackage, String implementationTypeName) {
      this.name = name;
      this.implementationType =
          new JavaCustomType(
              implementationTypeName + IMPLICIT_TEMPLATE_DECLARATION,
              null,
              javaPackage.getPackageNames(),
              Collections.singletonList(new JavaImport(implementationTypeName, javaPackage)),
              false);
      this.javaImport = new JavaImport(name, javaPackage);
      this.packageNames = javaPackage.getPackageNames();
    }
  }

  private JavaTemplateType(final String name, final TemplateClass templateClass) {
    super(
        name,
        Collections.singletonList(templateClass.name),
        templateClass.packageNames,
        null,
        false);
    implementationType = templateClass.implementationType;
  }

  public static JavaTemplateType create(final TemplateClass templateClass, JavaType... parameters) {
    List<JavaType> templateParameters = Arrays.asList(parameters);
    String name =
        templateClass.name
            + "<"
            + templateParameters.stream().map(type -> type.name).collect(Collectors.joining(", "))
            + ">";

    JavaTemplateType templateType = new JavaTemplateType(name, templateClass);

    templateType.imports.add(templateClass.javaImport);
    templateParameters.forEach(parameter -> templateType.imports.addAll(parameter.imports));

    return templateType;
  }

  public static JavaTemplateType wrapInList(JavaType elementType) {
    if (elementType instanceof JavaPrimitiveType) {
      elementType = JavaReferenceType.Companion.boxPrimitiveType((JavaPrimitiveType) elementType);
    }
    return JavaTemplateType.create(TemplateClass.LIST, elementType);
  }
}
