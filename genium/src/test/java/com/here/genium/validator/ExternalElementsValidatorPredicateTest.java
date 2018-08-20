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

package com.here.genium.validator;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.when;

import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class ExternalElementsValidatorPredicateTest {

  @Mock private FModel fModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModelElement externalParent;
  @Mock private FTypedElement francaElement;
  @Mock private FAttribute francaAttribute;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final ExternalElementsValidatorPredicate validatorPredicate =
      new ExternalElementsValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(fModel.getName()).thenReturn("");
    when(francaTypeCollection.getName()).thenReturn("");
    when(externalParent.getName()).thenReturn("");
    when(francaElement.getName()).thenReturn("");
    when(francaAttribute.getName()).thenReturn("");

    when(francaTypeCollection.eContainer()).thenReturn(fModel);
    when(externalParent.eContainer()).thenReturn(francaTypeCollection);
    when(francaElement.eContainer()).thenReturn(externalParent);
    when(francaAttribute.eContainer()).thenReturn(externalParent);

    when(deploymentModel.isExternalType(externalParent)).thenReturn(true);
  }

  @Test
  public void validateWithExternalElementInNonExternalType() {
    when(deploymentModel.getExternalGetter(francaElement)).thenReturn("Bar");
    when(deploymentModel.getExternalSetter(francaElement)).thenReturn("Baz");
    when(deploymentModel.isExternalType(externalParent)).thenReturn(false);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateWithExternalGetterAndWithExternalSetter() {
    when(deploymentModel.getExternalGetter(francaElement)).thenReturn("Bar");
    when(deploymentModel.getExternalSetter(francaElement)).thenReturn("Baz");

    assertNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateWithExternalGetterAndWithoutExternalSetter() {
    when(deploymentModel.getExternalGetter(francaElement)).thenReturn("Bar");

    assertNotNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateWithoutExternalGetterAndWithExternalSetter() {
    when(deploymentModel.getExternalSetter(francaElement)).thenReturn("Baz");

    assertNotNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateWithoutExternalGetterAndWithoutExternalSetter() {
    assertNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateNonExternalAttributeInExternalType() {
    assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute));
  }
}
