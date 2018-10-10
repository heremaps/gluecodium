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

package com.here.genium.cli;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.here.genium.Genium.Options;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Collections;
import java.util.Set;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class OptionReaderTest {

  private static final String[] TEST_INPUT_SINGLE_FOLDER = {"dirA"};
  private static final String[] TEST_INPUT_TWO_FOLDERS = {"dirA", "dirB"};
  private static final String TEST_OUTPUT = "./outputFile";
  private static final String TEST_GENERATORS = "java,cpp";
  private static final String TEST_JAVA_PACKAGE_LIST = "some_package";
  private static final String TEST_ADDITIONAL_ANDROID_MANIFEST =
      "path/to/additional/AndroidManifest.xml";

  private final OptionReader optionReader = new OptionReader();

  @Rule public final ExpectedException expectedException = ExpectedException.none();
  @Rule public final TemporaryFolder temporaryFolder = new TemporaryFolder();

  @Test
  public void helpOptionIsRecognised() throws OptionReaderException {
    // Arrange, Act
    Options options = optionReader.read(new String[] {"-help"});

    // Assert
    assertNull(options);
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
    assertTrue(consoleOutput.contains("Genium - Generate APIs from Franca IDL files"));
  }

  @Test
  public void inputOptionSingleFolder() throws OptionReaderException {
    // Arrange, Act
    Options options = optionReader.read(new String[] {"-input", TEST_INPUT_SINGLE_FOLDER[0]});

    // Assert
    assertNotNull(options.getInputDirs());
    assertEquals(1, options.getInputDirs().length);
    assertEquals(TEST_INPUT_SINGLE_FOLDER[0], options.getInputDirs()[0]);
  }

  @Test
  public void inputOptionTwoFolders() throws OptionReaderException {
    // Arrange, Act
    Options options =
        optionReader.read(
            new String[] {
              "-input", TEST_INPUT_TWO_FOLDERS[0],
              "-input", TEST_INPUT_TWO_FOLDERS[1]
            });

    // Assert
    assertNotNull(options.getInputDirs());
    assertEquals(2, options.getInputDirs().length);
    assertEquals(TEST_INPUT_TWO_FOLDERS[0], options.getInputDirs()[0]);
    assertEquals(TEST_INPUT_TWO_FOLDERS[1], options.getInputDirs()[1]);
  }

  @Test
  public void outputOptionIsRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-output", TEST_OUTPUT);

    // Act
    Options options = optionReader.read(toRead);

    // Assert
    assertEquals(TEST_OUTPUT, options.getOutputDir());
  }

  @Test
  public void generatorsOptionIsRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-generators", TEST_GENERATORS);

    // Act
    Options options = optionReader.read(toRead);

    // Assert
    Set<String> generators = options.getGenerators();
    assertTrue(generators.contains("cpp"));
    assertTrue(generators.contains("java"));
  }

  @Test
  public void javapackageOptionIsRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-javapackage", TEST_JAVA_PACKAGE_LIST);

    // Act
    Options options = optionReader.read(toRead);

    // Assert
    assertEquals(Collections.singletonList(TEST_JAVA_PACKAGE_LIST), options.getJavaPackageList());
  }

  @Test
  public void unknownOptionIsNotRecognised() throws OptionReaderException {
    // Arrange
    String[] toRead = prepareToRead("-someUnknownOption", "");

    // Act, Assert
    expectedException.expect(OptionReaderException.class);
    optionReader.read(toRead);
  }

  @Test
  public void androidMergeManifestPathIsRecognised() throws OptionReaderException {
    String[] toRead = prepareToRead("-mergemanifest", TEST_ADDITIONAL_ANDROID_MANIFEST);
    Options options = optionReader.read(toRead);
    assertEquals(TEST_ADDITIONAL_ANDROID_MANIFEST, options.getAndroidMergeManifestPath());
  }

  @Test
  public void copyrightHeaderPathIsRecognised() throws OptionReaderException, IOException {
    temporaryFolder.newFile("Foo.txt");
    String[] toRead =
        prepareToRead("-copyright", temporaryFolder.getRoot().getAbsolutePath() + "/Foo.txt");

    Options options = optionReader.read(toRead);

    assertEquals("", options.getCopyrightHeaderContents());
  }

  private String[] prepareToRead(String optionName, String optionValue) {
    return new String[] {"-input", TEST_INPUT_SINGLE_FOLDER[0], optionName, optionValue};
  }
}
