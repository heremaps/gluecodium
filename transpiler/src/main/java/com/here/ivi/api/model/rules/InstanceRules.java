/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.rules;

import com.here.ivi.api.model.franca.DefinedBy;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

/**
 * This class handles the specific rules for identifying instance references.
 *
 * <p>Each generator has to use the rules to determine if instances of another type.
 */
public final class InstanceRules {
  /**
   * This method is used to check if a typedef is for an instance by checking that the typedef
   * refers to undefined and that has the same name as a the containing class
   */
  public static boolean isInstanceId(FTypeDef typedef) {
    FTypeRef type = typedef.getActualType();
    if (type.getDerived() != null || type.getPredefined() != FBasicTypeId.UNDEFINED) {
      return false;
    }

    String className = DefinedBy.findDefiningTypeCollection(typedef).getName();

    return typedef.getName().equals(className);
  }
}
