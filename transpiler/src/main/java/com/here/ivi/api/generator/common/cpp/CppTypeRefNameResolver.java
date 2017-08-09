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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppElement;
import java.util.List;

/**
 * This interface exposes methods to trigger the addition of scope elements to CppComplexTypeRef and
 * to trigger the name resolving (see CppComplexTypeRef). The methods are meant to be called from
 * within a builder's finishBuilding method like this (simplified example):
 *
 * <p>StubModelBuilder.finishBuilding(FInterface francaInterface) {
 *
 * <p>CppClass.Builder stubClassBuilder = new CppClass.Builder(className); CppClass cppClass =
 * stubClassBuilder.build(); List<CppElement> previousResults = getCurrentContext().previousResults;
 * nameResolver.resolveLazyNames( nameResolver.addTypeRefScopeNames(
 * Collections.singletonList(typeCollectionName), elements));
 *
 * <p>cppClass.methods.addAll(CollectionsHelper.getAllOfType(previousResults, CppMethod.class));
 *
 * <p>[...]
 *
 * <p>}
 */
public interface CppTypeRefNameResolver {

  /**
   * Adds scope names \p scopeNames to all type references contained in \p cppElements
   *
   * @param scopeNames scope names to be added
   * @param cppElements list of cpp elements containing the type references to which scope names
   *     will be added
   * @return list of CppComplexTypeRef which were processed
   */
  List<CppComplexTypeRef> addTypeRefScopeNames(
      List<String> scopeNames, List<? extends CppElement> cppElements);

  /**
   * resolves names of given type references in \p typeReferences
   *
   * @param typeReferences list of type references to be processed
   */
  void resolveLazyNames(List<CppComplexTypeRef> typeReferences);
}
