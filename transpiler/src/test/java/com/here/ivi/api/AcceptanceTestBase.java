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

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.junit.Assume.assumeFalse;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.spy;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.platform.android.AndroidGeneratorSuite;
import com.here.ivi.api.platform.baseapi.BaseApiGeneratorSuite;
import com.here.ivi.api.platform.swift.SwiftGeneratorSuite;
import com.here.ivi.api.test.NiceErrorCollector;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import org.eclipse.xtext.util.Files;
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
  private static final String COPYRIGHT_YEAR_REGEX = "(?<=\\(C\\)) 20\\d\\d";
  private static final Pattern COPYRIGHT_YEAR_PATTERN = Pattern.compile(COPYRIGHT_YEAR_REGEX);

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

  private final Transpiler transpiler =
      spy(new Transpiler(OptionReader.TranspilerOptions.builder().build()));

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
                  (List<GeneratedFile>) invocation.getArguments()[0];
              results.addAll(generatedFiles);
              return true;
            })
        .when(transpiler)
        .output(any());
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

    Collection<File> referenceFiles =
        GENERATOR_DIRECTORIES
            .get(generatorName)
            .stream()
            .map(generatorDirectoryName -> new File(outputDirectory, generatorDirectoryName))
            .flatMap(generatorDirectory -> listFilesRecursively(generatorDirectory).stream())
            .filter(file -> !file.getName().toLowerCase().startsWith(IGNORE_PREFIX))
            .collect(Collectors.toList());
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
      errorCollector.checkNotNull(
          "File was not generated: "
              + relativePath
              + ", generated files: "
              + generatedContents.keySet(),
          generatedContent);

      if (generatedContent != null) {
        String expected = Files.readFileIntoString(referenceFile.getPath());
        errorCollector.checkEquals(
            "Copyright header differs for file: " + relativePath,
            COPYRIGHT_YEAR_PATTERN.matcher(expected).find(),
            COPYRIGHT_YEAR_PATTERN.matcher(generatedContent).find());
        errorCollector.checkEquals(
            "File content differs for file: " + relativePath,
            ignoreWhitespaceAndCopyrightYear(expected),
            ignoreWhitespaceAndCopyrightYear(generatedContent));
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

  private static String ignoreWhitespaceAndCopyrightYear(String text) {
    return text.replaceAll(COPYRIGHT_YEAR_REGEX, "") // ignore copyright year
        .replaceAll("( *\n)+", "\n") // ignore repeating empty lines
        .trim(); // ignore leading and trailing whitespace
  }

  private static String getFeatureName(final File parentDirectory, final File featureDirectory) {
    return getRelativePath(parentDirectory, featureDirectory).replace("/", "");
  }
}
