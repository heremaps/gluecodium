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
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaType;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FMethod;

/**
 * Maps Franca models to Java models
 *
 * <p>TODO: Should be merged / combined with JavaValueMapper at some point
 */
public final class JavaClassMapper {
  private JavaClassMapper() {}

  public static JavaClass map(final Interface<BaseApiSpec.InterfacePropertyAccessor> api) {
    JavaClass javaClass = new JavaClass(api.getName());

    // TODO(APIGEN-107): Add fields, constants ...

    api.getFrancaInterface()
        .getMethods()
        .forEach(fMethod -> javaClass.methods.add(generateMethod(api, fMethod)));

    return javaClass;
  }

  private static JavaMethod generateMethod(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, final FMethod fMethod) {
    JavaMethod javaMethod;

    // Map return type
    EList<FArgument> outArgs = fMethod.getOutArgs();
    if (outArgs.isEmpty()) { // Void return type
      javaMethod = new JavaMethod(fMethod.getName());
    } else if (outArgs.size() == 1) {
      JavaType returnType = JavaTypeMapper.map(api, outArgs.get(0).getType());

      javaMethod = new JavaMethod(fMethod.getName(), returnType);
    } else {
      // TODO: Wrap comlex return type in an immutable container class
      javaMethod = new JavaMethod(fMethod.getName());
    }

    // Map method arguments
    for (FArgument fArgument : fMethod.getInArgs()) {
      JavaType javaArgumentType = JavaTypeMapper.map(api, fArgument.getType());
      javaMethod.parameters.add(new JavaParameter(javaArgumentType, fArgument.getName()));
    }

    // TODO: Map errors to exception(s)
    // Either create a per-Interface exception and add mapped enum values to it's EnumSet member
    // Or do something different...

    // TODO(APIGEN-107): Add body, visibility ...

    return javaMethod;
  }
}
