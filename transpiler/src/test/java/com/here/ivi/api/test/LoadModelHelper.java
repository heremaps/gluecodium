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

package com.here.ivi.api.test;

import static org.junit.Assert.assertTrue;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.franca.*;
import java.io.File;
import java.net.URISyntaxException;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;

public final class LoadModelHelper {

  public static FrancaDeploymentModel readInFrancaModel(
      final List<String> fileNames, final List<FTypeCollection> typeCollections) {

    FrancaModelLoader francaModelLoader = new FrancaModelLoader();
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);

    Collection<File> testFiles =
        fileNames.stream().map(LoadModelHelper::getTestFile).collect(Collectors.toList());

    return francaModelLoader.load(GeneratorSuite.getSpecPath(), testFiles, typeCollections);
  }

  private static File getTestFile(final String fileName) {
    try {
      return new File(ClassLoader.getSystemClassLoader().getResource(fileName).toURI());
    } catch (URISyntaxException e) {
      return null;
    }
  }

  public static FInterface extractNthInterfaceFromModel(
      List<FTypeCollection> typeCollections, int index) {
    List<FInterface> interfaces = CollectionsHelper.getAllOfType(typeCollections, FInterface.class);
    assertTrue(index < interfaces.size());
    return interfaces.get(index);
  }

  public static FTypeCollection extractNthTypeCollectionFromModel(
      List<FTypeCollection> typeCollections, int index) {
    List<FTypeCollection> filteredTypeCollections =
        CollectionsHelper.getAllNotOfType(typeCollections, FInterface.class);
    assertTrue(index < filteredTypeCollections.size());
    return filteredTypeCollections.get(index);
  }
}
