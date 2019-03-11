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

package com.here.genium;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.junit.Assume.assumeFalse;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.spy;

import com.here.genium.cli.OptionReader;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.platform.android.AndroidGeneratorSuite;
import com.here.genium.platform.baseapi.BaseApiGeneratorSuite;
import com.here.genium.platform.swift.SwiftGeneratorSuite;
import com.here.genium.test.NiceErrorCollector;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.*;
import java.util.stream.Collectors;
import org.eclipse.xtext.util.Files;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Rule;
import org.mockito.Mockito;

public abstract class AcceptanceTestBase {

  private static final String FEATURE_INPUT_FOLDER = "input";
  private static final String FEATURE_OUTPUT_FOLDER = "output";
  private static final String IGNORE_PREFIX = "ignore";
  private static final List<String> GENERATOR_NAMES =
      Arrays.asList(
          BaseApiGeneratorSuite.GENERATOR_NAME,
          AndroidGeneratorSuite.GENERATOR_NAME,
          SwiftGeneratorSuite.GENERATOR_NAME);
  private static final Map<String, List<String>> GENERATOR_DIRECTORIES = new HashMap<>();

  static {
    GENERATOR_DIRECTORIES.put(
        BaseApiGeneratorSuite.GENERATOR_NAME,
        Collections.singletonList(BaseApiGeneratorSuite.GENERATOR_NAME));
    GENERATOR_DIRECTORIES.put(
        AndroidGeneratorSuite.GENERATOR_NAME,
        Collections.singletonList(AndroidGeneratorSuite.GENERATOR_NAME));
    GENERATOR_DIRECTORIES.put(
        SwiftGeneratorSuite.GENERATOR_NAME,
        Arrays.asList(SwiftGeneratorSuite.GENERATOR_NAME, "cbridge", "cbridge_internal"));
  }

  @Rule public final NiceErrorCollector errorCollector = new NiceErrorCollector();

  private final Genium genium = spy(new Genium(OptionReader.DEFAULT_OPTIONS));

  private final File featureDirectory;
  private final String generatorName;

  private final List<GeneratedFile> results = new LinkedList<>();

  protected AcceptanceTestBase(final File featureDirectory, final String generatorName) {
    this.featureDirectory = featureDirectory;
    this.generatorName = generatorName;
  }

  @Before
  public void setUp() {
    Mockito.doAnswer(
            invocation -> {
              @SuppressWarnings("unchecked")
              List<GeneratedFile> generatedFiles =
                  (List<GeneratedFile>) invocation.getArguments()[1];
              results.addAll(generatedFiles);
              return true;
            })
        .when(genium)
        .output(any(), any());
  }

  protected static Collection<Object[]> getData(final String resourcePrefix) {
    URL testResourcesUrl = ClassLoader.getSystemClassLoader().getResource(resourcePrefix);
    if (testResourcesUrl == null) {
      fail("Test resources directory not found");
      return Collections.emptyList();
    }

    File testResourcesDirectory;
    try {
      testResourcesDirectory = new File(testResourcesUrl.toURI());
    } catch (URISyntaxException e) {
      fail("Unable to load test resources");
      return Collections.emptyList();
    }

    File[] featureDirectoryResources = testResourcesDirectory.listFiles();
    if (featureDirectoryResources == null) {
      fail("No test features were found");
      return Collections.emptyList();
    }
    return Arrays.stream(featureDirectoryResources)
        .filter(File::isDirectory)
        .sorted()
        .flatMap(
            directory ->
                GENERATOR_NAMES
                    .stream()
                    .map(
                        generatorName ->
                            new Object[] {
                              directory,
                              generatorName,
                              getFeatureName(testResourcesDirectory, directory)
                            }))
        .collect(Collectors.toList());
  }

  protected void runTest() {
    File inputDirectory = new File(featureDirectory, FEATURE_INPUT_FOLDER);
    File outputDirectory = new File(featureDirectory, FEATURE_OUTPUT_FOLDER);

    List<File> referenceFiles =
        GENERATOR_DIRECTORIES
            .get(generatorName)
            .stream()
            .map(generatorDirectoryName -> new File(outputDirectory, generatorDirectoryName))
            .flatMap(generatorDirectory -> listFilesRecursively(generatorDirectory).stream())
            .filter(file -> !file.getName().toLowerCase().startsWith(IGNORE_PREFIX))
            .collect(Collectors.toList());
    assumeFalse("No reference files were found", referenceFiles.isEmpty());

    List<FTypeCollection> typeCollections = new LinkedList<>();
    FrancaDeploymentModel deploymentModel =
        genium.loadModel(Collections.singletonList(inputDirectory), typeCollections);
    assertNotNull(deploymentModel);
    assertTrue(
        genium.executeGenerator(generatorName, deploymentModel, typeCollections, new HashMap<>()));

    Map<String, String> generatedContents =
        results
            .stream()
            .collect(
                Collectors.toMap(
                    generatedFile -> generatedFile.targetFile.getPath(),
                    generatedFile -> generatedFile.content));

    for (final File referenceFile : referenceFiles) {
      String relativePath = getRelativePath(outputDirectory, referenceFile);
      String generatedContent = generatedContents.get(relativePath);
      errorCollector.checkNotNull(
          "File was not generated: "
              + relativePath
              + ", generated files: "
              + generatedContents.keySet(),
          generatedContent);

      if (generatedContent != null) {
        String expected = Files.readFileIntoString(referenceFile.getPath());
        errorCollector.checkEquals(
            "File content differs for file: " + relativePath,
            ignoreWhitespace(expected),
            ignoreWhitespace(generatedContent));
      }
    }
  }

  private static Collection<File> listFilesRecursively(final File directory) {

    final File[] files = directory.listFiles();
    if (files == null) {
      return Collections.emptyList();
    }

    Collection<File> result = new LinkedList<>();
    for (final File file : files) {
      if (file.isDirectory()) {
        result.addAll(listFilesRecursively(file));
      } else {
        result.add(file);
      }
    }

    return result;
  }

  private static String getRelativePath(final File directory, final File file) {
    return directory.toURI().relativize(file.toURI()).getPath();
  }

  private static String ignoreWhitespace(String text) {
    return text.replaceAll("( *\n)+", "\n") // ignore repeating empty lines
        .trim(); // ignore leading and trailing whitespace
  }

  private static String getFeatureName(final File parentDirectory, final File featureDirectory) {
    return getRelativePath(parentDirectory, featureDirectory).replace("/", "");
  }
}
