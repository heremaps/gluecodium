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

package com.here.ivi.api.loader;

import static java.util.stream.Collectors.toSet;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.franca.FrancaModel;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.function.Function;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import navigation.BaseApiSpec;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.OrFileFilter;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.franca.core.dsl.FrancaPersistenceManager;
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
public class FrancaModelLoader<
    IA extends BaseApiSpec.InterfacePropertyAccessor,
    TA extends BaseApiSpec.TypeCollectionPropertyAccessor> {

  private static final String FIDL_SUFFIX = "fidl";
  public static final String FDEPL_SUFFIX = "fdepl";
  public static final URI ROOT_URI = URI.createURI("classpath:/");

  private static Logger logger = Logger.getLogger(FrancaModelLoader.class.getName());

  // finds all fidl and fdepl files
  public static Collection<File> listFilesRecursively(File path) {
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
    Function<File, String> fileSuffix = f -> FilenameUtils.getExtension(f.getName());

    // create a map of absolute files, mapped by suffix to file
    Map<String, List<File>> map =
        files
            .stream()
            .map(
                f -> {
                  try {
                    return f.getCanonicalFile();
                  } // this throws, which is not supported by the streams apis
                  catch (IOException e) {
                    throw new RuntimeException(e);
                  }
                })
            .collect(Collectors.groupingBy(fileSuffix));

    // ensure null lists are replaced by empty lists
    map.computeIfAbsent(FIDL_SUFFIX, k -> Collections.emptyList());
    map.computeIfAbsent(FDEPL_SUFFIX, k -> Collections.emptyList());

    return map;
  }

  // gets all the imported fidl from a fdepl file
  private static List<File> extractFidlImports(FDModel model) {
    File baseResource = new File(model.eResource().getURI().toFileString()).getParentFile();

    ArrayList<File> imports = new ArrayList<>();
    for (Import imp : model.getImports()) {
      URI u = URI.createURI(imp.getImportURI());
      if (u.isFile() && u.fileExtension().equals(FIDL_SUFFIX)) {
        try {
          File resolved = new File(baseResource, u.toFileString()).getCanonicalFile();
          imports.add(resolved);
        } catch (IOException ignored) {
          throw new TranspilerExecutionException(
              String.format("Could not resolve import %s in %s.", u, baseResource));
        }
      }
    }
    return imports;
  }

  // loads a specification file and returns the first specification found
  private FDSpecification loadSpecification(String uri) {
    FDModel model = fdeplLoader.loadModel(URI.createURI(uri), ROOT_URI);

    if (model.getSpecifications().isEmpty()) {
      throw new RuntimeException("Could not load spec: " + uri + ".");
    }

    return model.getSpecifications().get(0);
  }

  // builds a lists of FrancaModels for all the fidl & fdepl provided
  public FrancaModel<IA, TA> load(String specPath, Collection<File> targetFiles) {
    final FDSpecification spec = loadSpecification(specPath);
    logger.log(Level.INFO, "Loaded specification " + spec.getName());

    Map<String, List<File>> bySuffix = separateFiles(targetFiles);

    // load all found fdepl resources
    Set<FDModel> extendedModels =
        bySuffix
            .get(FDEPL_SUFFIX)
            .parallelStream()
            .map(
                f -> {
                  URI asUri = URI.createFileURI(f.getAbsolutePath());
                  FDModel fdmodel = fdeplLoader.loadModel(asUri, ROOT_URI);
                  logger.log(Level.FINE, "Loading fdepl" + asUri);
                  return fdmodel;
                })
            .collect(toSet());

    // collect all fidl files that are referenced by the fdepl in addition to the ones found by
    // directory scanning
    Set<File> fidlFiles =
        extendedModels
            .stream()
            .map(FrancaModelLoader::extractFidlImports)
            .flatMap(List::stream)
            .collect(toSet());
    fidlFiles.addAll(bySuffix.get(FIDL_SUFFIX));

    FrancaDeploymentModel deploymentModel = FrancaDeploymentModel.create(extendedModels);

    // load all found fidl files and fill the FrancaModel from them
    List<FrancaModel<IA, TA>> models =
        fidlFiles
            .parallelStream()
            .map(
                f -> {
                  URI asUri = URI.createFileURI(f.getAbsolutePath());
                  logger.log(Level.FINE, "Loading fidl " + asUri);
                  return fidlLoader.loadModel(asUri, ROOT_URI);
                })
            .map(
                fm -> {
                  // try to fetch additional data, wrap in FrancaModel
                  File resPath = new File(fm.eResource().getURI().toFileString());
                  return FrancaModel.create(specAccessorFactory, spec, fm, deploymentModel);
                })
            .collect(Collectors.toList());

    return FrancaModel.joinModels(models);
  }

  public FrancaModelLoader(SpecAccessorFactory<IA, TA> specAccessorFactory) {
    this.specAccessorFactory = specAccessorFactory;
  }

  public Provider<ResourceSet> getResourceSetProvider() {
    return resourceSetProvider;
  }

  private final SpecAccessorFactory<IA, TA> specAccessorFactory;
  @Inject private FDeployPersistenceManager fdeplLoader;
  @Inject private FrancaPersistenceManager fidlLoader;
  @Inject private Provider<ResourceSet> resourceSetProvider;
}
