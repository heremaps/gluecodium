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

package com.here.ivi.api.cache;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;
import static org.powermock.api.mockito.PowerMockito.when;
import static org.powermock.api.mockito.PowerMockito.whenNew;

import com.here.ivi.api.output.FileRemove;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedList;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({MultiFileSetCache.class, CleanUpCachingStrategy.class})
public class CleanUpCachingStrategyTest {

  private static final String ROOTDIRNAME = "root";
  private final CleanUpCachingStrategy myStrategy =
      new CleanUpCachingStrategy(ROOTDIRNAME, new HashSet<>(Arrays.asList("SetA")));

  @Mock private FileRemove remover;

  @Before
  public void setUp() throws Exception {
    PowerMockito.mockStatic(MultiFileSetCache.class);
    whenNew(FileRemove.class).withAnyArguments().thenReturn(remover);
  }

  @Test
  public void writeRootDirectoryNull() throws IOException {

    //arrange
    CleanUpCachingStrategy nullStrategy =
        new CleanUpCachingStrategy(null, new HashSet<>(Arrays.asList("SetA")));

    //act
    nullStrategy.write(true);

    //verify
    verifyStatic(never());
    MultiFileSetCache.retrieveExistingCacheFiles(ROOTDIRNAME, new HashSet<>(Arrays.asList("SetA")));
    verify(remover, never()).removeFiles(any());
  }

  @Test
  public void writeExistingCacheFiles() throws IOException {

    //arrange
    when(MultiFileSetCache.retrieveExistingCacheFiles(any(), any()))
        .thenReturn(Arrays.asList(Paths.get("1"), Paths.get("2"), Paths.get("3")));

    //act
    myStrategy.write(true);

    //verify
    verifyStatic();
    MultiFileSetCache.retrieveExistingCacheFiles(ROOTDIRNAME, new HashSet<>(Arrays.asList("SetA")));
    verify(remover).removeFiles(Arrays.asList(Paths.get("1"), Paths.get("2"), Paths.get("3")));
  }

  @Test
  public void writeNonExistingCacheFiles() throws IOException {

    //arrange
    when(MultiFileSetCache.retrieveExistingCacheFiles(any(), any())).thenReturn(new LinkedList<>());

    //act
    myStrategy.write(true);

    //verify
    verifyStatic();
    MultiFileSetCache.retrieveExistingCacheFiles(ROOTDIRNAME, new HashSet<>(Arrays.asList("SetA")));
    verify(remover, never()).removeFiles(any());
  }
}
