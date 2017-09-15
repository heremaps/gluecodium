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

package com.here.ivi.api.model.franca;

import com.here.ivi.api.TranspilerExecutionException;
import java.util.List;
import java.util.stream.Collectors;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;
import org.franca.deploymodel.dsl.fDeploy.FDTypes;

/** FTypeCollection with accessor */
@SuppressWarnings("FinalClass") // Mockito can only mock non-private & non-final classes.
public class TypeCollection extends FrancaElement {

  private final FTypeCollection francaTypeCollection;

  private TypeCollection(
      final FTypeCollection francaTypeCollection,
      final MappingGenericPropertyAccessor accessor,
      final FModel francaModel) {
    super(accessor, francaModel);
    this.francaTypeCollection = francaTypeCollection;
  }

  @Override
  public FTypeCollection getFrancaTypeCollection() {
    return francaTypeCollection;
  }

  /**
   * Find a matching FDTypes for a FTypeCollection.
   *
   * @return A valid TypeCollectionPropertyAccessor if a match is found, an empty accessor which
   *     will return the defaults otherwise.
   */
  public static TypeCollection create(
      FDSpecification spec,
      FModel francaModel,
      FTypeCollection typeCollection,
      FrancaDeploymentModel deploymentModel) {

    FTypeCollection francaTypeCollection = typeCollection;

    MappingGenericPropertyAccessor accessor = null;
    if (deploymentModel != null) {
      List<FDTypes> matches =
          deploymentModel
              .getFDTypesList()
              .stream()
              .filter(
                  deploymentTypes ->
                      typeCollection.getName().equals(deploymentTypes.getTarget().getName()))
              .collect(Collectors.toList());

      if (matches.size() > 1) {
        throw new TranspilerExecutionException(
            "Found multiple deployment types matching the type collection, aborting.");
      } else if (!matches.isEmpty()) {
        final FDTypes found = matches.get(0);
        francaTypeCollection = found.getTarget();
        accessor = new FDeployedTypeCollection(found);
      }
    }
    if (accessor == null) {
      accessor = FDHelper.createDummyFDElement(spec, typeCollection);
    }
    return new TypeCollection(francaTypeCollection, accessor, francaModel);
  }
}
