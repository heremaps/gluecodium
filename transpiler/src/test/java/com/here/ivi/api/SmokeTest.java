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

package com.here.ivi.api;

import static org.junit.Assert.*;
import static org.junit.Assume.assumeFalse;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.spy;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;
import org.eclipse.xtext.util.Files;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;
import org.mockito.*;

@RunWith(Parameterized.class)
public final class SmokeTest {
  private static final String FEATURE_INPUT_FOLDER = "input";
  private static final String FEATURE_OUTPUT_FOLDER = "output";
  private static final List<String> GENERATOR_NAMES = GeneratorSuite.generatorShortNames();
  private static final String RESOURCE_PREFIX = "smoke";

  private final Transpiler transpiler =
      spy(new Transpiler(OptionReader.TranspilerOptions.builder().build()));
  private final File featureDirectory;
  private final String generatorName;
  private final List<GeneratedFile> results = new LinkedList<>();

  @Before
  public void setUp() {
    Mockito.doAnswer(
            invocation -> {
              @SuppressWarnings("unchecked")
              List<GeneratedFile> generatedFiles =
                  (List<GeneratedFile>) invocation.getArguments()[0];
              results.addAll(generatedFiles);
              return true;
            })
        .when(transpiler)
        .output(any());
  }

  @Parameters(name = "{2}, {1}")
  public static Collection<Object[]> data() {
    URL smokeResourcesUrl = ClassLoader.getSystemClassLoader().getResource(RESOURCE_PREFIX);
    if (smokeResourcesUrl == null) {
      fail("Smoke test resources directory not found");
      return Collections.emptyList();
    }

    File smokeResourcesDirectory;
    try {
      smokeResourcesDirectory = new File(smokeResourcesUrl.toURI());
    } catch (URISyntaxException e) {
      fail("Unable to load smoke test resources");
      return Collections.emptyList();
    }

    File[] featureDirectoryResources = smokeResourcesDirectory.listFiles();
    if (featureDirectoryResources == null) {
      fail("No smoke test features were found");
      return Collections.emptyList();
    }
    return Arrays.stream(featureDirectoryResources)
        .filter(File::isDirectory)
        .flatMap(
            directory ->
                GENERATOR_NAMES
                    .stream()
                    .map(
                        generatorName ->
                            new Object[] {
                              directory,
                              generatorName,
                              getFeatureName(smokeResourcesDirectory, directory)
                            }))
        .collect(Collectors.toList());
  }

  public SmokeTest(
      final File featureDirectory,
      final String generatorName,
      @SuppressWarnings("unused") final String featureName) {
    this.featureDirectory = featureDirectory;
    this.generatorName = generatorName;
  }

  @Test
  public void smokeTest() {
    File inputDirectory = new File(featureDirectory, FEATURE_INPUT_FOLDER);
    File outputDirectory = new File(featureDirectory, FEATURE_OUTPUT_FOLDER);
    File outputForGeneratorDirectory = new File(outputDirectory, generatorName);

    Collection<File> referenceFiles = listFilesRecursively(outputForGeneratorDirectory);
    assumeFalse("No reference files were found", referenceFiles.isEmpty());

    assertTrue(
        transpiler.executeGenerator(
            generatorName, Collections.singletonList(inputDirectory), new HashMap<>()));

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
      assertNotNull("File was not generated: " + relativePath, generatedContent);

      String expected = Files.readFileIntoString(referenceFile.getPath());
      assertEquals(
          "File content differs for file: " + relativePath,
          ignoreWhitespace(expected),
          ignoreWhitespace(generatedContent));
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
