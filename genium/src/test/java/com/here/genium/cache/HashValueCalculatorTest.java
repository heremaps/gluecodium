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

package com.here.genium.cache;

import static org.junit.Assert.assertEquals;
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
