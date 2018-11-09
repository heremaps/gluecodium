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

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyBoolean;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.anyList;

import com.here.genium.Genium.Options;
import com.here.genium.cache.CachingStrategy;
import com.here.genium.cache.CachingStrategyCreator;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.loader.FrancaModelLoader;
import com.here.genium.output.ConsoleOutput;
import com.here.genium.output.FileOutput;
import com.here.genium.platform.common.GeneratorSuite;
import com.here.genium.validator.FrancaResourcesValidator;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.jetbrains.annotations.NotNull;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.mockito.*;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({
  GeneratorSuite.class,
  FrancaResourcesValidator.class,
  CachingStrategyCreator.class
})
public class GeniumTest {

  private static final String SHORT_NAME = "android";
  private static final String FILE_NAME = "fileName";
  private static final String OUTPUT_DIR = "someDir";

  private static final String CONTENT = "someContent";
  private static final GeneratedFile FILE = new GeneratedFile("", FILE_NAME);
  private static final List<GeneratedFile> GENERATED_FILES = Collections.singletonList(FILE);

  @Mock private GeneratorSuite generator;
  @Mock private CachingStrategy cache;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaModelLoader francaModelLoader;

  @Rule public final ExpectedException expectedException = ExpectedException.none();
  @Rule public final TemporaryFolder temporaryFolder = new TemporaryFolder();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(
        GeneratorSuite.class, FrancaResourcesValidator.class, CachingStrategyCreator.class);

    when(CachingStrategyCreator.initializeCaching(anyBoolean(), any(), any())).thenReturn(cache);
    Mockito.when(cache.updateCache(any(), any())).thenReturn(new LinkedList<>());
    Mockito.when(cache.write(true)).thenReturn(true);
    Mockito.when(cache.write(false)).thenReturn(false);

