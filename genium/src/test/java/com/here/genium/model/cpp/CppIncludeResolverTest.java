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

package com.here.genium.model.cpp;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.Include;
import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppIncludeResolverTest {

  private static final String MODEL_NAME = "SomeModel";
  private static final String TYPE_COLLECTION_NAME = "SomeTypeCollection";
  private static final String EXTERNAL_INCLUDE = "foo/Bar.h";

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FStructType francaStruct;

  @Mock private FrancaDeploymentModel deploymentModel;

  private CppIncludeResolver includeResolver;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    includeResolver = new CppIncludeResolver(deploymentModel);

    when(francaStruct.eContainer()).thenReturn(francaTypeCollection);
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);

    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(francaModel.getName()).thenReturn(MODEL_NAME);
  }

  @Test
  public void resolveExternalType() {
    when(deploymentModel.getExternalType(any())).thenReturn(EXTERNAL_INCLUDE);

    Include result = includeResolver.resolveInclude(francaStruct);

    assertEquals(EXTERNAL_INCLUDE, result.fileName);
    verify(deploymentModel).getExternalType(francaStruct);
  }

  @Test
  public void resolveRegularInclude() {
    Include result = includeResolver.resolveInclude(francaStruct);

    assertEquals("SomeModel/SomeTypeCollection.h", result.fileName);
  }
}
