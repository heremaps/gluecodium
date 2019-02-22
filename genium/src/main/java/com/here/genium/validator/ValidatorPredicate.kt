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

package com.here.genium.validator;

import com.here.genium.model.franca.FrancaDeploymentModel;
import org.eclipse.emf.ecore.EObject;

public interface ValidatorPredicate<T extends EObject> {

  /** Get Class of T */
  Class<T> getElementClass();

  /**
   * Validate the given element using the given deployment model.
   *
   * @return null if validation passed; validation message if it does not.
   */
  String validate(FrancaDeploymentModel deploymentModel, T element);
}