    when(FrancaResourcesValidator.validate(any(), any())).thenReturn(true);
    when(generator.getName()).thenReturn("");
    when(GeneratorSuite.instantiateByShortName(any(), any(), any())).thenReturn(generator);
  }

  @Test
  public void defaultGeneratorsAreUsed() {
    // Arrange
    Options options = Options.builder().build();

    // Act, Assert
    assertEquals(GeneratorSuite.generatorShortNames(), createGenium(options).discoverGenerators());
  }

  @Test
  public void failedInstantiationOfGenerator() {
    // Arrange
    when(GeneratorSuite.instantiateByShortName(any(), any(), any())).thenReturn(null);
    Options options =
        Options.builder()
            .inputDirs(new String[] {""})
            .generators(Collections.singleton("invalidGenerator"))
            .build();

    // Act, Assert
    assertFalse(createGenium(options).execute());
  }

  @Test
  public void fileNameCollisionsResolved() {
    // Arrange
    when(generator.generate(any())).thenReturn(Arrays.asList(FILE, FILE, FILE));
    Options options =
        Options.builder()
            .inputDirs(new String[] {""})
            .generators(Collections.singleton(SHORT_NAME))
            .validatingOnly(false)
            .build();

    assertFalse(createGenium(options).execute());
  }

  @Test
  public void executeValidateOnly() {
    // Arrange
    Options options =
        Options.builder()
            .inputDirs(new String[] {""})
            .generators(Collections.singleton(SHORT_NAME))
            .validatingOnly(true)
            .build();

    // Act
    createGenium(options).execute();

    // Assert
    verify(generator, never()).generate(any());
  }

  @Test
  public void useCachingInExecute() {

    // Arrange
    Options options =
        Options.builder()
            .inputDirs(new String[] {""})
            .outputDir(temporaryFolder.getRoot().getPath())
            .generators(Collections.singleton(SHORT_NAME))
            .enableCaching(true)
            .build();

    // Act
    createGenium(options).execute();

    // Verify
    InOrder order = Mockito.inOrder(cache);
    order.verify(cache).updateCache(any(), any());
    order.verify(cache).write(true);
  }

  @Test
  public void ableToOutputConsole() throws IOException {
    // Arrange
    Options.builder().dumpingToStdout(true).build();
    GeneratedFile generatedFile = new GeneratedFile(CONTENT, FILE_NAME);
    ByteArrayOutputStream bo = new ByteArrayOutputStream();
    System.setOut(new PrintStream(bo));
    Options options = Options.builder().dumpingToStdout(true).build();

    // Act
    new Genium(options).output(null, Collections.singletonList(generatedFile));
    bo.flush();
    String consoleOutput = new String(bo.toByteArray());

    // Assert
    assertTrue(consoleOutput.contains("Generated fileName") && consoleOutput.contains(CONTENT));
  }

  @Test
  @PrepareForTest({
    Genium.class,
    FileOutput.class,
    GeneratorSuite.class,
    FrancaResourcesValidator.class,
    CachingStrategyCreator.class
  })
  public void ableToOutputFile() throws Exception {
    // Arrange
    FileOutput mockFileOutput = mock(FileOutput.class);
    PowerMockito.whenNew(FileOutput.class).withAnyArguments().thenReturn(mockFileOutput);
    Options options = Options.builder().outputDir(OUTPUT_DIR).build();
    File mockFile = mock(File.class);
    PowerMockito.whenNew(File.class).withAnyArguments().thenReturn(mockFile);

    // Act, Assert
    assertTrue(new Genium(options).output(null, GENERATED_FILES));
    verify(mockFileOutput, times(1)).output(anyList());
    verify(cache).updateCache(any(), any());
  }

  @PrepareForTest({
    Genium.class,
    GeneratorSuite.class,
    FrancaResourcesValidator.class,
    CachingStrategyCreator.class
  })
  public void failWhenUnableToOpenConsoleForOutput() throws Exception {
    // Arrange
    ConsoleOutput mockConsoleOutput = mock(ConsoleOutput.class);
    PowerMockito.whenNew(ConsoleOutput.class).withNoArguments().thenReturn(mockConsoleOutput);
    Mockito.doThrow(new IOException()).when(mockConsoleOutput).output(anyList());
    Options options = Options.builder().dumpingToStdout(true).build();

    // Act, Assert
    assertFalse(new Genium(options).output(null, GENERATED_FILES));
  }

  @Test
  public void failWhenUnableToOpenOutputDirectory() throws Exception {
    // Arrange
    FileOutput mockFileOutput = mock(FileOutput.class);
    PowerMockito.whenNew(FileOutput.class).withAnyArguments().thenReturn(mockFileOutput);
    Mockito.doThrow(new IOException()).when(mockFileOutput).output(GENERATED_FILES);
    Options options = Options.builder().outputDir("").build();

    // Act, Assert
    assertFalse(new Genium(options).output(null, GENERATED_FILES));
  }

  @Test
  public void mergeAndroidManifestsMergesTwoManifests() throws IOException {
    // Arrange
    String basePath = Paths.get("src", "test", "resources", "android_manifests").toString();
    String baseManifestPath = Paths.get(basePath, "BaseAndroidManifest.xml").toString();
    String appendManifestPath = Paths.get(basePath, "AppendAndroidManifest.xml").toString();
    Path mergedManifestPath =
        Paths.get(temporaryFolder.getRoot().getPath(), "MergedAndroidManifest.xml");
    Path expectedMergedManifestPath = Paths.get(basePath, "ExpectedMergedAndroidManifest.xml");

    // Act
    boolean result =
        Genium.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString());

    // Assert
    assertTrue(result);
    String expectedMergedManifest = new String(Files.readAllBytes(expectedMergedManifestPath));
    String actualMergedManifest = new String(Files.readAllBytes(mergedManifestPath));
    assertEquals(expectedMergedManifest, actualMergedManifest);
  }

  @Test
  public void mergeAndroidManifestsReturnsFalseIfFirstFileDoesNotExist() {
    // Arrange
    String basePath = Paths.get("src", "test", "resources", "android_manifests").toString();
    String baseManifestPath = "INVALID_PATH";
    String appendManifestPath = Paths.get(basePath, "AppendAndroidManifest.xml").toString();
    Path mergedManifestPath =
        Paths.get(temporaryFolder.getRoot().getPath(), "MergedAndroidManifest.xml");

    // Act
    boolean result =
        Genium.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString());

    // Assert
    assertFalse(result);
  }

  @Test
  public void mergeAndroidManifestsReturnsFalseIfSecondFileDoesNotExist() {
    // Arrange
    String basePath = Paths.get("src", "test", "resources", "android_manifests").toString();
    String baseManifestPath = Paths.get(basePath, "BaseAndroidManifest.xml").toString();
    String appendManifestPath = "INVALID_PATH";
    Path mergedManifestPath =
        Paths.get(temporaryFolder.getRoot().getPath(), "MergedAndroidManifest.xml");

    // Act
    boolean result =
        Genium.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString());

    // Assert
    assertFalse(result);
  }

  @NotNull
  private Genium createGenium(final Options options) {
    Genium genium = spy(new Genium(options));
    doReturn(francaModelLoader).when(genium).getFrancaModelLoader();
    doReturn(true).when(genium).validateFrancaModel(any(), any());
    return genium;
  }
}
