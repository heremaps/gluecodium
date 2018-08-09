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
import java.util.Arrays;
import java.util.Collection;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(Parameterized.class)
public final class InheritanceValidatorPredicateWithParentTest {

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;
  @Mock private FInterface francaInterface2;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final InheritanceValidatorPredicate validatorPredicate =
      new InheritanceValidatorPredicate();

  private final boolean firstInterfaceIsInterface;
  private final boolean firstInterfaceIsObjc;
  private final boolean secondInterfaceIsInterface;
  private final boolean secondInterfaceIsObjc;
  private final boolean expectedNull;

  public InheritanceValidatorPredicateWithParentTest(
      final boolean firstInterfaceIsInterface,
      final boolean firstInterfaceIsObjc,
      final boolean secondInterfaceIsInterface,
      final boolean secondInterfaceIsObjc,
      final boolean expectedNull) {
    this.firstInterfaceIsInterface = firstInterfaceIsInterface;
    this.firstInterfaceIsObjc = firstInterfaceIsObjc;
    this.secondInterfaceIsInterface = secondInterfaceIsInterface;
    this.secondInterfaceIsObjc = secondInterfaceIsObjc;
    this.expectedNull = expectedNull;
  }

  @Parameterized.Parameters
  public static Collection<Object[]> data() {
    return Arrays.asList(
        new Object[][] {
          {false, false, false, false, true},
          {true, false, false, false, false},
          {false, true, false, false, true},
          {false, false, true, false, true},
          {false, false, false, true, true},
          {true, true, false, false, false},
          {true, false, true, false, true},
          {true, false, false, true, false},
          {false, true, true, false, true},
          {false, true, false, true, true},
          {false, false, true, true, true},
          {true, true, true, false, true},
          {true, true, false, true, false},
          {true, false, true, true, true},
          {false, true, true, true, true},
          {true, true, true, true, true},
        });
  }

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("");
    when(francaInterface.getName()).thenReturn("");
    when(francaInterface2.getName()).thenReturn("");

    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaInterface2.eContainer()).thenReturn(francaModel);

    when(francaInterface.getBase()).thenReturn(francaInterface2);
  }

  @Test
  public void test() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(firstInterfaceIsInterface);
    when(deploymentModel.isObjcInterface(francaInterface)).thenReturn(firstInterfaceIsObjc);
    when(deploymentModel.isInterface(francaInterface2)).thenReturn(secondInterfaceIsInterface);
    when(deploymentModel.isObjcInterface(francaInterface2)).thenReturn(secondInterfaceIsObjc);

    assertEquals(
        expectedNull, validatorPredicate.validate(deploymentModel, francaInterface) == null);
  }
}
