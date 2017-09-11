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

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.FrancaModel;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class CppIncludeResolver {

  private final FrancaModel francaModel;
  private final Map<FTypeCollection, Include> resolvedIncludes = new HashMap<>();

  public CppIncludeResolver(final FrancaModel francaModel) {
    this.francaModel = francaModel;
  }

  public Include resolveInclude(final FModelElement modelElement) {

    if (francaModel == null) {
      return null;
    }

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    Include include = resolvedIncludes.get(typeCollection);
    if (include != null) {
      return include;
    }

    Optional<? extends FrancaElement> externalDefinitionOpt = francaModel.find(typeCollection);
    if (!externalDefinitionOpt.isPresent()) {
      throw new TranspilerExecutionException(
          String.format("Could not resolve type collection include %s.", typeCollection));
    }

    FrancaElement externalDefinition = externalDefinitionOpt.get();
    String includeName = CppNameRules.getHeaderPath(externalDefinition);

    // TODO think about relative include path resolution and stuff
    include = Include.createInternalInclude(includeName);
    resolvedIncludes.put(typeCollection, include);

    return include;
  }
}
