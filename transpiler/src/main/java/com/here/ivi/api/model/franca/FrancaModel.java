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

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;

public class FrancaModel {

  private final List<Interface> interfaces;
  private final List<TypeCollection> typeCollections;

  private final Map<String, Map<String, FrancaElement>> lookupTable;

  public FrancaModel(final List<Interface> interfaces, final List<TypeCollection> typeCollections) {
    this.interfaces = interfaces;
    this.typeCollections = typeCollections;

    lookupTable =
        stream()
            .collect(
                Collectors.groupingBy(
                    element -> element.getFrancaModel().getName(),
                    Collectors.toMap(FrancaElement::getName, Function.identity())));
  }

  // creates a FrancaModel from the given FModel & FDModel,
  // ensuring that there are PropertyAccessors for each element
  public static void createElements(
      final FDSpecification spec,
      final FModel francaModel,
      final FrancaDeploymentModel deploymentModel,
      final List<Interface> interfaces,
      final List<TypeCollection> typeCollections) {

    interfaces.addAll(
        francaModel
            .getInterfaces()
            .stream()
            .map(anInterface -> Interface.create(spec, francaModel, anInterface, deploymentModel))
            .collect(Collectors.toList()));

    typeCollections.addAll(
        francaModel
            .getTypeCollections()
            .stream()
            .map(
                typeCollection ->
                    TypeCollection.create(spec, francaModel, typeCollection, deploymentModel))
            .collect(Collectors.toList()));
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

  public FrancaElement find(FTypeCollection typeCollection) {
    FModel model = (FModel) typeCollection.eContainer();
    return lookupTable.get(model.getName()).get(typeCollection.getName());
  }
}
