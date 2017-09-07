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

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;
import static junit.framework.TestCase.assertTrue;

import com.here.ivi.api.OptionReader.TranspilerOptions;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Arrays;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class OptionReaderTest {

  private static final String INPUT = "./inputFile";
  private static final String OUTPUT = "./outputFile";
  private static final String GENERATORS = "java";
  private static final String JAVA_PACKAGE_LIST = "some_package";
  private final OptionReader optionReader = new OptionReader();

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void listGeneratorsOptionIsRecognised() throws OptionReaderException {
    // Arrange, Act
    TranspilerOptions transpilerOptions = optionReader.read(new String[] {"-listGenerators"});

    // Assert
    assertNull(transpilerOptions);
  }

  @Test
  public void helpOptionIsRecognised() throws OptionReaderException {
    // Arrange, Act
    TranspilerOptions transpilerOptions = optionReader.read(new String[] {"-help"});

    // Assert
    assertNull(transpilerOptions);
  }

  @Test
  public void listGeneratorsOptionCreatesOutput() throws OptionReaderException, IOException {
    // Arrange
    ByteArrayOutputStream bo = new ByteArrayOutputStream();
    System.setOut(new PrintStream(bo));

    // Act
    optionReader.read(new String[] {"-listGenerators"});
    bo.flush();
    String consoleOutput = new String(bo.toByteArray());

    // Assert
    assertTrue(consoleOutput.contains("Found generator android"));
  }

  @Test
  public void helpOptionCreatesOutput() throws OptionReaderException, IOException {
    // Arrange
    ByteArrayOutputStream bo = new ByteArrayOutputStream();
    System.setOut(new PrintStream(bo));

    // Act
    optionReader.read(new String[] {"-help"});
    bo.flush();
    String consoleOutput = new String(bo.toByteArray());

    // Assert
    assertTrue(consoleOutput.contains("Transpiler - Generate APIs for franca files"));
  }

  @Test
  public void inputOptionIsRecognisedNoOptionName() throws OptionReaderException {
    // Arrange, Act
    TranspilerOptions transpilerOptions = optionReader.read(new String[] {INPUT});

    // Assert
    assertEquals(INPUT, transpilerOptions.getInputDir());
  }

  @Test
  public void inputOptionIsRecognisedWithOptionName() throws OptionReaderException {
    // Arrange, Act
    TranspilerOptions transpilerOptions = optionReader.read(new String[] {"-input", INPUT});

    // Assert
    assertEquals(INPUT, transpilerOptions.getInputDir());
  }

  @Test
  public void outputOptionIsRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-output", OUTPUT);

    // Act
    TranspilerOptions transpilerOptions = optionReader.read(toRead);

    // Assert
    assertEquals(OUTPUT, transpilerOptions.getOutputDir());
  }

  @Test
  public void generatorsOptionIsRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-generators", GENERATORS);

    // Act
    TranspilerOptions transpilerOptions = optionReader.read(toRead);

    // Assert
    assertEquals(Arrays.asList(GENERATORS), transpilerOptions.getGenerators());
  }

  @Test
  public void javapackageOptionIsRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-javapackage", JAVA_PACKAGE_LIST);

    // Act
    TranspilerOptions transpilerOptions = optionReader.read(toRead);

    // Assert
    assertEquals(Arrays.asList(JAVA_PACKAGE_LIST), transpilerOptions.getJavaPackageList());
  }

  @Test
  public void unknownOptionIsNotRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-someUnknownOption", "");

    // Act, Assert
    expectedException.expect(OptionReaderException.class);
    optionReader.read(toRead);
  }

  private String[] prepareToRead(String optionName, String optionValue) {
    return new String[] {"-input", INPUT, optionName, optionValue};
  }
}
