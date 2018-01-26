/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.validator;

import com.here.ivi.api.model.franca.FrancaDeploymentModel;
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
