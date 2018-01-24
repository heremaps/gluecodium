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

import static junit.framework.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({HashValueCalculator.class, MessageDigest.class})
public class HashValueCalculatorTest {

  private static final String TEST_INPUT = "someString";
  private static final byte[] TEST_OUTPUT = TEST_INPUT.getBytes();

  @Mock private MessageDigest md;

  @Before
  public void setUp() throws NoSuchAlgorithmException {
    PowerMockito.mockStatic(MessageDigest.class);
    MockitoAnnotations.initMocks(this);
    PowerMockito.when(MessageDigest.getInstance(any())).thenReturn(md);
    when(md.digest()).thenReturn(TEST_OUTPUT);
  }

  @Test
  public void calculateHashValue() {

    //act
    byte[] result = HashValueCalculator.calculateHashValue(TEST_INPUT);

    //assert
    assertEquals(TEST_OUTPUT, result);
    verify(md).update(TEST_INPUT.getBytes());
    verify(md).digest();
  }
}
