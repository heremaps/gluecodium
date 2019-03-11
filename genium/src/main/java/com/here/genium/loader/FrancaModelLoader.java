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

package com.here.genium.loader;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.model.franca.*;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.function.Function;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.OrFileFilter;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.franca.core.dsl.FrancaPersistenceManager;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.dsl.FDeployPersistenceManager;
import org.franca.deploymodel.dsl.fDeploy.*;

/**
 * The FrancaModelLoader scans a directory recursively for fdepl and fidl files and collects all the
 * data from them.
 *
 * <ol>
 *   <li>It scans the directory for all .fdepl and .fidl files.
 *   <li>It then loads & parses each fdepl file using the FDeployPersistenceManager.
 *   <li>It collects all the interfaces/types/etc combined with their special InterfaceAccessor if
 *       data is defined.
 *   <li>Lastly it loads & parses all fidl files that were not imported by the fdepl files using the
 *       FrancaPersistenceManager, and collects the ones that were not already specified in the
 *       fdepl.
 * </ol>
 *
 * @implNote The loader does not support more than one fdepl file describing the same interfaces or
 *     types
 */
public class FrancaModelLoader {

  private static final Logger LOGGER = Logger.getLogger(FrancaModelLoader.class.getName());

  private static final String FIDL_SUFFIX = "fidl";
  public static final String FDEPL_SUFFIX = "fdepl";
  public static final URI ROOT_URI = URI.createURI("classpath:/");

  @Inject private FDeployPersistenceManager fdeplLoader;
  @Inject private FrancaPersistenceManager fidlLoader;
  @Inject private Provider<ResourceSet> resourceSetProvider;

  public Provider<ResourceSet> getResourceSetProvider() {
    return resourceSetProvider;
  }

  public static List<File> listFilesRecursively(final Collection<File> inputPaths) {
    return inputPaths
        .stream()
        .map(FrancaModelLoader::listFilesRecursively)
        .flatMap(Collection::stream)
        .collect(Collectors.toList());
  }

  // finds all fidl and fdepl files
  private static Collection<File> listFilesRecursively(File path) {
    String p = path.getPath();
    if (p.startsWith("~" + File.separator)) {
      p = System.getProperty("user.home") + p.substring(1);
      path = new File(p);
    }
    if (path.isFile()) {
      return Collections.singletonList(path);
    }

    if (path.isDirectory()) {
      return FileUtils.listFiles(
          path,
          new OrFileFilter(new SuffixFileFilter(FIDL_SUFFIX), new SuffixFileFilter(FDEPL_SUFFIX)),
          DirectoryFileFilter.DIRECTORY);
    }

    return Collections.emptyList();
  }

  // groups the files by extension
  private static Map<String, List<File>> separateFiles(Collection<File> files) {

    Function<File, String> fileSuffix = file -> FilenameUtils.getExtension(file.getName());

    // create a map of absolute files, mapped by suffix to file
    Map<String, List<File>> map =
        files
            .stream()
            .map(
                f -> {
                  try {
                    return f.getCanonicalFile();
                  } catch (IOException e) {
                    // this throws, which is not supported by the streams APIs
                    throw new GeniumExecutionException(
                        "getCanonicalFile() failed for file " + f.toString(), e);
                  }
                })
            .sorted()
            .collect(Collectors.groupingBy(fileSuffix));

    // ensure null lists are replaced by empty lists
    map.computeIfAbsent(FIDL_SUFFIX, key -> Collections.emptyList());
    map.computeIfAbsent(FDEPL_SUFFIX, key -> Collections.emptyList());

    return map;
  }

  // loads a specification file and returns the first specification found
  private FDSpecification loadSpecification(String uri) {
    FDModel model = fdeplLoader.loadModel(URI.createURI(uri), ROOT_URI);

    if (model.getSpecifications().isEmpty()) {
      throw new GeniumExecutionException("Could not load spec: " + uri + ".");
    }

    return model.getSpecifications().get(0);
  }

  // builds a lists of FrancaModels for all the fidl & fdepl provided
  public FrancaDeploymentModel load(
      final String specPath,
      final Collection<File> targetFiles,
      final List<FTypeCollection> typeCollectionResults) {
    final FDSpecification spec = loadSpecification(specPath);
    LOGGER.fine("Loaded specification " + spec.getName());

    Map<String, List<File>> bySuffix = separateFiles(targetFiles);

    // load all found fdepl resources
    Collection<FDModel> extendedModels =
        bySuffix
            .get(FDEPL_SUFFIX)
            .stream()
            .map(this::loadDeploymentModel)
            .collect(Collectors.toList());

    // load all found fidl files and fill the Interfaces and TypeCollections lists from them
    bySuffix
        .get(FIDL_SUFFIX)
        .stream()
        .map(
            file -> {
              URI asUri = URI.createFileURI(file.getAbsolutePath());
              LOGGER.fine("Loading fidl " + asUri);
              return fidlLoader.loadModel(asUri, ROOT_URI);
            })
        .forEach(
            fModel -> {
              typeCollectionResults.addAll(fModel.getInterfaces());
              typeCollectionResults.addAll(fModel.getTypeCollections());
            });

    return new FrancaDeploymentModel(extendedModels);
  }

  private FDModel loadDeploymentModel(File file) {

    URI fileURI = URI.createFileURI(file.getAbsolutePath());
    LOGGER.fine("Loading fdepl " + fileURI);

    FDModel deploymentModel;
    try {
      deploymentModel = fdeplLoader.loadModel(fileURI, ROOT_URI);
    } catch (IndexOutOfBoundsException e) {
      throw new GeniumExecutionException("Loading fdepl failed: " + fileURI, e);
    }

    return deploymentModel;
  }
}
