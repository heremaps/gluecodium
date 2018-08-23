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

import com.here.genium.generator.cpp.CppLibraryIncludes;
import com.here.genium.generator.cpp.CppNameRules;
import com.here.genium.model.common.Include;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class CppTemplateTypeRef extends CppComplexTypeRef {

  public final List<CppTypeRef> templateParameters;
  public final TemplateClass templateClass;

  public enum TemplateClass {
    SHARED_POINTER("std", "shared_ptr", CppLibraryIncludes.MEMORY),
    MAP("std", "unordered_map", CppLibraryIncludes.MAP),
    VECTOR("std", "vector", CppLibraryIncludes.VECTOR),
    BASIC_STRING("std", "basic_string", CppLibraryIncludes.STRING),
    RETURN(null, "Return", CppLibraryIncludes.RETURN);

    public final String namespace;
    public final String name;
    public final Set<Include> includes;

    TemplateClass(final String namespace, final String name, Include... includes) {
      this.namespace = namespace;
      this.name = name;
      this.includes = new LinkedHashSet<>(Arrays.asList(includes));
    }
  }

  private CppTemplateTypeRef(
      final String fullyQualifiedName,
      final TemplateClass templateClass,
      final List<CppTypeRef> templateParameters) {
    super(fullyQualifiedName, null, false);
    this.templateClass = templateClass;
    this.templateParameters = templateParameters;
  }

  public static CppTemplateTypeRef create(
      final TemplateClass templateClass, CppTypeRef... parameters) {
    return create(templateClass.namespace, templateClass, parameters);
  }

  public static CppTemplateTypeRef create(
      final String namespace, final TemplateClass templateClass, CppTypeRef... parameters) {
    List<CppTypeRef> templateParameters = Arrays.asList(parameters);
    String parametersString =
        templateParameters.stream().map(param -> param.name).collect(Collectors.joining(", "));
    String fullyQualifiedName =
        CppNameRules.getFullyQualifiedName(Collections.singletonList(namespace), templateClass.name)
            + "< "
            + parametersString
            + " >";

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

  @Override
  public Stream<? extends CppElement> stream() {
    return templateParameters.stream();
  }
}
