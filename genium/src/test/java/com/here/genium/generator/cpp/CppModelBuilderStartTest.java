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

package com.here.genium.generator.cpp;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.here.genium.generator.common.NameRules;
import com.here.genium.generator.common.VerbatimNameRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.test.MockContextStack;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppModelBuilderStartTest {

  private final MockContextStack<CppElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private CppTypeMapper typeMapper;
  @Mock private CppValueMapper valueMapper;
  @Mock private NameRules parentNameRules;

  @Mock private EObject francaObject;
  @Mock private FInterface francaInterface;
  @Mock private FArgument francaArgument;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FStructType francaStructType;
  @Mock private FEnumerationType francaEnumerationType;

  private CppModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    modelBuilder = new CppModelBuilder(contextStack, deploymentModel, typeMapper, valueMapper);

    contextStack.getParentContext().nameRules = parentNameRules;
  }

  @Test
  public void startBuildingObjectPropagatesNameRules() {
    modelBuilder.startBuilding(francaObject);

    assertEquals(parentNameRules, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingInterfaceSetsNameRules() {
    modelBuilder.startBuilding(francaInterface);

    assertEquals(CppNameRules.INSTANCE, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingExternalInterfaceSetsNameRules() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.startBuilding(francaInterface);

    assertEquals(VerbatimNameRules.INSTANCE, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingTypeCollectionSetsNameRules() {
    modelBuilder.startBuilding(francaTypeCollection);

    assertEquals(CppNameRules.INSTANCE, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingStructSetsNameRules() {
    modelBuilder.startBuilding(francaStructType);

    assertEquals(CppNameRules.INSTANCE, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingExternalStructSetsNameRules() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.startBuilding(francaStructType);

    assertEquals(VerbatimNameRules.INSTANCE, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingEnumSetsNameRules() {
    modelBuilder.startBuilding(francaEnumerationType);

    assertEquals(CppNameRules.INSTANCE, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingExternalEnumSetsNameRules() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.startBuilding(francaEnumerationType);

    assertEquals(VerbatimNameRules.INSTANCE, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingInputArgumentPropagatesNameRules() {
    modelBuilder.startBuildingInputArgument(francaArgument);

    assertEquals(parentNameRules, contextStack.getCurrentContext().nameRules);
  }

  @Test
  public void startBuildingOutputArgumentPropagatesNameRules() {
    modelBuilder.startBuildingOutputArgument(francaArgument);

    assertEquals(parentNameRules, contextStack.getCurrentContext().nameRules);
  }
}
