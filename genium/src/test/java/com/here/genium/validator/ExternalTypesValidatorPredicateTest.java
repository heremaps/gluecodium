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
@SuppressWarnings("MethodName")
public class ExternalTypesValidatorPredicateTest {

  @Mock private FModel fModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModelElement francaElement;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final ExternalTypesValidatorPredicate validatorPredicate =
      new ExternalTypesValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(fModel.getName()).thenReturn("");
    when(francaTypeCollection.getName()).thenReturn("");
    when(francaElement.getName()).thenReturn("");

    when(francaTypeCollection.eContainer()).thenReturn(fModel);
    when(francaElement.eContainer()).thenReturn(francaTypeCollection);
  }

  @Test
  public void validateWithExternalNameAndWithExternalType() {
    when(deploymentModel.getExternalName(francaElement)).thenReturn("Bar");
    when(deploymentModel.isExternalType(francaElement)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateWithExternalNameAndWithoutExternalType() {
    when(deploymentModel.getExternalName(francaElement)).thenReturn("Bar");

    assertNotNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateWithoutExternalNameAndWithExternalType() {
    when(deploymentModel.isExternalType(francaElement)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaElement));
  }

  @Test
  public void validateWithoutExternalNameAndWithoutExternalType() {
    assertNull(validatorPredicate.validate(deploymentModel, francaElement));
  }
}
