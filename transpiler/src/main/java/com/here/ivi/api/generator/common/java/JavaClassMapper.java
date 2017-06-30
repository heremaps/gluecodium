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
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaClass.ClassQualifier;
import com.here.ivi.api.model.javamodel.JavaConstant;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import navigation.BaseApiSpec;
import navigation.BaseApiSpec.TypeCollectionPropertyAccessor;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypedElement;

/** Maps Franca models to Java models */
public final class JavaClassMapper {
  private JavaClassMapper() {}

  private static JavaPackage createJavaPackage(
      final List<String> defaultJavaPackages, final List<String> apiPackages) {
    ArrayList<String> packages = new ArrayList<>(defaultJavaPackages);
    packages.addAll(apiPackages);

    return new JavaPackage(packages);
  }

  public static JavaClass map(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> anInterface,
      final JavaPackage javaPackage) {

    JavaModelBuilder builder =
        new JavaModelBuilder(createJavaPackage(javaPackage.packageNames, anInterface.getPackage()));
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walk(anInterface);

    return (JavaClass) builder.getResults().get(0);
  }

  // TODO: APIGEN-261 get rid of JavaClassMapper class, do it with the walker
  public static JavaClass map(
      final TypeCollection<TypeCollectionPropertyAccessor> typeCollection,
      final JavaPackage javaPackage) {
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

  public static JavaConstant generateConstant(final FConstantDef fConstantDef) {
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

  public static JavaField generateField(final FTypedElement fTypedElement) {
    JavaType type = JavaTypeMapper.map(fTypedElement.getType());
    JavaField field = new JavaField(type, JavaNameRules.getFieldName(fTypedElement.getName()));
    FAnnotationBlock comment = fTypedElement.getComment();
    if (comment != null && comment.getElements() != null) {
      field.comment = StubCommentParser.FORMATTER.readDescription(comment);
    }
    return field;
  }
}
