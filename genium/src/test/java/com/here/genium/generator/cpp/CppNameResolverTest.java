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

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.Arrays;
import java.util.Collection;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(Parameterized.class)
public final class CppNameResolverTest {

  private static final FModelElement EXTERNAL_PARENT_ELEMENT = mock(FModelElement.class);
  private static final FModelElement EXTERNAL_NAMED_PARENT_ELEMENT = mock(FModelElement.class);

  @Parameterized.Parameter public EObject parentElement;

  @Parameterized.Parameter(1)
  public String expectedNormalResult;

  @Parameterized.Parameter(2)
  public String expectedExternalResult;

  @Mock private FModelElement francaElement;
  @Mock private FrancaDeploymentModel deploymentModel;

  private CppNameResolver nameResolver;

  @Parameterized.Parameters
  public static Collection<Object[]> testData() {

    FModel francaModel = mock(FModel.class);
    FTypeCollection francaTypeCollection = mock(FTypeCollection.class);
    FModelElement normalParentElement = mock(FModelElement.class);

    when(francaModel.getName()).thenReturn("model");
    when(francaTypeCollection.getName()).thenReturn("type_Collection");
    when(normalParentElement.getName()).thenReturn("parent_Element");
    when(EXTERNAL_PARENT_ELEMENT.getName()).thenReturn("parent_Element");
    when(EXTERNAL_NAMED_PARENT_ELEMENT.getName()).thenReturn("parent_Element");

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(normalParentElement.eContainer()).thenReturn(francaModel);
    when(EXTERNAL_PARENT_ELEMENT.eContainer()).thenReturn(francaModel);
    when(EXTERNAL_NAMED_PARENT_ELEMENT.eContainer()).thenReturn(francaModel);

    return Arrays.asList(
        new Object[][] {
          {francaModel, "::model::AnElement", "::model::an_Element"},
          {francaTypeCollection, "::model::AnElement", "::model::an_Element"},
          {
            normalParentElement,
            "::model::ParentElement::AnElement",
            "::model::ParentElement::an_Element"
          },
          {
            EXTERNAL_PARENT_ELEMENT,
            "::model::parent_Element::an_Element",
            "::model::parent_Element::an_Element"
          },
          {EXTERNAL_NAMED_PARENT_ELEMENT, "ALIEN_PARENT::an_Element", "ALIEN_PARENT::an_Element"}
        });
  }

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    nameResolver = new CppNameResolver(deploymentModel);

    when(deploymentModel.isExternalType(EXTERNAL_PARENT_ELEMENT)).thenReturn(true);
    when(deploymentModel.isExternalType(EXTERNAL_NAMED_PARENT_ELEMENT)).thenReturn(true);
    when(deploymentModel.getExternalName(EXTERNAL_NAMED_PARENT_ELEMENT)).thenReturn("ALIEN_PARENT");

    when(francaElement.getName()).thenReturn("an_Element");
    when(francaElement.eContainer()).thenReturn(parentElement);
  }

  @Test
  public void getNameForNormalElement() {
    String result = nameResolver.getFullyQualifiedName(francaElement);

    assertEquals(expectedNormalResult, result);
  }

  @Test
  public void getNameForExternalElement() {
    when(deploymentModel.isExternalType(francaElement)).thenReturn(true);

    String result = nameResolver.getFullyQualifiedName(francaElement);

    assertEquals(expectedExternalResult, result);
  }

  @Test
  public void getNameForExternalElementWithExternalName() {
    when(deploymentModel.isExternalType(francaElement)).thenReturn(true);
    when(deploymentModel.getExternalName(francaElement)).thenReturn("EXTERNAL_NAME");

    String result = nameResolver.getFullyQualifiedName(francaElement);

    assertEquals("EXTERNAL_NAME", result);
  }
}
