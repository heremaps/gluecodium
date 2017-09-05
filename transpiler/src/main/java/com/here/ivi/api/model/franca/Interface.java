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
import lombok.EqualsAndHashCode;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.fDeploy.FDInterface;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;

/** FInterface with accessor */
@EqualsAndHashCode(callSuper = true)
@SuppressWarnings("FinalClass") // Mockito can only mock non-private & non-final classes.
public class Interface extends FrancaElement {

  private final FInterface francaInterface;

  private Interface(
      final FInterface francaInterface,
      final MappingGenericPropertyAccessor accessor,
      final FModel francaModel) {
    super(accessor, francaModel);
    this.francaInterface = francaInterface;
  }

  @Override
  public FTypeCollection getFrancaTypeCollection() {
    return getFrancaInterface(); // an interface is type collection as well
  }

  public FInterface getFrancaInterface() {
    return francaInterface;
  }

  // Finds a matching FDInterface for an FInterface, if one is found, creates a valid
  // InterfacePropertyAccessor, otherwise creates an empty accessor that will return the defaults
  // for a spec.
  public static Interface create(
      FDSpecification spec,
      FModel francaModel,
      FInterface fi,
      FrancaDeploymentModel deploymentModel) {

    FInterface francaInterface = fi;
    MappingGenericPropertyAccessor accessor = null;
    if (deploymentModel != null) {
      List<FDInterface> matches =
          deploymentModel
              .getFDInterfaces()
              .stream()
              .filter(fdi -> fi.getName().equals(fdi.getTarget().getName()))
              .collect(Collectors.toList());

      if (matches.size() > 1) {
        throw new TranspilerExecutionException("Found multiple Interface matches, aborting.");
      } else if (!matches.isEmpty()) {
        final FDInterface found = matches.get(0);
        francaInterface = found.getTarget();
        accessor = new FDeployedInterface(found);
      }
    }
    if (accessor == null) {
      // create fallback accessor to use for defaults
      accessor = FDHelper.createDummyFDElement(spec, fi);
    }
    return new Interface(francaInterface, accessor, francaModel);
  }
}
