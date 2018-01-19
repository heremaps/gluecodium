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
import com.here.ivi.api.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.ivi.api.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.swift.SwiftModelBuilder;
import com.here.ivi.api.model.cbridge.*;
import com.here.ivi.api.model.cbridge.IncludeResolver.HeaderType;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cpp.CppField;
import com.here.ivi.api.model.cpp.CppMethod;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.swift.SwiftField;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftProperty;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.franca.core.franca.*;

public class CBridgeModelBuilder extends AbstractModelBuilder<CElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final IncludeResolver resolver;
  private final CppModelBuilder cppBuilder;
  private final SwiftModelBuilder swiftBuilder;
  public final Map<String, CArray> arraysCollector = new HashMap<>();

  public CBridgeModelBuilder(
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
  CBridgeModelBuilder(
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
    storeResult(CTypeMapper.createCustomTypeInfo(resolver, francaInterface, CLASS));
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

    cInterface.headerIncludes.addAll(CBridgeComponents.collectHeaderIncludes(cInterface));
    cInterface.implementationIncludes.addAll(
        CBridgeComponents.collectImplementationIncludes(cInterface));

    cInterface.implementationIncludes.add(
        resolver.resolveInclude(francaTypeCollection, HeaderType.CBRIDGE_PUBLIC_HEADER));
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
                    ? CTypeMapper.createErrorTypeInfo(resolver, francaMethod.getErrorEnum())
                    : null)
            .delegateCallIncludes(
                Collections.singleton(
                    resolver.resolveInclude(francaMethod, HeaderType.BASE_API_HEADER)))
            .functionName(cppMethod.name);

    if (!deploymentModel.isStatic(francaMethod)) {
      CppTypeInfo classInfo =
          CollectionsHelper.getFirstOfType(getParentContext().currentResults, CppTypeInfo.class);
      CInParameter parameterSelf = new CInParameter("_instance", classInfo);
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
            CTypeMapper.createCustomTypeInfo(resolver, francaStruct, STRUCT));

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

    CppTypeInfo innerType = CTypeMapper.mapType(resolver, francaArray.getElementType());
    CArray cArray = CArrayMapper.createArrayDefinition(francaArray, innerType);
    arraysCollector.put(cArray.name, cArray);

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
      CArray cArray =
          CArrayMapper.createArrayDefinition(typeRef.getDerived(), type.innerType, type);
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
}
