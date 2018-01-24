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
import static org.mockito.Mockito.verify;

import com.here.ivi.api.generator.common.GeneratedFile;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.InOrder;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class TransparentCachingStrategyTest {

  @Mock private MultiFileSetCache cache;

  private TransparentCachingStrategy myStrategy;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    myStrategy = new TransparentCachingStrategy(cache);
  }

  @Test
  public void writeFolderInvalid() {

    // arrange is done in setUp

    //act
    boolean result = myStrategy.write(false);

    //assert
    assertFalse(result);

    InOrder myOrder = Mockito.inOrder(cache);
    myOrder.verify(cache).clearCaches();
    myOrder.verify(cache).writeCache();
  }

  @Test
  public void writeFolderValid() {

    // arrange is done in setUp

    //act
    boolean result = myStrategy.write(true);

    //assert
    assertTrue(result);

    InOrder myOrder = Mockito.inOrder(cache);
    myOrder.verify(cache).finalizeUpdates();
    myOrder.verify(cache).writeCache();
  }

  @Test
  public void updateCache() {

    // arrange
    List<GeneratedFile> fileList =
        Collections.singletonList(new GeneratedFile("content", "fileName"));

    //act
    List<GeneratedFile> result = myStrategy.updateCache("myGeneneratorName", fileList);

    //assert
    assertEquals(fileList, result);
    verify(cache).updateCache("myGeneneratorName", fileList);
  }
}
