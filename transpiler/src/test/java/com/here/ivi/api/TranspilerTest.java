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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.OptionReader.TranspilerOptions;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.output.ConsoleOutput;
import com.here.ivi.api.output.FileOutput;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(GeneratorSuite.class)
public class TranspilerTest {

  private static final String SHORT_NAME = "android";
  private static final String FILE_NAME = "fileName";
  private static final String CONTENT = "someContent";
  private static final GeneratedFile FILE = new GeneratedFile("", FILE_NAME);
  private static final List<GeneratedFile> GENERATED_FILES = Collections.singletonList(FILE);

  @Mock private GeneratorSuite generator;

  @Rule public final ExpectedException expectedException = ExpectedException.none();
  @Rule public final TemporaryFolder temporaryFolder = new TemporaryFolder();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(GeneratorSuite.class);

    when(generator.validate()).thenReturn(true);
    when(generator.getName()).thenReturn("");
    when(GeneratorSuite.instantiateByShortName(anyString(), any(TranspilerOptions.class)))
        .thenReturn(generator);
  }

  @Test
  public void defaultGeneratorsAreUsed() {
    // Arrange
    OptionReader.TranspilerOptions options = TranspilerOptions.builder().build();

    // Act, Assert
    assertEquals(
        GeneratorSuite.generatorShortNames(), new Transpiler(options).discoverGenerators());
  }

  @Test
  public void failedInstantiationOfGenerator() {
    // Arrange
    when(GeneratorSuite.instantiateByShortName(
            anyString(), any(OptionReader.TranspilerOptions.class)))
        .thenReturn(null);
    OptionReader.TranspilerOptions options =
        TranspilerOptions.builder()
            .inputDirs(new String[] {""})
            .generators(Collections.singletonList("invalidGenerator"))
            .build();

    // Act, Assert
    assertFalse(new Transpiler(options).execute());
  }

  @Test
  public void fileNameCollisionsResolved() {
    // Arrange
    when(generator.generate()).thenReturn(Arrays.asList(FILE, FILE, FILE));
    OptionReader.TranspilerOptions options =
        TranspilerOptions.builder()
            .inputDirs(new String[] {""})
            .generators(Collections.singletonList(SHORT_NAME))
            .validatingOnly(false)
            .build();

    assertFalse(new Transpiler(options).execute());
  }

  @Test
  public void executeValidateOnly() {
    // Arrange
    OptionReader.TranspilerOptions options =
        TranspilerOptions.builder()
            .inputDirs(new String[] {""})
            .generators(Collections.singletonList(SHORT_NAME))
            .validatingOnly(true)
            .build();

    // Act
    new Transpiler(options).execute();

    // Assert
    verify(generator, never()).generate();
  }

  @Test
  public void ableToOutputConsole() throws IOException {
    // Arrange
    TranspilerOptions.builder().dumpingToStdout(true).build();
    GeneratedFile generatedFile = new GeneratedFile(CONTENT, FILE_NAME);
    ByteArrayOutputStream bo = new ByteArrayOutputStream();
    System.setOut(new PrintStream(bo));
    OptionReader.TranspilerOptions options =
        TranspilerOptions.builder().dumpingToStdout(true).build();

    // Act
    new Transpiler(options).output(Collections.singletonList(generatedFile));
    bo.flush();
    String consoleOutput = new String(bo.toByteArray());

    // Assert
    assertTrue(consoleOutput.contains("Generated fileName") && consoleOutput.contains(CONTENT));
  }

  @Test
  @PrepareForTest({Transpiler.class, FileOutput.class, GeneratorSuite.class})
  public void ableToOutputFile() throws Exception {
    // Arrange
    FileOutput mockFileOutput = mock(FileOutput.class);
    PowerMockito.whenNew(FileOutput.class).withAnyArguments().thenReturn(mockFileOutput);
    OptionReader.TranspilerOptions options =
        TranspilerOptions.builder().outputDir("someDir").build();
    File mockFile = mock(File.class);
    PowerMockito.whenNew(File.class).withAnyArguments().thenReturn(mockFile);

    // Act, Assert
    assertTrue(new Transpiler(options).output(GENERATED_FILES));
    verify(mockFileOutput, times(1)).output(anyList());
  }

  @Test
  @PrepareForTest({Transpiler.class, GeneratorSuite.class})
  public void failWhenUnableToOpenConsoleForOutput() throws Exception {
    // Arrange
    ConsoleOutput mockConsoleOutput = mock(ConsoleOutput.class);
    PowerMockito.whenNew(ConsoleOutput.class).withNoArguments().thenReturn(mockConsoleOutput);
    Mockito.doThrow(new IOException()).when(mockConsoleOutput).output(anyList());
    OptionReader.TranspilerOptions options =
        TranspilerOptions.builder().dumpingToStdout(true).build();

    // Act, Assert
    assertFalse(new Transpiler(options).output(GENERATED_FILES));
  }

  @Test
  public void failWhenUnableToOpenOutputDirectory() throws Exception {
    // Arrange
    FileOutput mockFileOutput = mock(FileOutput.class);
    PowerMockito.whenNew(FileOutput.class).withAnyArguments().thenReturn(mockFileOutput);
    Mockito.doThrow(new IOException()).when(mockFileOutput).output(GENERATED_FILES);
    OptionReader.TranspilerOptions options = TranspilerOptions.builder().outputDir("").build();

    // Act, Assert
    assertFalse(new Transpiler(options).output(GENERATED_FILES));
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
        Transpiler.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString());

    // Assert
    assertTrue(result);
    String expectedMergedManifest = new String(Files.readAllBytes(expectedMergedManifestPath));
    String actualMergedManifest = new String(Files.readAllBytes(mergedManifestPath));
    assertEquals(expectedMergedManifest, actualMergedManifest);
  }

  @Test
  public void mergeAndroidManifestsreturnsFalseIfFirstFileDoesNotExist() {
    // Arrange
    String basePath = Paths.get("src", "test", "resources", "android_manifests").toString();
    String baseManifestPath = "INVALID_PATH";
    String appendManifestPath = Paths.get(basePath, "AppendAndroidManifest.xml").toString();
    Path mergedManifestPath =
        Paths.get(temporaryFolder.getRoot().getPath(), "MergedAndroidManifest.xml");

    // Act
    boolean result =
        Transpiler.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString());

    // Assert
    assertFalse(result);
  }

  @Test
  public void mergeAndroidManifestsreturnsFalseIfSecondFileDoesNotExist() {
    // Arrange
    String basePath = Paths.get("src", "test", "resources", "android_manifests").toString();
    String baseManifestPath = Paths.get(basePath, "BaseAndroidManifest.xml").toString();
    String appendManifestPath = "INVALID_PATH";
    Path mergedManifestPath =
        Paths.get(temporaryFolder.getRoot().getPath(), "MergedAndroidManifest.xml");

    // Act
    boolean result =
        Transpiler.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString());

    // Assert
    assertFalse(result);
  }
}
