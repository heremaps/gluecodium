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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory.*;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.swift.SwiftModelBuilder;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.swift.SwiftField;
import com.here.ivi.api.model.swift.SwiftProperty;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.franca.core.franca.*;

public class CModelBuilder extends AbstractModelBuilder<CElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final IncludeResolver resolver;
  private final CppModelBuilder cppBuilder;
  private final SwiftModelBuilder swiftBuilder;
  public Map<String, CArray> arraysCollector = new HashMap<>();

  public CModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      IncludeResolver includeResolver,
      CppModelBuilder cppBuilder,
      SwiftModelBuilder swiftBuilder) {
    this(
        new ModelBuilderContextStack<>(),
        deploymentModel,
        includeResolver,
        cppBuilder,
        swiftBuilder);
  }

  @VisibleForTesting
  CModelBuilder(
      final ModelBuilderContextStack<CElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final IncludeResolver includeResolver,
      final CppModelBuilder cppBuilder,
      final SwiftModelBuilder swiftBuilder) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.resolver = includeResolver;
    this.cppBuilder = cppBuilder;
    this.swiftBuilder = swiftBuilder;
  }

  @Override
  public void startBuilding(FInterface francaInterface) {
    super.startBuilding(francaInterface);
    CppTypeInfo typeInfo = CppTypeInfo.createCustomTypeInfo(resolver, francaInterface, CLASS);
    CClassType classInfo = new CClassType(typeInfo);
    storeResult(classInfo);
  }

  @Override
  public void finishBuilding(FEnumerationType enumerationType) {
    storeResult(new CEnum(CBridgeNameRules.getEnumName(enumerationType)));
    super.finishBuilding(enumerationType);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    CClassType classInfo =
        CollectionsHelper.getFirstOfType(getCurrentContext().currentResults, CClassType.class);
    CInterface cInterface =
        finishBuildingInterfaceOrTypeCollection(
            new CInterface(CBridgeNameRules.getInterfaceName(francaInterface), classInfo),
            francaInterface);

    if (deploymentModel.isInterface(francaInterface)) {
      cInterface.functionTableName = CBridgeNameRules.getFunctionTableName(francaInterface);
    }

    storeResult(cInterface);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {
    CInterface cInterface =
        finishBuildingInterfaceOrTypeCollection(
            new CInterface(francaTypeCollection.getName()), francaTypeCollection);
    storeResult(cInterface);
    closeContext();
  }

  private CInterface finishBuildingInterfaceOrTypeCollection(
      CInterface cInterface, FTypeCollection francaTypeCollection) {
    cInterface.functions.addAll(getPreviousResults(CFunction.class));
    cInterface.structs.addAll(getPreviousResults(CStruct.class));
    cInterface.enumerators = getPreviousResults(CEnum.class);

    cInterface.headerIncludes = CBridgeComponents.collectHeaderIncludes(cInterface);
    cInterface.implementationIncludes = CBridgeComponents.collectImplementationIncludes(cInterface);

    cInterface.implementationIncludes.add(
        resolver.resolveInclude(francaTypeCollection, HeaderType.CBRIDGE_PUBLIC_HEADER));
    cInterface.privateHeaderIncludes = CBridgeComponents.collectPrivateHeaderIncludes(cInterface);
    return cInterface;
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    final boolean isStatic = deploymentModel.isStatic(francaMethod);

    String baseFunctionName = CBridgeNameRules.getMethodName(francaMethod);
    String delegateMethodName = CBridgeNameRules.getDelegateMethodName(francaMethod);
    List<CInParameter> inParams = getPreviousResults(CInParameter.class);
    COutParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, COutParameter.class, new COutParameter());

    CFunction.CFunctionBuilder methodBuilder =
        CFunction.builder(baseFunctionName)
            .delegateCall(delegateMethodName)
            .parameters(inParams)
            .returnType(returnParam.mappedType)
            .hasError(francaMethod.getErrorEnum() != null) //Temporary until APIGEN-701
            .delegateCallIncludes(
                Collections.singleton(
                    resolver.resolveInclude(francaMethod, HeaderType.BASE_API_HEADER)))
            .functionName(CppNameRules.getMethodName(francaMethod.getName()));

    if (!isStatic) {
      CClassType classInfo =
          CollectionsHelper.getFirstOfType(getParentContext().currentResults, CClassType.class);
      CInParameter parameterSelf = new CInParameter("_instance", classInfo.classType);
      methodBuilder
          .selfParameter(parameterSelf)
          .functionName(CppNameRules.getMethodName(francaMethod.getName()));
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
            CBridgeNameRules.getBaseApiStructName(francaStruct),
            CppTypeInfo.createCustomTypeInfo(resolver, francaStruct, STRUCT));

    cStruct.fields = getPreviousResults(CField.class);

    storeResult(cStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FArrayType francaArray) {
    CppTypeInfo innerType = CTypeMapper.mapType(resolver, francaArray.getElementType());
    CppTypeInfo arrayType = CArrayMapper.create(innerType, francaArray);
    arraysCollector.put(arrayType.functionReturnType.name, new CArray(arrayType));
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {
    CppField cppField = cppBuilder.getFinalResult(CppField.class);
    SwiftField swiftField = swiftBuilder.getFinalResult(SwiftField.class);
    storeResult(new CField(swiftField.name, cppField.name, getPreviousResult(CppTypeInfo.class)));
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuilding(FTypeRef typeRef) {
    CppTypeInfo type = CTypeMapper.mapType(resolver, typeRef);
    if (type.typeCategory == ARRAY) {
      arraysCollector.put(type.functionReturnType.name, new CArray(type));
    }
    storeResult(type);
    super.finishBuilding(typeRef);
  }

  @Override
  public void finishBuilding(FAttribute attribute) {
    List<CppMethod> cppMethods =
        CollectionsHelper.getAllOfType(cppBuilder.getFinalResults(), CppMethod.class);

    SwiftProperty property = swiftBuilder.getFinalResult(SwiftProperty.class);

    CClassType classInfo =
        CollectionsHelper.getFirstOfType(getParentContext().currentResults, CClassType.class);
    CInParameter selfParameter = new CInParameter("_instance", classInfo.classType);
    CppTypeInfo attributeTypeInfo = getPreviousResult(CppTypeInfo.class);

    CFunction.CFunctionBuilder getterBuilder =
        CFunction.builder(property.propertyAccessors.get(0).cBaseName)
            .returnType(attributeTypeInfo)
            .selfParameter(selfParameter)
            .functionName(cppMethods.get(0).name);
    storeResult(getterBuilder.build());

    if (!attribute.isReadonly()) {
      CFunction.CFunctionBuilder setterBuilder =
          CFunction.builder(property.propertyAccessors.get(1).cBaseName)
              .parameters(
                  Collections.singletonList(new CInParameter("newValue", attributeTypeInfo)))
              .selfParameter(selfParameter)
              .functionName(cppMethods.get(1).name);
      storeResult(setterBuilder.build());
    }

    super.finishBuilding(attribute);
  }
}
