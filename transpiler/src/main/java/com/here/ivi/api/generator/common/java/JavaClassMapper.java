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

package com.here.ivi.api.generator.common.java;

import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaMethod;
import navigation.BaseApiSpec;
import navigation.BaseApiSpec.InterfacePropertyAccessor;
import org.franca.core.franca.FMethod;

/**
 * Maps Franca models to Java models
 *
 * <p>TODO: Should be merged / combined with JavaValueMapper at some point
 */
public final class JavaClassMapper {

  public static JavaClass map(final Interface<InterfacePropertyAccessor> api) {
    JavaClass javaClass = new JavaClass(api.getName());

    // TODO(APIGEN-107): Add fields, constants ...

    api.getFrancaInterface()
        .getMethods()
        .forEach(fMethod -> javaClass.methods.add(generateMethod(api, fMethod)));

    return javaClass;
  }

  private static JavaMethod generateMethod(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, final FMethod fMethod) {
    JavaMethod javaMethod = new JavaMethod(fMethod.getName());

    // TODO(APIGEN-107): Add body, return type, parameters, visibility ...

    return javaMethod;
  }
}
