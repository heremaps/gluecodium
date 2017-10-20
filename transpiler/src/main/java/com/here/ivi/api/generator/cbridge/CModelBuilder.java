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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppModelBuilder;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.CClassType;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CEnum;
import com.here.ivi.api.model.cmodel.CField;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.*;

public class CModelBuilder extends AbstractModelBuilder<CElement> {

  private final FrancaElement rootModel;
  private final IncludeResolver resolver;
  private final CppModelBuilder cppBuilder;

  public CModelBuilder(
      final FrancaElement rootModel,
      final IncludeResolver includeResolver,
      final CppModelBuilder cppBuilder) {
    this(new ModelBuilderContextStack<>(), rootModel, includeResolver, cppBuilder);
  }

  @VisibleForTesting
  CModelBuilder(
      final ModelBuilderContextStack<CElement> contextStack,
      final FrancaElement rootModel,
      final IncludeResolver includeResolver,
      final CppModelBuilder cppBuilder) {
    super(contextStack);
    this.rootModel = rootModel;
    this.resolver = includeResolver;
    this.cppBuilder = cppBuilder;
  }

  @Override
  public void startBuilding(FInterface francaInterface) {
    super.startBuilding(francaInterface);
    CppTypeInfo typeInfo = CppTypeInfo.createInstanceTypeInfo(resolver, francaInterface);
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
    cInterface.functionTableName = CBridgeNameRules.getFunctionTableName(francaInterface);

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
    final boolean isStatic = rootModel.isStatic(francaMethod);

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
            .delegateCallIncludes(
                Collections.singleton(
                    resolver.resolveInclude(francaMethod, HeaderType.BASE_API_HEADER)));

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
            CppTypeInfo.createCustomTypeInfo(resolver, francaStruct));

    cStruct.fields = getPreviousResults(CField.class);

    storeResult(cStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FField francaField) {
    storeResult(new CField(francaField.getName(), getPreviousResult(CppTypeInfo.class)));
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuilding(FTypeRef typeRef) {
    storeResult(CTypeMapper.mapType(resolver, typeRef));
    super.finishBuilding(typeRef);
  }

  @Override
  public void finishBuilding(FAttribute attribute) {
    List<CppMethod> cppMethods =
        CollectionsHelper.getAllOfType(cppBuilder.getFinalResults(), CppMethod.class);
    CClassType classInfo =
        CollectionsHelper.getFirstOfType(getParentContext().currentResults, CClassType.class);
    CInParameter selfParameter = new CInParameter("_instance", classInfo.classType);
    CppTypeInfo attributeTypeInfo = getPreviousResult(CppTypeInfo.class);

    CFunction.CFunctionBuilder getterBuilder =
        CFunction.builder(CBridgeNameRules.getAtrributeGetterName(attribute))
            .returnType(attributeTypeInfo)
            .selfParameter(selfParameter)
            .functionName(CppNameRules.getMethodName(cppMethods.get(0).name));
    storeResult(getterBuilder.build());

    if (!attribute.isReadonly()) {
      CFunction.CFunctionBuilder setterBuilder =
          CFunction.builder(CBridgeNameRules.getAtrributeSetterName(attribute))
              .parameters(
                  Collections.singletonList(new CInParameter("newValue", attributeTypeInfo)))
              .selfParameter(selfParameter)
              .functionName(CppNameRules.getMethodName(cppMethods.get(1).name));
      storeResult(setterBuilder.build());
    }

    super.finishBuilding(attribute);
  }
}
