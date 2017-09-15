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

package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.model.common.Include;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public final class CppTemplateTypeRef extends CppComplexTypeRef {

  public final List<CppTypeRef> templateParameters;
  public final TemplateClass templateClass;

  public enum TemplateClass {
    SHARED_POINTER("::std::shared_ptr", CppLibraryIncludes.MEMORY),
    MAP("::std::unordered_map", CppLibraryIncludes.MAP),
    VECTOR("::std::vector", CppLibraryIncludes.VECTOR),
    EXPECTED("here::internal::Expected", CppLibraryIncludes.EXPECTED);

    public final String name;
    public final Set<Include> includes;

    TemplateClass(String name, Include... includes) {
      this.name = name;
      this.includes = new LinkedHashSet<>(Arrays.asList(includes));
    }
  }

  private CppTemplateTypeRef(
      final String fullyQualifiedName,
      final TemplateClass templateClass,
      final List<CppTypeRef> templateParameters) {
    super(fullyQualifiedName, null, null);
    this.templateClass = templateClass;
    this.templateParameters = templateParameters;
  }

  public static CppTemplateTypeRef create(
      final TemplateClass templateClass, CppTypeRef... parameters) {
    List<CppTypeRef> templateParameters = Arrays.asList(parameters);
    String parametersString =
        templateParameters.stream().map(param -> param.name).collect(Collectors.joining(", "));
    String fullyQualifiedName = templateClass.name + "< " + parametersString + " >";

    CppTemplateTypeRef templateTypeRef =
        new CppTemplateTypeRef(fullyQualifiedName, templateClass, templateParameters);

    // add template parameters includes
    for (CppTypeRef typeRef : templateParameters) {
      templateTypeRef.includes.addAll(typeRef.includes);
    }

    // Add template class includes
    templateTypeRef.includes.addAll(templateClass.includes);

    return templateTypeRef;
  }
}
