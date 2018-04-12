/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.jni;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.genium.generator.cpp.CppModelBuilder;
import com.here.genium.generator.cpp.CppNameRules;
import com.here.genium.generator.java.JavaModelBuilder;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.*;
import com.here.genium.model.jni.*;
import java.util.*;
import java.util.stream.Collectors;
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
  private final CppIncludeResolver cppIncludeResolver;

  @VisibleForTesting
  JniModelBuilder(
      final ModelBuilderContextStack<JniElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final JavaModelBuilder javaBuilder,
      final CppModelBuilder cppBuilder,
      final CppIncludeResolver cppIncludeResolver) {

    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.javaBuilder = javaBuilder;
    this.cppBuilder = cppBuilder;
    this.cppIncludeResolver = cppIncludeResolver;
  }

  public JniModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final JavaModelBuilder javaBuilder,
      final CppModelBuilder cppBuilder,
      final CppIncludeResolver cppIncludeResolver) {
    this(
        new ModelBuilderContextStack<>(),
        deploymentModel,
        javaBuilder,
        cppBuilder,
        cppIncludeResolver);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    CppClass cppClass = cppBuilder.getFinalResult(CppClass.class);
    JavaTopLevelElement javaTopLevelElement = javaBuilder.getFinalResult(JavaTopLevelElement.class);
    JavaClass javaClass = javaBuilder.getFinalResult(JavaClass.class);

    JniContainer jniContainer =
        JniContainer.builder(
                javaTopLevelElement.javaPackage.packageNames,
                DefinedBy.getPackages(francaInterface))
            .javaName(javaClass.name)
            .javaInterfaceName(javaTopLevelElement.name)
            .cppName(cppClass.name)
            .isFrancaInterface(true)
            .isInterface(deploymentModel.isInterface(francaInterface))
            .build();

    JniContainer parentContainer = getPreviousResult(JniContainer.class);
    if (parentContainer != null) {
      parentContainer.parentMethods.forEach(jniContainer::addParentMethod);
      parentContainer.methods.forEach(jniContainer::addParentMethod);
    }

    getPreviousResults(JniMethod.class).forEach(jniContainer::add);
    getPreviousResults(JniStruct.class).forEach(jniContainer::add);
    getPreviousResults(JniEnum.class).forEach(jniContainer::add);

    jniContainer.includes.add(cppIncludeResolver.resolveInclude(francaInterface));
    jniContainer.includes.addAll(getIncludes(francaInterface));

    storeResult(jniContainer);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

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

    JavaParameter javaParameter = javaBuilder.getFinalResult(JavaParameter.class);
    CppParameter cppParameter = cppBuilder.getFinalResult(CppParameter.class);
    JniType jniType = JniType.createType(javaParameter.type, cppParameter.type);

    storeResult(new JniParameter(javaParameter.name, jniType));
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

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

    // Type definition
    JavaEnum javaEnum = javaBuilder.getFinalResult(JavaEnum.class);
    CppEnum cppEnum = cppBuilder.getFinalResult(CppEnum.class);
    storeResult(
        new JniEnum.Builder(javaEnum.name, cppEnum.name)
            .javaPackage(javaEnum.javaPackage)
            .enumerators(getPreviousResults(JniEnumerator.class))
            .build());

    // Type reference
    JavaType javaType = javaBuilder.getFinalResult(JavaType.class);
    CppTypeRef cppTypeRef = cppBuilder.getFinalResult(CppTypeRef.class);
    storeResult(JniType.createType(javaType, cppTypeRef));

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
    JniField jniField =
        JniField.builder()
            .javaField(javaField)
            .cppField(cppField)
            .type(jniType)
            .cppGetterName(deploymentModel.getExternalGetter(francaField))
            .cppSetterName(deploymentModel.getExternalSetter(francaField))
            .build();

    storeResult(jniField);
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

    JniContainer jniContainer = JniContainer.builder(packageNames, cppNameSpace).build();
    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JniStruct.class)
        .forEach(jniContainer::add);
    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JniEnum.class)
        .forEach(jniContainer::add);

    jniContainer.includes.addAll(getIncludes(francaTypeCollection));

    storeResult(jniContainer);
    closeContext();
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

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

  private Collection<Include> getIncludes(final FTypeCollection francaTypeCollection) {
    return francaTypeCollection
        .getTypes()
        .stream()
        .map(cppIncludeResolver::resolveInclude)
        .collect(Collectors.toList());
  }
}
