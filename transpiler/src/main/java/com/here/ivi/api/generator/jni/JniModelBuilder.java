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

package com.here.ivi.api.generator.jni;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.PlatformUnsupportedFeatures;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.java.JavaModelBuilder;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.jni.*;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;

/**
 * This class builds a correspondence-tree containing correspondences between java and cpp model
 * elements. Currently only corresponding classes and theirs corresponding methods are calculated.
 *
 * <p>Preconditions:
 *
 * <p>For correspondence calculation it is assumed to have one to one mapping, i.e. one franca
 * element is mapped to at least one target model element.
 *
 * <p>It is assumed that Java- and CppModelBuilder's finishBuilding methods are called in advance of
 * calling finishBuilding on JniModelBuilder (constructed java and cpp elements need to be
 * accessible via getResults(..) ).
 */
@SuppressWarnings("PMD.CouplingBetweenObjects")
public class JniModelBuilder extends AbstractModelBuilder<JniElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final JavaModelBuilder javaBuilder;
  private final CppModelBuilder cppBuilder;

  public JniModelBuilder(
      final ModelBuilderContextStack<JniElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final JavaModelBuilder javaBuilder,
      final CppModelBuilder cppBuilder) {

    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.javaBuilder = javaBuilder;
    this.cppBuilder = cppBuilder;
  }

  public JniModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final JavaModelBuilder javaBuilder,
      final CppModelBuilder cppBuilder) {
    this(new ModelBuilderContextStack<>(), deploymentModel, javaBuilder, cppBuilder);
  }

  @Override
  public void startBuilding(FInterface francaInterface) {
    openContext();
    getCurrentContext().allowsTypeDefinitions = true;
  }

  @Override
  public void startBuilding(FTypeCollection francaTypeCollection) {
    openContext();
    getCurrentContext().allowsTypeDefinitions = true;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    CppClass cppClass = cppBuilder.getFinalResult(CppClass.class);
    JavaTopLevelElement javaTopLevelElement = javaBuilder.getFinalResult(JavaTopLevelElement.class);
    JavaClass javaClass = javaBuilder.getFinalResult(JavaClass.class);

    JniContainer jniContainer;
    if (deploymentModel.isInterface(francaInterface)) {
      jniContainer =
          new JniContainer(
              javaTopLevelElement.javaPackage.packageNames,
              DefinedBy.getPackages(francaInterface),
              javaClass.name,
              javaTopLevelElement.name,
              cppClass.name,
              true,
              true);
    } else {

      jniContainer =
          new JniContainer(
              javaTopLevelElement.javaPackage.packageNames,
              DefinedBy.getPackages(francaInterface),
              javaClass.name,
              javaTopLevelElement.name,
              cppClass.name,
              true,
              false);
    }

    getPreviousResults(JniMethod.class).forEach(jniContainer::add);
    getPreviousResults(JniStruct.class).forEach(jniContainer::add);
    getPreviousResults(JniEnum.class).forEach(jniContainer::add);
    storeResult(jniContainer);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    if (PlatformUnsupportedFeatures.hasUnsupportedParameters(francaMethod)) {
      closeContext();
      return;
    }

    JavaMethod javaMethod = javaBuilder.getFinalResult(JavaMethod.class);
    CppMethod cppMethod = cppBuilder.getFinalResult(CppMethod.class);

    JniException jniException = null;
    if (javaMethod.exception != null) {
      jniException =
          new JniException(
              JniNameRules.getFullClassName(javaMethod.exception),
              getPreviousResult(JniType.class));
    }

    JniMethod jniMethod =
        new JniMethod.Builder(javaMethod.name, cppMethod.name)
            .returnType(JniType.createType(javaMethod.returnType, cppMethod.returnType))
            .isStatic(cppMethod.specifiers.contains(CppMethod.Specifier.STATIC))
            .isConst(cppMethod.qualifiers.contains(CppMethod.Qualifier.CONST))
            .isOverloaded(francaMethod.getSelector() != null)
            .exception(jniException)
            .build();
    jniMethod.parameters.addAll(getPreviousResults(JniParameter.class));

    storeResult(jniMethod);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {

    FTypeRef typeReference = francaArgument.getType();

    boolean isInstanceRef =
        typeReference.getDerived() instanceof FTypeDef
            && InstanceRules.isInstanceId((FTypeDef) typeReference.getDerived());

    JavaParameter javaParameter = javaBuilder.getFinalResult(JavaParameter.class);
    CppParameter cppParameter = cppBuilder.getFinalResult(CppParameter.class);
    JniType jniType = JniType.createType(javaParameter.type, cppParameter.type, isInstanceRef);

    storeResult(new JniParameter(javaParameter.name, jniType));
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaStructType)) {
      closeContext();
      return;
    }

    JavaClass javaClass = javaBuilder.getFinalResult(JavaClass.class);
    CppStruct cppStruct = cppBuilder.getFinalResult(CppStruct.class);

    List<JniField> jniFields = new LinkedList<>();
    JniStruct parentStruct = getPreviousResult(JniStruct.class);
    if (parentStruct != null) {
      jniFields.addAll(parentStruct.fields);
    }
    jniFields.addAll(getPreviousResults(JniField.class));

    storeResult(new JniStruct(javaClass, cppStruct, jniFields));
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumType) {

    if (getParentContext().allowsTypeDefinitions) {
      JavaEnum javaEnum = javaBuilder.getFinalResult(JavaEnum.class);
      CppEnum cppEnum = cppBuilder.getFinalResult(CppEnum.class);

      storeResult(
          new JniEnum.Builder(javaEnum.name, cppEnum.name)
              .javaPackage(javaEnum.javaPackage)
              .enumerators(getPreviousResults(JniEnumerator.class))
              .build());
    } else {
      JavaType javaType = javaBuilder.getFinalResult(JavaType.class);
      CppTypeRef cppTypeRef = cppBuilder.getFinalResult(CppTypeRef.class);

      storeResult(JniType.createType(javaType, cppTypeRef));
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerator francaEnumerator) {

    JavaEnumItem javaEnumItem = javaBuilder.getFinalResult(JavaEnumItem.class);
    CppEnumItem cppEnumItem = cppBuilder.getFinalResult(CppEnumItem.class);
    storeResult(new JniEnumerator(javaEnumItem.name, cppEnumItem.name));
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    JavaField javaField = javaBuilder.getFinalResult(JavaField.class);
    CppField cppField = cppBuilder.getFinalResult(CppField.class);
    JniType jniType = getPreviousResult(JniType.class);

    storeResult(new JniField(javaField, cppField, jniType));
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {

    JniTopLevelElement jniTopLevelElement = getPreviousResult(JniTopLevelElement.class);
    List<String> packageNames =
        jniTopLevelElement != null
            ? jniTopLevelElement.javaPackage.packageNames
            : Collections.emptyList();
    List<String> cppNameSpace = CppNameRules.getNestedNameSpecifier(francaTypeCollection);

    JniContainer jniContainer =
        JniContainer.createTypeCollectionContainer(packageNames, cppNameSpace);
    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JniStruct.class)
        .forEach(jniContainer::add);
    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JniEnum.class)
        .forEach(jniContainer::add);

    storeResult(jniContainer);
    closeContext();
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaAttribute.getType())) {
      closeContext();
      return;
    }

    List<JavaMethod> javaMethods =
        CollectionsHelper.getAllOfType(javaBuilder.getFinalResults(), JavaMethod.class);
    List<CppMethod> cppMethods =
        CollectionsHelper.getAllOfType(cppBuilder.getFinalResults(), CppMethod.class);

    JavaMethod javaGetter = javaMethods.get(0);
    CppMethod cppGetter = cppMethods.get(0);
    JniType jniType = JniType.createType(javaGetter.returnType, cppGetter.returnType);
    storeResult(new JniMethod.Builder(javaGetter.name, cppGetter.name).returnType(jniType).build());

    if (!francaAttribute.isReadonly()) {
      JavaMethod javaSetter = javaMethods.get(1);
      CppMethod cppSetter = cppMethods.get(1);
      JniMethod jniSetter = new JniMethod.Builder(javaSetter.name, cppSetter.name).build();

      JavaParameter javaParameter = javaSetter.parameters.get(0);
      CppParameter cppParameter = cppSetter.parameters.get(0);
      JniType parameterType = JniType.createType(javaParameter.type, cppParameter.type);
      jniSetter.parameters.add(new JniParameter(javaParameter.name, parameterType));

      storeResult(jniSetter);
    }

    closeContext();
  }
}
