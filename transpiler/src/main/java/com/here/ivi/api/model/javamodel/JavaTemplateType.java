/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.javamodel;

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
              new JavaImport(implementationTypeName, javaPackage));
      this.javaImport = new JavaImport(name, javaPackage);
      this.packageNames = javaPackage.packageNames;
    }
  }

  private JavaTemplateType(final String name, final TemplateClass templateClass) {
    super(
        name,
        Collections.singletonList(templateClass.name),
        templateClass.packageNames,
        Collections.emptySet());
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
}
