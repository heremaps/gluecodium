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

package com.here.ivi.api.generator.android;

import com.here.ivi.api.generator.common.cpp.CppTypeRefNameResolver;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppElement;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class JavaNativeTypeRefNameResolver implements CppTypeRefNameResolver {

  @Override
  public List<CppComplexTypeRef> addTypeRefScopeNames(
      List<String> scopeNames, List<? extends CppElement> cppElements) {

    //just collecting the items which might be processed by resolveLazyNames
    return cppElements
        .stream()
        .filter(Objects::nonNull)
        .flatMap(CppElement::streamRecursive)
        .filter(
            element ->
                element instanceof CppComplexTypeRef && ((CppComplexTypeRef) element).hasLazyName())
        .map(CppComplexTypeRef.class::cast)
        .collect(Collectors.toList());
  }

  @Override
  public void resolveLazyNames(List<CppComplexTypeRef> typeReferences) {
    typeReferences.forEach(typeRef -> typeRef.resolveLazyName());
  }
}
