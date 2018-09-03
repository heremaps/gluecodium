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

package com.here.genium.model.cbridge;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.Include;
import java.util.Arrays;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CBridgeIncludeResolverTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModelElement francaElement;

  private CBridgeIncludeResolver includeResolver;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    includeResolver = new CBridgeIncludeResolver(Arrays.asList("ro", "ot"));

    when(francaElement.eContainer()).thenReturn(francaTypeCollection);
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);

    when(francaTypeCollection.getName()).thenReturn("SomeTypeCollection");
    when(francaModel.getName()).thenReturn("my.fancy.package");
  }

  @Test
  public void resolveInclude() {
    Include result = includeResolver.resolveInclude(francaElement);

    assertEquals("cbridge/include/ro/ot/my/fancy/package/SomeTypeCollection.h", result.fileName);
  }

  @Test
  public void getHeaderFilePath() {

    String filePath = includeResolver.getHeaderFileNameWithPath(francaTypeCollection);

    assertEquals("cbridge/include/ro/ot/my/fancy/package/SomeTypeCollection.h", filePath);
  }

  @Test
  public void getImplementationFilePath() {
    when(francaModel.getName()).thenReturn("my.fancy.package");

    String filePath = includeResolver.getImplementationFileNameWithPath(francaTypeCollection);

    assertEquals("cbridge/src/ro/ot/my/fancy/package/SomeTypeCollection.cpp", filePath);
  }
}
