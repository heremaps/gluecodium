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

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.baseapi.StubCommentParser;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaClass.ClassQualifier;
import com.here.ivi.api.model.javamodel.JavaConstant;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaMethod.MethodQualifier;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import java.util.ArrayList;
import java.util.List;
import navigation.BaseApiSpec;
import navigation.BaseApiSpec.TypeCollectionPropertyAccessor;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypedElement;

/**
 * Maps Franca models to Java models
 *
 * <p>TODO: Should be merged / combined with JavaValueMapper at some point
 */
public final class JavaClassMapper {
  private JavaClassMapper() {}

  private static JavaPackage createJavaPackage(
      final List<String> defaultJavaPackages, final List<String> apiPackages) {
    ArrayList<String> packages = new ArrayList<>(defaultJavaPackages);
    packages.addAll(apiPackages);

    return new JavaPackage(packages);
  }

  public static JavaClass map(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, final JavaPackage javaPackage) {
    JavaClass javaClass = new JavaClass(JavaNameRules.getClassName(api.getName()));
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.javaPackage = createJavaPackage(javaPackage.packageNames, api.getPackage());

    FAnnotationBlock comment = api.getFrancaInterface().getComment();
    if (comment != null && comment.getElements() != null) {
      javaClass.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }

    api.getFrancaInterface()
        .getConstants()
        .forEach(fConstantDef -> javaClass.constants.add(generateConstant(fConstantDef)));

    api.getFrancaInterface()
        .getAttributes()
        .forEach(fAttribute -> javaClass.fields.add(generateField(fAttribute)));

    api.getFrancaInterface()
        .getMethods()
        .forEach(fMethod -> javaClass.methods.add(generateMethod(fMethod)));

    return javaClass;
  }

  public static JavaClass map(
      final TypeCollection<TypeCollectionPropertyAccessor> typeCollection,
      JavaPackage javaPackage) {
    JavaClass javaClass = new JavaClass(typeCollection.getName());
    javaClass.javaPackage = javaPackage;
    javaClass.visibility = JavaVisibility.PUBLIC;
    FAnnotationBlock comment = typeCollection.getFrancaTypeCollection().getComment();
    if (comment != null && comment.getElements() != null) {
      javaClass.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }

    typeCollection
        .getFrancaTypeCollection()
        .getConstants()
        .forEach(fConstantDef -> javaClass.constants.add(generateConstant(fConstantDef)));

    for (FType type : typeCollection.getFrancaTypeCollection().getTypes()) {
      if (type instanceof FStructType) {
        javaClass.innerClasses.add(
            generateJavaClassFromStruct((FStructType) type, javaClass.javaPackage));
      } else if (type instanceof FTypeDef) {
        // TODO APIGEN-218 Map type defs
      } else if (type instanceof FArrayType) {
        // TODO APIGEN-218 Map array types
      } else if (type instanceof FMapType) {
        // TODO APIGEN-218 Map map types
      } else if (type instanceof FEnumerationType) {
        // TODO APIGEN-218 Map enum types
      } else {
        throw new TranspilerExecutionException(
            String.format("Missing type map for %s.", type.getClass().getName()));
      }
    }
    return javaClass;
  }

  private static JavaClass generateJavaClassFromStruct(FStructType type, JavaPackage javaPackage) {
    JavaClass javaClass = new JavaClass(JavaNameRules.getClassName(type.getName()));
    javaClass.javaPackage = javaPackage;
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.qualifiers.add(ClassQualifier.STATIC);

    FAnnotationBlock comment = type.getComment();
    if (comment != null && comment.getElements() != null) {
      javaClass.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }
    type.getElements().forEach(field -> javaClass.fields.add(generateField(field)));
    return javaClass;
  }

  private static JavaMethod generateMethod(final FMethod fMethod) {
    JavaMethod javaMethod;

    // Map return type
    EList<FArgument> outArgs = fMethod.getOutArgs();
    if (outArgs.isEmpty()) { // Void return type
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(fMethod.getName()));
    } else if (outArgs.size() == 1) {
      JavaType returnType = JavaTypeMapper.map(outArgs.get(0).getType());

      javaMethod = new JavaMethod(JavaNameRules.getMethodName(fMethod.getName()), returnType);
    } else {
      // TODO: Wrap comlex return type in an immutable container class
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(fMethod.getName()));
    }

    // Map method arguments
    for (FArgument fArgument : fMethod.getInArgs()) {
      JavaType javaArgumentType = JavaTypeMapper.map(fArgument.getType());
      javaMethod.parameters.add(
          new JavaParameter(javaArgumentType, JavaNameRules.getArgumentName(fArgument.getName())));
    }

    // TODO: Map errors to exception(s)
    // Either create a per-Interface exception and add mapped enum values to it's EnumSet member
    // Or do something different...

    javaMethod.comment = StubCommentParser.FORMATTER.readDescription(fMethod.getComment());

    // For now we assume all interface methods are native and public
    javaMethod.qualifiers.add(MethodQualifier.NATIVE);
    javaMethod.visibility = JavaVisibility.PUBLIC;

    return javaMethod;
  }

  private static JavaConstant generateConstant(final FConstantDef fConstantDef) {
    JavaType type = JavaTypeMapper.map(fConstantDef.getType());
    JavaValue value = JavaValueMapper.map(type, fConstantDef.getRhs());
    JavaConstant constant =
        new JavaConstant(type, JavaNameRules.getConstantName(fConstantDef.getName()), value);
    FAnnotationBlock comment = fConstantDef.getComment();
    if (comment != null && comment.getElements() != null) {
      constant.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }
    return constant;
  }

  private static JavaField generateField(final FTypedElement fTypedElement) {
    JavaType type = JavaTypeMapper.map(fTypedElement.getType());
    JavaField field = new JavaField(type, JavaNameRules.getFieldName(fTypedElement.getName()));
    FAnnotationBlock comment = fTypedElement.getComment();
    if (comment != null && comment.getElements() != null) {
      field.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }
    return field;
  }
}
