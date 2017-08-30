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
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.FrancaModel;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

public class CppIncludeResolver {
  private final FrancaModel<?, ?> rootModel;

  public CppIncludeResolver(FrancaModel<?, ?> rootModel) {
    this.rootModel = rootModel;
  }

  public void resolveLazyIncludes(final CppNamespace root, final String outputFile) {
    root.streamRecursive()
        .filter(p -> p instanceof CppElementWithIncludes)
        .map(CppElementWithIncludes.class::cast)
        .forEach(type -> resolveLazyIncludes(type, outputFile));
  }

  private void resolveLazyIncludes(final CppElementWithIncludes type, final String outputFile) {
    type.includes =
        type.includes
            .stream()
            .map(
                include -> {
                  if (include instanceof LazyInternalInclude) {

                    LazyInternalInclude li = (LazyInternalInclude) include;

                    Optional<? extends FrancaElement<?>> externalDefinitionOpt =
                        rootModel.find(li.model, li.typeCollection);
                    if (!externalDefinitionOpt.isPresent()) {
                      throw new TranspilerExecutionException(
                          String.format("Could not resolve type collection include %s.", li));
                    }

                    FrancaElement<?> externalDefinition = externalDefinitionOpt.get();
                    String includeName = CppNameRules.getHeaderPath(externalDefinition);

                    // no self includes needed
                    if (includeName.equals(outputFile)) {
                      return null;
                    }

                    // TODO think about relative include path resolution and stuff
                    return Include.createInternalInclude(includeName);
                  }

                  return include;
                })
            .filter(Objects::nonNull)
            .collect(Collectors.toSet());
  }
}
