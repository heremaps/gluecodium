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
import static org.mockito.Mockito.when;

import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class IntegerIntervalValidatorPredicateTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModelElement francaModelElement;
  @Mock private FIntegerInterval francaIntegerInterval;

  private final IntegerIntervalValidatorPredicate validatorPredicate =
      new IntegerIntervalValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("");
    when(francaTypeCollection.getName()).thenReturn("");
    when(francaModelElement.getName()).thenReturn("");

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaModelElement.eContainer()).thenReturn(francaTypeCollection);
    when(francaIntegerInterval.eContainer()).thenReturn(francaModelElement);
  }

  @Test
  public void validateWithIntegerInterval() {
    assertNotNull(validatorPredicate.validate(null, francaIntegerInterval));
  }
}
