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

package com.here.ivi.api.model;

import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;

/** This class takes care of identifying instance references */
public final class InstanceHelper {
  private static final String BUILTIN_MODEL = "navigation.BuiltIn";
  private static final String INSTANCE_ID_POSTFIX = "Instance";
  private static final String INSTANCE_ID_TYPE = "InstanceId";

  /**
   * This method is used in conjunction with navigation.BuiltIn.InstanceId If a typedef is of the
   * builtin type, than it will be resolved to the Interface that contains the typedef.
   *
   * <p>Example definition: <code>
   * package navigation
   *
   * import navigation.* from "classpath:/franca/spec/BuiltIn.fidl"
   *
   * interface CustomInterface {
   *    version { major 1  minor 0 }
   *
   *    typedef CustomInterfaceInstance is BuiltIn.InstanceId
   * }
   * </code>
   */
  public static boolean isInstanceId(FTypeDef typedef) {

    // name must be ending with Instance
    if (typedef.getName() != null && typedef.getName().endsWith(INSTANCE_ID_POSTFIX)) {
      // it must reference a valid type
      FType target = typedef.getActualType().getDerived();
      if (target != null) {
        // and it must point to the exact navigation.BuiltIn.InstanceId
        if (INSTANCE_ID_TYPE.equals(target.getName())) {
          DefinedBy defined = DefinedBy.createFromFModelElement(target);
          return BUILTIN_MODEL.equals(defined.toString());
        }
      }
    }

    return false;
  }
}
