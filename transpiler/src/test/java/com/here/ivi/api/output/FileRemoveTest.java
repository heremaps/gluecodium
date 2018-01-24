/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.output;

import static junit.framework.TestCase.assertTrue;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
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
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
//FileRemove needs to be prepared for test in order to make mocking of Files.class work
//see: https://github.com/powermock/powermock/wiki/Mock-System
@PrepareForTest({FileRemove.class})
public final class FileRemoveTest {

  @Rule public ExpectedException exception = ExpectedException.none();

  private static final String ROOT_DIR = "/myPath";

  @Mock private File rootFile;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(Files.class);
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void removeFilesNonExisting() throws FileNotFoundException {

    //arrange
    when(rootFile.exists()).thenReturn(false);
    when(rootFile.isDirectory()).thenReturn(true);

    exception.expect(FileNotFoundException.class);

    //act
    new FileRemove(rootFile).removeFiles(Collections.emptyList());
  }

  @Test
  public void removeFilesNoDirectory() throws FileNotFoundException {

    //arrange
    when(rootFile.exists()).thenReturn(true);
    when(rootFile.isDirectory()).thenReturn(false);

    exception.expect(FileNotFoundException.class);

    //act
    new FileRemove(rootFile).removeFiles(Collections.emptyList());
  }

  @Test
  public void removeFilesSuccess() throws IOException {

    //arrange
    when(rootFile.exists()).thenReturn(true);
    when(rootFile.isDirectory()).thenReturn(true);
    when(rootFile.getCanonicalPath()).thenReturn(ROOT_DIR);

    Path regularFile = Paths.get(ROOT_DIR, "fileOne");
    Path foreignFile = Paths.get(ROOT_DIR + "x", "fileThree");
    Path nonRegularFile = Paths.get(ROOT_DIR, "nonRegular");
    List<Path> filesToRemove = Arrays.asList(regularFile, foreignFile, nonRegularFile);

    PowerMockito.when(Files.isRegularFile(regularFile)).thenReturn(true);
    PowerMockito.when(Files.isRegularFile(foreignFile)).thenReturn(true);
    PowerMockito.when(Files.isRegularFile(nonRegularFile)).thenReturn(false);

    FileRemove remover = new FileRemove(rootFile);

    //act
    boolean success = remover.removeFiles(filesToRemove);

    //assert
    assertTrue(success);

    verifyStatic();
    Files.isRegularFile(regularFile);
    verifyStatic();
    Files.delete(regularFile);

    PowerMockito.verifyStatic();
    Files.isRegularFile(foreignFile);
    verifyStatic(never());
    Files.delete(foreignFile);
    verifyStatic();
    Files.isRegularFile(nonRegularFile);
    verifyStatic(never());
    Files.delete(nonRegularFile);
  }
}
