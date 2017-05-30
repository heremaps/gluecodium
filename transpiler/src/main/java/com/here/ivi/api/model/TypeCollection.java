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

package com.here.ivi.api.model;

import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.SpecAccessorFactory;
import java.util.List;
import java.util.stream.Collectors;
import navigation.CppStubSpec;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;
import org.franca.deploymodel.dsl.fDeploy.FDTypes;

/** FTypeCollection with accessor */
public class TypeCollection<Accessor extends CppStubSpec.TypeCollectionPropertyAccessor>
    implements FrancaElement<Accessor> {

  @Override
  public String getName() {
    return francaTypeCollection.getName();
  }

  @Override
  public ModelInfo getModelInfo() {
    return modelInfo;
  }

  @Override
  public List<String> getPackage() {
    String name = modelInfo.getFModel().getName();
    return PackageHelper.splitPackage(name);
  }

  @Override
  public Version getVersion() {
    return Version.create(francaTypeCollection.getVersion());
  }

  @Override
  public Accessor getPropertyAccessor() {
    return accessor;
  }

  @Override
  public boolean equals(Object o) {
    if (o == null || !(o instanceof TypeCollection<?>)) return false;
    TypeCollection<?> co = (TypeCollection<?>) o;
    return getName().equals(co.getName())
        && modelInfo.getFModel().getName().equals(co.modelInfo.getFModel().getName());
  }

  @Override
  public FTypeCollection getFrancaTypeCollection() {
    return francaTypeCollection;
  }

  // finds a matching FDTypes for a FTypeCollection, if one is found, creates a valid
  // TypeCollectionPropertyAccessor, otherwise creates an empty accessor that will return the
  // defaults for a spec
  public static <TA extends CppStubSpec.TypeCollectionPropertyAccessor> TypeCollection<TA> create(
      SpecAccessorFactory<?, TA> f,
      FDSpecification spec,
      ModelInfo info,
      FTypeCollection tc,
      FrancaDeploymentModel deploymentModel) {

    FTypeCollection francaTypeCollection = tc;

    TA accessor = null;
    if (deploymentModel != null) {
      List<FDTypes> matches =
          deploymentModel
              .getFDTypesList()
              .stream()
              .filter(fdt -> tc.getName().equals(fdt.getTarget().getName()))
              .collect(Collectors.toList());

      if (matches.size() > 1) {
        throw new RuntimeException(
            "Found multiple deployment types matching the type collection, aborting.");
      } else if (!matches.isEmpty()) {
        final FDTypes found = matches.get(0);
        francaTypeCollection = found.getTarget();
        accessor = f.createTypeCollectionAccessor(new FDeployedTypeCollection(found));
      }
    }
    if (accessor == null) {
      accessor =
          f.createTypeCollectionAccessor(
              (FDeployedTypeCollection) FDHelper.createDummyFDElement(spec, tc));
    }
    return new TypeCollection<>(francaTypeCollection, accessor, info);
  }

  public TypeCollection(
      FTypeCollection francaTypeCollection, Accessor accessor, ModelInfo modelInfo) {
    this.francaTypeCollection = francaTypeCollection;
    this.accessor = accessor;
    this.modelInfo = modelInfo;
  }

  private final FTypeCollection francaTypeCollection;
  private final Accessor accessor;
  private final ModelInfo modelInfo;
}
