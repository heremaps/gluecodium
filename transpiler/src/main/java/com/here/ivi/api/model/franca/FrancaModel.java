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

import com.google.common.annotations.VisibleForTesting;
import com.google.common.collect.ImmutableList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;

public class FrancaModel {

  private final List<Interface> interfaces;
  private final List<TypeCollection> typeCollections;

  // creates a FrancaModel from the given FModel & FDModel,
  // ensuring that there are PropertyAccessors for each element
  public static FrancaModel create(
      final FDSpecification spec,
      final FModel francaModel,
      final FrancaDeploymentModel deploymentModel) {

    // create interface helpers
    ImmutableList<Interface> interfaces =
        francaModel
            .getInterfaces()
            .stream()
            .map(anInterface -> Interface.create(spec, francaModel, anInterface, deploymentModel))
            .collect(Collectors.collectingAndThen(Collectors.toList(), ImmutableList::copyOf));

    // create type collection helpers
    ImmutableList<TypeCollection> typeCollections =
        francaModel
            .getTypeCollections()
            .stream()
            .map(
                typeCollection ->
                    TypeCollection.create(spec, francaModel, typeCollection, deploymentModel))
            .collect(Collectors.collectingAndThen(Collectors.toList(), ImmutableList::copyOf));

    return new FrancaModel(interfaces, typeCollections);
  }

  public static FrancaModel joinModels(List<FrancaModel> models) {
    ImmutableList.Builder<Interface> interfaces = new ImmutableList.Builder<>();
    ImmutableList.Builder<TypeCollection> typeCollections = new ImmutableList.Builder<>();
    models.forEach(
        model -> {
          interfaces.addAll(model.getInterfaces());
          typeCollections.addAll(model.getTypeCollections());
        });
    return new FrancaModel(interfaces.build(), typeCollections.build());
  }

  @VisibleForTesting
  FrancaModel(ImmutableList<Interface> interfaces, ImmutableList<TypeCollection> typeCollections) {
    this.interfaces = interfaces;
    this.typeCollections = typeCollections;
  }

  public List<Interface> getInterfaces() {
    return interfaces;
  }

  public List<TypeCollection> getTypeCollections() {
    return typeCollections;
  }

  public Stream<FrancaElement> stream() {
    return Stream.concat(interfaces.stream(), typeCollections.stream());
  }

  public Optional<? extends FrancaElement> find(FTypeCollection typeCollection) {
    FModel model = (FModel) typeCollection.eContainer();
    return typeCollection instanceof FInterface
        ? findInterface(model, (FInterface) typeCollection)
        : findTypeCollection(model, typeCollection);
  }

  private Optional<Interface> findInterface(FModel model, FInterface needle) {
    return getInterfaces()
        .stream()
        .filter(
            anInterface ->
                anInterface.getName().equals(needle.getName())
                    && anInterface.getFrancaModel().getName().equals(model.getName()))
        .findFirst();
  }

  private Optional<TypeCollection> findTypeCollection(FModel model, FTypeCollection needle) {
    return getTypeCollections()
        .stream()
        .filter(
            typeCollection ->
                typeCollection.getName().equals(needle.getName())
                    && typeCollection.getFrancaModel().getName().equals(model.getName()))
        .findFirst();
  }
}
