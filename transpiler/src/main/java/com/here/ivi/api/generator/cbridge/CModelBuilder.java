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

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.CClassType;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CEnum;
import com.here.ivi.api.model.cmodel.CEnumItem;
import com.here.ivi.api.model.cmodel.CField;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.CValue;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.List;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FExpression;
import org.franca.core.franca.FField;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;

public class CModelBuilder extends AbstractModelBuilder<CElement> {

  private final FrancaElement rootModel;
  private final IncludeResolver resolver;

  public CModelBuilder(final FrancaElement rootModel, IncludeResolver includeResolver) {
    super(new ModelBuilderContextStack<>());
    this.rootModel = rootModel;
    this.resolver = includeResolver;
  }

  CModelBuilder(
      FrancaElement rootModel,
      IncludeResolver includeResolver,
      ModelBuilderContextStack<CElement> contextStack) {
    super(contextStack);
    this.rootModel = rootModel;
    this.resolver = includeResolver;
  }

  @Override
  public void startBuilding(FInterface francaInterface) {
    super.startBuilding(francaInterface);
    CppTypeInfo typeInfo = CppTypeInfo.createInstanceTypeInfo(resolver, francaInterface);
    CClassType classInfo = new CClassType(typeInfo);
    storeResult(classInfo);
  }

  public void finishBuilding(FEnumerator francaEnumerator) {
    CValue value =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, CValue.class);
    storeResult(new CEnumItem(CBridgeNameRules.getEnumItemName(francaEnumerator), value));
    super.finishBuilding(francaEnumerator);
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {
    List<CEnumItem> enumItems =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CEnumItem.class);
    storeResult(new CEnum(CBridgeNameRules.getEnumName(francaEnumerationType), enumItems));
    super.finishBuilding(francaEnumerationType);
  }

  @Override
  public void finishBuilding(FExpression francaExpression) {
    storeResult(CTypeMapper.mapType(francaExpression));
    super.finishBuilding(francaExpression);
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
    cInterface.functions.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CFunction.class));
    cInterface.structs.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CStruct.class));
    cInterface.enumerators =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CEnum.class);

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
    List<CInParameter> inParams =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CInParameter.class);
    COutParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, COutParameter.class, new COutParameter());
    CFunction method =
        new CFunction.Builder(baseFunctionName)
            .delegate(delegateMethodName)
            .parameters(inParams)
            .returnType(returnParam.mappedType)
            .build();
    method.delegateCallInclude.add(
        resolver.resolveInclude(francaMethod, HeaderType.BASE_API_HEADER));

    if (!isStatic) {
      CClassType classInfo =
          CollectionsHelper.getFirstOfType(getParentContext().currentResults, CClassType.class);
      CInParameter parameterSelf = new CInParameter("_instance", classInfo.classType);
      method.selfParameter = parameterSelf;
      method.functionName = CppNameRules.getMethodName(francaMethod.getName());
    }

    storeResult(method);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(resolver, francaArgument.getType());
    String francaArgumentName = francaArgument.getName();
    storeResult(new CInParameter(francaArgumentName, typeInfo));
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(resolver, francaArgument.getType());
    COutParameter param = new COutParameter("result", typeInfo);
    storeResult(param);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {
    CStruct cStruct =
        new CStruct(
            CBridgeNameRules.getStructBaseName(francaStruct),
            CBridgeNameRules.getBaseApiStructName(francaStruct),
            CppTypeInfo.createStructTypeInfo(resolver, francaStruct));

    cStruct.fields =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CField.class);

    storeResult(cStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FField francaField) {
    CField cField =
        new CField(francaField.getName(), CTypeMapper.mapType(resolver, francaField.getType()));
    storeResult(cField);
    super.finishBuilding(francaField);
  }
}
