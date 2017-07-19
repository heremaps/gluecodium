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

import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.SpecAccessorFactory;
import java.util.List;
import java.util.stream.Collectors;
import navigation.BaseApiSpec;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.dsl.fDeploy.FDInterface;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;

/** FInterface with accessor */
public class Interface<Accessor extends BaseApiSpec.InterfacePropertyAccessor>
    implements FrancaElement<Accessor> {
  private Interface(FInterface francaInterface, Accessor accessor, ModelInfo model) {
    this.francaInterface = francaInterface;
    this.accessor = accessor;
    this.model = model;
  }

  private final FInterface francaInterface;
  private final Accessor accessor;
  private final ModelInfo model;

  @Override
  public String getName() {
    return francaInterface.getName();
  }

  @Override
  public ModelInfo getModelInfo() {
    return model;
  }

  @Override
  public Version getVersion() {
    if (francaInterface.getVersion() != null) {
      return Version.createFromFrancaVersion(francaInterface.getVersion());
    } else {
      return new Version(0, 0, 0, "");
    }
  }

  @Override
  public Accessor getPropertyAccessor() {
    return accessor;
  }

  @Override
  public boolean equals(Object o) {
    if (o == null || !(o instanceof Interface<?>)) return false;
    Interface<?> co = (Interface<?>) o;
    return getName().equals(co.getName())
        && model.getFModel().getName().equals(co.model.getFModel().getName());
  }

  @Override
  public FTypeCollection getFrancaTypeCollection() {
    return getFrancaInterface(); // an interface is type collection as well
  }

  public FInterface getFrancaInterface() {
    return francaInterface;
  }

  // finds a matching FDInterface for an FInterface, if one is found, creates a valid InterfacePropertyAccessor,
  // otherwise creates an empty accessor that will return the defaults for a spec
  public static <IA extends BaseApiSpec.InterfacePropertyAccessor> Interface<IA> create(
      SpecAccessorFactory<IA, ?> f,
      FDSpecification spec,
      ModelInfo info,
      FInterface fi,
      FrancaDeploymentModel deploymentModel) {

    FInterface francaInterface = fi;
    IA accessor = null;
    if (deploymentModel != null) {
      List<FDInterface> matches =
          deploymentModel
              .getFDInterfaces()
              .stream()
              .filter(fdi -> fi.getName().equals(fdi.getTarget().getName()))
              .collect(Collectors.toList());

      if (matches.size() > 1) {
        throw new RuntimeException("Found multiple Interface matches, aborting.");
      } else if (!matches.isEmpty()) {
        final FDInterface found = matches.get(0);
        francaInterface = found.getTarget();
        accessor = f.createInterfaceAccessor(new FDeployedInterface(found));
      }
    }
    if (accessor == null) {
      // create fallback accessor to use for defaults
      accessor =
          f.createInterfaceAccessor((FDeployedInterface) FDHelper.createDummyFDElement(spec, fi));
    }
    return new Interface<>(francaInterface, accessor, info);
  }
}
