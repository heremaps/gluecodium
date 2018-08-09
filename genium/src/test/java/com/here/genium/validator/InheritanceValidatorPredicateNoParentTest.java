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

import static org.junit.Assert.assertNull;
import static org.mockito.ArgumentMatchers.any;
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
public final class InheritanceValidatorPredicateNoParentTest {

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final InheritanceValidatorPredicate validatorPredicate =
      new InheritanceValidatorPredicate();

  private final boolean isInterface;
  private final boolean isObjcInteface;

  public InheritanceValidatorPredicateNoParentTest(
      final boolean isInterface, final boolean isObjcInteface) {
    this.isInterface = isInterface;
    this.isObjcInteface = isObjcInteface;
  }

  @Parameterized.Parameters
  public static Collection<Object[]> data() {
    return Arrays.asList(
        new Object[][] {{false, false}, {false, true}, {true, false}, {true, true}});
  }

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("");
    when(francaInterface.getName()).thenReturn("");

    when(francaInterface.eContainer()).thenReturn(francaModel);
  }

  @Test
  public void test() {
    when(deploymentModel.isInterface(any())).thenReturn(isInterface);
    when(deploymentModel.isObjcInterface(any())).thenReturn(isObjcInteface);

    assertNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }
}
