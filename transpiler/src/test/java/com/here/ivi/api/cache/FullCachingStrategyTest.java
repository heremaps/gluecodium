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

import static junit.framework.TestCase.assertEquals;
import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.whenNew;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.output.FileRemove;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InOrder;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FullCachingStrategy.class)
public class FullCachingStrategyTest {

  private static final String OUT_FOLDER = "outFolder";

  @Mock private MultiFileSetCache cache;

  @Mock private FileRemove fileRemover;

  private FullCachingStrategy cacheStrategy;

  @Before
  public void setUp() throws Exception {
    MockitoAnnotations.initMocks(this);

    when(cache.getNonCachedFiles()).thenReturn(new LinkedList<>());
    when(fileRemover.removeFiles(new LinkedList<>())).thenReturn(true);
    whenNew(FileRemove.class).withArguments(new File(OUT_FOLDER)).thenReturn(fileRemover);

    cacheStrategy = new FullCachingStrategy(cache, OUT_FOLDER);
  }

  @Test
  public void writeFolderInvalid() {

    // arrange is done in setUp

    //act
    boolean result = cacheStrategy.write(false);

    //assert
    assertFalse(result);

    InOrder myOrder = Mockito.inOrder(cache);
    myOrder.verify(cache).clearCaches();
    myOrder.verify(cache).writeCache();
  }

  @Test
  public void writeFolderValid() throws FileNotFoundException {

    // arrange is done in setUp

    //act
    boolean result = cacheStrategy.write(true);

    //assert
    assertTrue(result);

    InOrder myOrder = Mockito.inOrder(cache, fileRemover);
    myOrder.verify(cache).finalizeUpdates();
    myOrder.verify(cache).writeCache();
    myOrder.verify(cache).getNonCachedFiles();
    myOrder.verify(fileRemover).removeFiles(new LinkedList<>());
  }

  @Test
  public void writeFolderValidRemovalReturnsFalse() throws FileNotFoundException {

    // arrange
    when(fileRemover.removeFiles(any())).thenReturn(false);

    //act
    boolean result = cacheStrategy.write(true);

    //assert
    assertFalse(result);

    InOrder myOrder = Mockito.inOrder(cache, fileRemover);
    myOrder.verify(cache).finalizeUpdates();
    myOrder.verify(cache).writeCache();
    myOrder.verify(cache).getNonCachedFiles();
    myOrder.verify(fileRemover).removeFiles(new LinkedList<>());
  }

  @Test
  public void updateCache() {

    // arrange
    List<GeneratedFile> fileList =
        Collections.singletonList(new GeneratedFile("content", "fileName"));

    //act
    List<GeneratedFile> result = cacheStrategy.updateCache("myGeneratorName", fileList);

    //assert
    assertEquals(new LinkedList<>(), result);
    verify(cache).updateCache("myGeneratorName", fileList);
  }
}
