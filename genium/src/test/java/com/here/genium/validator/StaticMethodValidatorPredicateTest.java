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

import static org.junit.Assert.*;
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
public final class StaticMethodValidatorPredicateTest {

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final StaticMethodsValidatorPredicate validatorPredicate =
      new StaticMethodsValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("");
    when(francaInterface.getName()).thenReturn("");
    when(francaMethod.getName()).thenReturn("");

    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaMethod.eContainer()).thenReturn(francaInterface);
  }

  @Test
  public void validateWithInstanceMethod() {
    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateWithStaticMethod() {
    when(deploymentModel.isStatic(francaMethod)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateWithIsInterfaceAndInstanceMethod() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateWithIsInterfaceAndStaticMethod() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    when(deploymentModel.isStatic(francaMethod)).thenReturn(true);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }
}
