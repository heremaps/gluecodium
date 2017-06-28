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

import com.here.ivi.api.generator.baseapi.StubCommentParser;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaConstant;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaMethod.Qualifier;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FMethod;

/**
 * Maps Franca models to Java models
 *
 * <p>TODO: Should be merged / combined with JavaValueMapper at some point
 */
public final class JavaClassMapper {
  private JavaClassMapper() {}

  public static JavaClass map(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, JavaPackage javaPackage) {
    JavaClass javaClass = new JavaClass(JavaNameRules.getClassName(api.getName()));
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.javaPackage = javaPackage;
    FAnnotationBlock comment = api.getFrancaInterface().getComment();
    if (comment != null && comment.getElements() != null) {
      javaClass.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }

    api.getFrancaInterface()
        .getConstants()
        .forEach(fConstantDef -> javaClass.constants.add(generateConstant(api, fConstantDef)));

    api.getFrancaInterface()
        .getAttributes()
        .forEach(fAttribute -> javaClass.fields.add(generateField(api, fAttribute)));

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
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(fMethod.getName()));
    } else if (outArgs.size() == 1) {
      JavaType returnType = JavaTypeMapper.map(api, outArgs.get(0).getType());

      javaMethod = new JavaMethod(JavaNameRules.getMethodName(fMethod.getName()), returnType);
    } else {
      // TODO: Wrap comlex return type in an immutable container class
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(fMethod.getName()));
    }

    // Map method arguments
    for (FArgument fArgument : fMethod.getInArgs()) {
      JavaType javaArgumentType = JavaTypeMapper.map(api, fArgument.getType());
      javaMethod.parameters.add(
          new JavaParameter(javaArgumentType, JavaNameRules.getArgumentName(fArgument.getName())));
    }

    // TODO: Map errors to exception(s)
    // Either create a per-Interface exception and add mapped enum values to it's EnumSet member
    // Or do something different...

    javaMethod.comment = StubCommentParser.FORMATTER.readDescription(fMethod.getComment());

    // For now we assume all interface methods are native and public
    javaMethod.qualifiers.add(Qualifier.NATIVE);
    javaMethod.visibility = JavaVisibility.PUBLIC;

    return javaMethod;
  }

  private static JavaConstant generateConstant(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, final FConstantDef fConstantDef) {
    JavaType type = JavaTypeMapper.map(api, fConstantDef.getType());
    JavaValue value = JavaValueMapper.map(type, fConstantDef.getRhs());
    JavaConstant constant =
        new JavaConstant(type, JavaNameRules.getConstantName(fConstantDef.getName()), value);
    FAnnotationBlock comment = fConstantDef.getComment();
    if (comment != null && comment.getElements() != null) {
      constant.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }
    return constant;
  }

  private static JavaField generateField(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, final FAttribute fAttribute) {
    JavaType type = JavaTypeMapper.map(api, fAttribute.getType());
    JavaField field = new JavaField(type, JavaNameRules.getFieldName(fAttribute.getName()));
    FAnnotationBlock comment = fAttribute.getComment();
    if (comment != null && comment.getElements() != null) {
      field.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }
    return field;
  }
}
