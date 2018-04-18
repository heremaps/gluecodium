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

package com.here.genium.generator.cbridge;

import static com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.*;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.genium.generator.cpp.CppModelBuilder;
import com.here.genium.generator.swift.SwiftModelBuilder;
import com.here.genium.model.cbridge.*;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppField;
import com.here.genium.model.cpp.CppIncludeResolver;
import com.here.genium.model.cpp.CppMethod;
import com.here.genium.model.cpp.CppStruct;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.SwiftField;
import com.here.genium.model.swift.SwiftMethod;
import com.here.genium.model.swift.SwiftProperty;
import java.util.*;
import org.franca.core.franca.*;

public class CBridgeModelBuilder extends AbstractModelBuilder<CElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final CppIncludeResolver cppIncludeResolver;
  private final CBridgeIncludeResolver includeResolver;
  private final CppModelBuilder cppBuilder;
  private final SwiftModelBuilder swiftBuilder;
  private final CTypeMapper typeMapper;

  public final Map<String, CArray> arraysCollector = new HashMap<>();

  public CBridgeModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final CppIncludeResolver cppIncludeResolver,
      final CBridgeIncludeResolver includeResolver,
      final CppModelBuilder cppBuilder,
      final SwiftModelBuilder swiftBuilder,
      final CTypeMapper typeMapper) {
    this(
        new ModelBuilderContextStack<>(),
        deploymentModel,
        cppIncludeResolver,
        includeResolver,
        cppBuilder,
        swiftBuilder,
        typeMapper);
  }

  @VisibleForTesting
  CBridgeModelBuilder(
      final ModelBuilderContextStack<CElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final CppIncludeResolver cppIncludeResolver,
      final CBridgeIncludeResolver includeResolver,
      final CppModelBuilder cppBuilder,
      final SwiftModelBuilder swiftBuilder,
      final CTypeMapper typeMapper) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.cppIncludeResolver = cppIncludeResolver;
    this.includeResolver = includeResolver;
    this.cppBuilder = cppBuilder;
    this.swiftBuilder = swiftBuilder;
    this.typeMapper = typeMapper;
  }

  @Override
  public void startBuilding(FInterface francaInterface) {
    super.startBuilding(francaInterface);
    storeResult(typeMapper.createCustomTypeInfo(francaInterface, CLASS));
  }

  @Override
  public void finishBuilding(FEnumerationType enumerationType) {
    storeResult(new CEnum(CBridgeNameRules.getEnumName(enumerationType)));
    super.finishBuilding(enumerationType);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    CppTypeInfo classInfo =
        CollectionsHelper.getFirstOfType(getCurrentContext().currentResults, CppTypeInfo.class);
    CInterface cInterface =
        finishBuildingInterfaceOrTypeCollection(
            CBridgeNameRules.getInterfaceName(francaInterface), classInfo, francaInterface);

    if (deploymentModel.isInterface(francaInterface)) {
      cInterface.functionTableName = CBridgeNameRules.getFunctionTableName(francaInterface);
      cInterface.implementationIncludes.add(
          Include.createInternalInclude(CBridgeComponents.PROXY_CACHE_FILENAME));
    }

    storeResult(cInterface);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {
    CInterface cInterface =
        finishBuildingInterfaceOrTypeCollection(
            francaTypeCollection.getName(), null, francaTypeCollection);
    storeResult(cInterface);
    closeContext();
  }

  private CInterface finishBuildingInterfaceOrTypeCollection(
      final String name, final CppTypeInfo selfType, final FTypeCollection francaTypeCollection) {

    CInterface parentClass = getPreviousResult(CInterface.class);
    CInterface cInterface = new CInterface(name, selfType);
    if (parentClass != null) {
      cInterface.inheritedFunctions.addAll(parentClass.inheritedFunctions);
      cInterface.inheritedFunctions.addAll(parentClass.functions);
    }
    cInterface.functions.addAll(getPreviousResults(CFunction.class));
    cInterface.structs.addAll(getPreviousResults(CStruct.class));
    cInterface.enumerators.addAll(getPreviousResults(CEnum.class));
    cInterface.maps.addAll(getPreviousResults(CMap.class));

    cInterface.headerIncludes.addAll(CBridgeComponents.collectHeaderIncludes(cInterface));
    cInterface.implementationIncludes.addAll(
        CBridgeComponents.collectImplementationIncludes(cInterface));

    cInterface.implementationIncludes.add(includeResolver.resolveInclude(francaTypeCollection));
    cInterface.privateHeaderIncludes.addAll(
        CBridgeComponents.collectPrivateHeaderIncludes(cInterface));
    return cInterface;
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    SwiftMethod swiftMethod = swiftBuilder.getFinalResult(SwiftMethod.class);
    CppMethod cppMethod = cppBuilder.getFinalResult(CppMethod.class);
    List<CInParameter> inParams = getPreviousResults(CInParameter.class);
    COutParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, COutParameter.class, new COutParameter());

    CFunction.CFunctionBuilder methodBuilder =
        CFunction.builder(swiftMethod.cShortName)
            .nestedSpecifier(swiftMethod.cNestedSpecifier)
            .delegateCall(cppMethod.fullyQualifiedName)
            .parameters(inParams)
            .returnType(returnParam.mappedType)
            .error(
                francaMethod.getErrorEnum() != null
                    ? typeMapper.createErrorTypeInfo(francaMethod.getErrorEnum())
                    : null)
            .delegateCallIncludes(
                Collections.singleton(cppIncludeResolver.resolveInclude(francaMethod)))
            .functionName(cppMethod.name);

    if (!deploymentModel.isStatic(francaMethod)) {
      CppTypeInfo classInfo =
          CollectionsHelper.getFirstOfType(getParentContext().currentResults, CppTypeInfo.class);
      CInParameter parameterSelf = new CInParameter("_instance", classInfo);
      methodBuilder
          .selfParameter(parameterSelf)
          .functionName(cppBuilder.getFinalResult(CppMethod.class).name);
    }

    storeResult(methodBuilder.build());
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    storeResult(new CInParameter(francaArgument.getName(), getPreviousResult(CppTypeInfo.class)));
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    storeResult(new COutParameter("result", getPreviousResult(CppTypeInfo.class)));
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {

    CStruct cStruct =
        new CStruct(
            CBridgeNameRules.getStructBaseName(francaStruct),
            cppBuilder.getFinalResult(CppStruct.class).fullyQualifiedName,
            typeMapper.createCustomTypeInfo(francaStruct, STRUCT));

    CStruct parentStruct = getPreviousResult(CStruct.class);
    if (parentStruct != null) {
      cStruct.fields.addAll(parentStruct.fields);
    }
    cStruct.fields.addAll(getPreviousResults(CField.class));

    storeResult(cStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FArrayType francaArray) {

    CppTypeInfo innerType = typeMapper.mapType(francaArray.getElementType());
    CArray cArray = CArrayMapper.createArrayDefinition(francaArray, innerType);
    arraysCollector.put(cArray.name, cArray);

    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    CppField cppField = cppBuilder.getFinalResult(CppField.class);
    SwiftField swiftField = swiftBuilder.getFinalResult(SwiftField.class);
    CField cField =
        CField.builder()
            .swiftLayerName(swiftField.name)
            .baseLayerName(cppField.name)
            .cppTypeInfo(getPreviousResult(CppTypeInfo.class))
            .baseLayerGetterName(deploymentModel.getExternalGetter(francaField))
            .baseLayerSetterName(deploymentModel.getExternalSetter(francaField))
            .build();

    storeResult(cField);
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuilding(FTypeRef typeRef) {
    CppTypeInfo type = typeMapper.mapType(typeRef);
    if (type instanceof CppArrayTypeInfo) {
      CppArrayTypeInfo arrayTypeInfo = (CppArrayTypeInfo) type;
      CArray cArray =
          CArrayMapper.createArrayDefinition(typeRef, arrayTypeInfo.innerType, arrayTypeInfo);
      arraysCollector.put(cArray.name, cArray);
    }

    storeResult(type);
    super.finishBuilding(typeRef);
  }

  @Override
  public void finishBuilding(FAttribute attribute) {

    List<CppMethod> cppMethods =
        CollectionsHelper.getAllOfType(cppBuilder.getFinalResults(), CppMethod.class);

    SwiftProperty property = swiftBuilder.getFinalResult(SwiftProperty.class);

    CppTypeInfo classInfo =
        CollectionsHelper.getFirstOfType(getParentContext().currentResults, CppTypeInfo.class);
    CInParameter selfParameter = new CInParameter("_instance", classInfo);
    CppTypeInfo attributeTypeInfo = getPreviousResult(CppTypeInfo.class);

    SwiftMethod getterSwiftMethod = property.propertyAccessors.get(0);
    CFunction.CFunctionBuilder getterBuilder =
        CFunction.builder(getterSwiftMethod.cShortName)
            .nestedSpecifier(getterSwiftMethod.cNestedSpecifier)
            .returnType(attributeTypeInfo)
            .selfParameter(selfParameter)
            .functionName(cppMethods.get(0).name);
    storeResult(getterBuilder.build());

    if (!attribute.isReadonly()) {
      SwiftMethod setterSwiftMethod = property.propertyAccessors.get(1);
      CFunction.CFunctionBuilder setterBuilder =
          CFunction.builder(setterSwiftMethod.cShortName)
              .nestedSpecifier(setterSwiftMethod.cNestedSpecifier)
              .parameters(
                  Collections.singletonList(new CInParameter("newValue", attributeTypeInfo)))
              .selfParameter(selfParameter)
              .functionName(cppMethods.get(1).name);
      storeResult(setterBuilder.build());
    }

    super.finishBuilding(attribute);
  }

  @Override
  public void finishBuilding(final FMapType francaMapType) {

    String name = CBridgeNameRules.getMapName(francaMapType);
    List<CppTypeInfo> typeInfos = getPreviousResults(CppTypeInfo.class);
    CppTypeInfo keyType = typeInfos.get(0);
    CppTypeInfo valueType = typeInfos.get(1);
    Include baseApiInclude = cppIncludeResolver.resolveInclude(francaMapType);

    String enumHashType = null;
    if (keyType.typeCategory == CppTypeInfo.TypeCategory.ENUM) {
      enumHashType = typeMapper.getEnumHashType();
    }

    CMap cMap = new CMap(name, keyType, valueType, enumHashType, baseApiInclude);

    storeResult(cMap);
    super.finishBuilding(francaMapType);
  }
}
