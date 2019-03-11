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

package com.here.genium.validator.visibility;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.FInterface;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FrancaTypeHelper.class)
public final class InterfaceVisibilityValidatorPredicateTest {

  @Mock private FInterface francaInterface;
  @Mock private FInterface parentInterface;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final InterfaceVisibilityValidatorPredicate validatorPredicate =
      new InterfaceVisibilityValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(FrancaTypeHelper.class);

    when(FrancaTypeHelper.getFullName(any())).thenReturn("");

    when(francaInterface.getBase()).thenReturn(parentInterface);
  }

  @Test
  public void validatePublicStructWithPublicParent() {
    assertNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }

  @Test
  public void validatePublicStructWithInternalParent() {
    when(deploymentModel.isInternal(parentInterface)).thenReturn(true);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }

  @Test
  public void validateInternalStructWithPublicParent() {
    when(deploymentModel.isInternal(francaInterface)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }

  @Test
  public void validateInternalStructWithInternalParentSamePackage() {
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }

  @Test
  public void validateInternalStructWithInternalParentForeignPackage() {
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }
}
