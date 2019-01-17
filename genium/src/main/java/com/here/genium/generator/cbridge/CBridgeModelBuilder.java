/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
  private final CBridgeTypeMapper typeMapper;

  public final Map<String, CArray> arraysCollector = new HashMap<>();

  public CBridgeModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final CppIncludeResolver cppIncludeResolver,
      final CBridgeIncludeResolver includeResolver,
      final CppModelBuilder cppBuilder,
      final SwiftModelBuilder swiftBuilder,
      final CBridgeTypeMapper typeMapper) {
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
      final CBridgeTypeMapper typeMapper) {
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
    storeResult(
        new CEnum(
            CBridgeNameRules.getEnumName(enumerationType),
            typeMapper.createEnumTypeInfo(enumerationType)));
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
          Include.Companion.createInternalInclude(CBridgeComponents.PROXY_CACHE_FILENAME));
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
    cInterface.enums.addAll(getPreviousResults(CEnum.class));
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

    boolean isStatic =
        !deploymentModel.isStatic(francaMethod) && !deploymentModel.isConstructor(francaMethod);
    CParameter parameterSelf = null;
    if (isStatic) {
      CppTypeInfo cppTypeInfo =
          CollectionsHelper.getFirstOfType(getParentContext().currentResults, CppTypeInfo.class);
      parameterSelf = new CInParameter("_instance", cppTypeInfo);
    }
    CppTypeInfo errorTypeInfo = null;
    if (francaMethod.getErrorEnum() != null) {
      errorTypeInfo = typeMapper.createErrorTypeInfo(francaMethod.getErrorEnum());
    }

    CFunction result =
        new CFunction(
            swiftMethod.getCShortName(),
            swiftMethod.getCNestedSpecifier(),
            returnParam.mappedType,
            inParams,
            parameterSelf,
            cppMethod.fullyQualifiedName,
            Collections.singleton(cppIncludeResolver.resolveInclude(francaMethod)),
            isStatic ? cppBuilder.getFinalResult(CppMethod.class).name : cppMethod.name,
            cppMethod.getReturnType().fullyQualifiedName,
            deploymentModel.isConst(francaMethod),
            errorTypeInfo);

    storeResult(result);
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

    CppStruct cppStruct = cppBuilder.getFinalResult(CppStruct.class);
    CStruct cStruct =
        new CStruct(
            CBridgeNameRules.getStructBaseName(francaStruct),
            cppStruct.fullyQualifiedName,
            typeMapper.createCustomTypeInfo(francaStruct, STRUCT),
            cppStruct.isImmutable());
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
        new CField(
            swiftField.name,
            cppField.name,
            getPreviousResult(CppTypeInfo.class),
            deploymentModel.getExternalGetter(francaField),
            deploymentModel.getExternalSetter(francaField));

    storeResult(cField);
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuilding(FTypeRef typeRef) {
    CppTypeInfo type = typeMapper.mapType(typeRef);
    if (type instanceof CppArrayTypeInfo) {
      CppArrayTypeInfo arrayTypeInfo = (CppArrayTypeInfo) type;
      CArray cArray =
          CArrayMapper.createArrayDefinition(typeRef, arrayTypeInfo.getInnerType(), arrayTypeInfo);
      arraysCollector.put(cArray.name, cArray);
    }

    storeResult(type);
    super.finishBuilding(typeRef);
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

    List<CppMethod> cppMethods =
        CollectionsHelper.getAllOfType(cppBuilder.getFinalResults(), CppMethod.class);

    SwiftProperty property = swiftBuilder.getFinalResult(SwiftProperty.class);

    CppTypeInfo classInfo =
        CollectionsHelper.getFirstOfType(getParentContext().currentResults, CppTypeInfo.class);
    CInParameter selfParameter =
        !deploymentModel.isStatic(francaAttribute)
            ? new CInParameter("_instance", classInfo)
            : null;
    CppTypeInfo attributeTypeInfo = getPreviousResult(CppTypeInfo.class);

    SwiftMethod getterSwiftMethod = property.getter;
    CppMethod cppGetterMethod = cppMethods.get(0);
    CFunction getterFunction =
        new CFunction(
            getterSwiftMethod.getCShortName(),
            getterSwiftMethod.getCNestedSpecifier(),
            attributeTypeInfo,
            Collections.emptyList(),
            selfParameter,
            cppGetterMethod.fullyQualifiedName,
            Collections.singleton(cppIncludeResolver.resolveInclude(francaAttribute)),
            cppGetterMethod.name,
            cppGetterMethod.getReturnType().fullyQualifiedName,
            true);
    storeResult(getterFunction);

    if (!francaAttribute.isReadonly()) {
      SwiftMethod setterSwiftMethod = property.setter;
      CppMethod cppSetterMethod = cppMethods.get(1);
      CFunction setterFunction =
          new CFunction(
              setterSwiftMethod.getCShortName(),
              setterSwiftMethod.getCNestedSpecifier(),
              new CppTypeInfo(CType.VOID),
              Collections.singletonList(new CInParameter("newValue", attributeTypeInfo)),
              selfParameter,
              cppSetterMethod.fullyQualifiedName,
              Collections.singleton(cppIncludeResolver.resolveInclude(francaAttribute)),
              cppSetterMethod.name,
              cppSetterMethod.getReturnType().fullyQualifiedName);
      storeResult(setterFunction);
    }

    super.finishBuilding(francaAttribute);
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
