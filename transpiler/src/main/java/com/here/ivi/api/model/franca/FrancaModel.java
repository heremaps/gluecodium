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

import com.google.common.collect.ImmutableList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;

public class FrancaModel {

  private final ImmutableList<Interface> interfaces;
  private final ImmutableList<TypeCollection> typeCollections;

  // creates a FrancaModel from the given FModel & FDModel,
  // ensuring that there are PropertyAccessors for each element
  public static FrancaModel create(
      FDSpecification spec, FModel francaModel, FrancaDeploymentModel deploymentModel) {

    // create interface helpers
    ImmutableList<Interface> interfaces =
        francaModel
            .getInterfaces()
            .parallelStream()
            .map(fi -> Interface.create(spec, francaModel, fi, deploymentModel))
            .collect(Collectors.collectingAndThen(Collectors.toList(), ImmutableList::copyOf));

    // create type collection helpers
    ImmutableList<TypeCollection> typeCollections =
        francaModel
            .getTypeCollections()
            .parallelStream()
            .map(fi -> TypeCollection.create(spec, francaModel, fi, deploymentModel))
            .collect(Collectors.collectingAndThen(Collectors.toList(), ImmutableList::copyOf));

    return new FrancaModel(interfaces, typeCollections);
  }

  public static FrancaModel joinModels(List<FrancaModel> models) {
    ImmutableList.Builder<Interface> interfaces = new ImmutableList.Builder<>();
    ImmutableList.Builder<TypeCollection> typeCollections = new ImmutableList.Builder<>();
    models.forEach(
        m -> {
          interfaces.addAll(m.getInterfaces());
          typeCollections.addAll(m.getTypeCollections());
        });
    return new FrancaModel(interfaces.build(), typeCollections.build());
  }

  public boolean isEmpty() {
    return getInterfaces().isEmpty() && getTypeCollections().isEmpty();
  }

  public FrancaModel(
      ImmutableList<Interface> interfaces, ImmutableList<TypeCollection> typeCollections) {
    this.interfaces = interfaces;
    this.typeCollections = typeCollections;
  }

  public ImmutableList<Interface> getInterfaces() {
    return interfaces;
  }

  public ImmutableList<TypeCollection> getTypeCollections() {
    return typeCollections;
  }

  public Optional<? extends FrancaElement> find(FModel model, FTypeCollection needle) {
    return needle instanceof FInterface
        ? findInterface(model, (FInterface) needle)
        : findTypeCollection(model, needle);
  }

  private Optional<Interface> findInterface(FModel model, FInterface needle) {
    return getInterfaces()
        .stream()
        .filter(
            i ->
                i.getName().equals(needle.getName())
                    && i.getFrancaModel().getName().equals(model.getName()))
        .findFirst();
  }

  private Optional<TypeCollection> findTypeCollection(FModel model, FTypeCollection needle) {
    return getTypeCollections()
        .stream()
        .filter(
            i ->
                i.getName().equals(needle.getName())
                    && i.getFrancaModel().getName().equals(model.getName()))
        .findFirst();
  }
}
