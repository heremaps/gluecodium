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

import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.HashMap;
import java.util.Map;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class CppIncludeResolver {

  private final Map<FTypeCollection, Include> resolvedIncludes = new HashMap<>();

  public Include resolveInclude(final FModelElement modelElement) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    Include include = resolvedIncludes.get(typeCollection);

    if (include == null) {
      String includeName = CppNameRules.getHeaderPath(typeCollection);
      include = Include.createInternalInclude(includeName);
      resolvedIncludes.put(typeCollection, include);
    }

    return include;
  }
}
