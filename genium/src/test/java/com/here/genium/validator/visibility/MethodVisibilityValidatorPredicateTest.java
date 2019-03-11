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
import com.here.genium.test.ArrayEList;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.*;
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
public final class MethodVisibilityValidatorPredicateTest {

  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FType francaType;
  @Mock private FEnumerationType francaEnum;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final EList<FArgument> inArgs = new ArrayEList<>();
  private final EList<FArgument> outArgs = new ArrayEList<>();

  private final MethodVisibilityValidatorPredicate validatorPredicate =
      new MethodVisibilityValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(FrancaTypeHelper.class);

    when(FrancaTypeHelper.getFullName(any())).thenReturn("");

    when(francaArgument.getType()).thenReturn(francaTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaType);

    when(francaMethod.getInArgs()).thenReturn(inArgs);
    when(francaMethod.getOutArgs()).thenReturn(outArgs);
  }

  // Input arguments

  @Test
  public void validatePublicMethodWithPublicInArg() {
    inArgs.add(francaArgument);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validatePublicMethodWithInternalInArg() {
    inArgs.add(francaArgument);
    when(deploymentModel.isInternal(francaArgument)).thenReturn(true);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithPublicInArg() {
    inArgs.add(francaArgument);
    when(deploymentModel.isInternal(francaMethod)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithInternalInArgSamePackage() {
    inArgs.add(francaArgument);
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithInternalInArgForeignPackage() {
    inArgs.add(francaArgument);
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  // Output arguments

  @Test
  public void validatePublicMethodWithPublicOutArg() {
    outArgs.add(francaArgument);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validatePublicMethodWithInternalOutArg() {
    outArgs.add(francaArgument);
    when(deploymentModel.isInternal(francaArgument)).thenReturn(true);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithPublicOutArg() {
    outArgs.add(francaArgument);
    when(deploymentModel.isInternal(francaMethod)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithInternalOutArgSamePackage() {
    outArgs.add(francaArgument);
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithInternalOutArgForeignPackage() {
    outArgs.add(francaArgument);
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  // Error enum

  @Test
  public void validatePublicMethodWithPublicErrorEnum() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validatePublicMethodWithInternalErrorEnum() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);
    when(deploymentModel.isInternal(francaEnum)).thenReturn(true);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithPublicErrorEnum() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);
    when(deploymentModel.isInternal(francaMethod)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithInternalErrorEnumSamePackage() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateInternalMethodWithInternalErrorEnumForeignPackage() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }
}
