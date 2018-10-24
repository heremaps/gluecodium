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
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class StructInheritanceValidatorPredicateTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FStructType francaStruct;
  @Mock private FStructType parentStruct;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final StructInheritanceValidatorPredicate validatorPredicate =
      new StructInheritanceValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("Foo");
    when(francaTypeCollection.getName()).thenReturn("Bar");
    when(francaStruct.getName()).thenReturn("Baz");

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaStruct.eContainer()).thenReturn(francaTypeCollection);
    when(parentStruct.eContainer()).thenReturn(parentStruct);

    when(francaStruct.getBase()).thenReturn(parentStruct);
  }

  @Test
  public void validateWithNoParent() {
    when(francaStruct.getBase()).thenReturn(null);

    String result = validatorPredicate.validate(deploymentModel, francaStruct);

    assertNull(result);
  }

  @Test
  public void validateWithParent() {
    String result = validatorPredicate.validate(deploymentModel, francaStruct);

    assertNotNull(result);
  }
}
