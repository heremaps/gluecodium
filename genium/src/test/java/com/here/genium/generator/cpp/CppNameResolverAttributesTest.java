/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
import static org.mockito.Mockito.when;

import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.Collections;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FModelElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppNameResolverAttributesTest {

  @Mock private FModelElement parentElement;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FAttribute francaAttribute;

  @Mock private FrancaDeploymentModel deploymentModel;

  private CppNameResolver nameResolver;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    nameResolver = new CppNameResolver(deploymentModel, Collections.emptyList());

    when(francaAttribute.getName()).thenReturn("an_Attribute");
    when(francaAttribute.eContainer()).thenReturn(parentElement);
    when(francaAttribute.getType().getDerived()).thenReturn(null);
    when(parentElement.getName()).thenReturn("the_Parent");
  }

  @Test
  public void getGetterNameForNormalAttribute() {
    String result = nameResolver.getGetterName(francaAttribute);

    assertEquals("get_an_attribute", result);
  }

  @Test
  public void getGetterNameForExternalAttribute() {
    when(deploymentModel.isExternalType(parentElement)).thenReturn(true);

    String result = nameResolver.getGetterName(francaAttribute);

    assertEquals("get_an_Attribute", result);
  }

  @Test
  public void getGetterNameForAttributeWithExternalName() {
    when(deploymentModel.getExternalGetter(francaAttribute)).thenReturn("Foo");

    String result = nameResolver.getGetterName(francaAttribute);

    assertEquals("Foo", result);
  }

  @Test
  public void getGetterNameForNormalBooleanAttribute() {
    when(francaAttribute.getType().getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    String result = nameResolver.getGetterName(francaAttribute);

    assertEquals("is_an_attribute", result);
  }

  @Test
  public void getGetterNameForExternalBooleanAttribute() {
    when(francaAttribute.getType().getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(deploymentModel.isExternalType(parentElement)).thenReturn(true);

    String result = nameResolver.getGetterName(francaAttribute);

    assertEquals("is_an_Attribute", result);
  }

  @Test
  public void getGetterNameForBooleanAttributeWithExternalName() {
    when(francaAttribute.getType().getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(deploymentModel.getExternalGetter(francaAttribute)).thenReturn("Foo");

    String result = nameResolver.getGetterName(francaAttribute);

    assertEquals("Foo", result);
  }

  @Test
  public void getFullyQualifiedGetterName() {
    String result = nameResolver.getFullyQualifiedGetterName(francaAttribute);

    assertEquals("::TheParent::get_an_attribute", result);
  }

  @Test
  public void getSetterNameForNormalAttribute() {
    String result = nameResolver.getSetterName(francaAttribute);

    assertEquals("set_an_attribute", result);
  }

  @Test
  public void getSetterNameForExternalAttribute() {
    when(deploymentModel.isExternalType(parentElement)).thenReturn(true);

    String result = nameResolver.getSetterName(francaAttribute);

    assertEquals("set_an_Attribute", result);
  }

  @Test
  public void getSetterNameForAttributeWithExternalName() {
    when(deploymentModel.getExternalSetter(francaAttribute)).thenReturn("Foo");

    String result = nameResolver.getSetterName(francaAttribute);

    assertEquals("Foo", result);
  }

  @Test
  public void getFullyQualifiedSetterName() {
    String result = nameResolver.getFullyQualifiedSetterName(francaAttribute);

    assertEquals("::TheParent::set_an_attribute", result);
  }
}
