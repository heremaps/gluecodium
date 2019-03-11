/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.test;

import static org.junit.Assert.assertTrue;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.loader.FrancaModelLoader;
import com.here.genium.model.franca.*;
import com.here.genium.platform.common.GeneratorSuite;
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
