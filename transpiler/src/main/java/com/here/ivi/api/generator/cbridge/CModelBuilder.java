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

import static com.here.ivi.api.model.cmodel.CFunction.FunctionMember.INSTANCE;
import static com.here.ivi.api.model.cmodel.CFunction.FunctionMember.STATIC;
import static java.util.Collections.singletonList;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.*;

public class CModelBuilder extends AbstractModelBuilder<CElement> {

  private final CBridgeNameRules cBridgeNameRules;
  private final FrancaElement rootModel;
  private final IncludeResolver resolver;

  public CModelBuilder(final FrancaElement rootModel, IncludeResolver includeResolver) {
    super(new ModelBuilderContextStack<>());
    cBridgeNameRules = new CBridgeNameRules();
    this.rootModel = rootModel;
    this.resolver = includeResolver;
  }

  CModelBuilder(
      FrancaElement rootModel,
      CBridgeNameRules nameRules,
      IncludeResolver includeResolver,
      ModelBuilderContextStack<CElement> contextStack) {
    super(contextStack);
    cBridgeNameRules = nameRules;
    this.rootModel = rootModel;
    this.resolver = includeResolver;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    CClassType classInfo =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, CClassType.class);
    CInterface cInterface =
        finishBuildingInterfaceOrTypeCollection(
            new CInterface(classInfo, francaInterface, cBridgeNameRules), francaInterface);
    CStructTypedef functionTable = createInterfaceFunctionTable(francaInterface);
    populateFunctionTableWithMethods(cInterface, functionTable);
    cInterface.structs.add(functionTable);
    storeResult(cInterface);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {
    if (InstanceRules.isInstanceId(francaTypeDef)) {
      CppTypeInfo typeInfo = CppTypeInfo.createInstanceTypeInfo(resolver, francaTypeDef);
      CClassType classType = new CClassType(typeInfo);
      storeResult(classType);
    }
    super.finishBuilding(francaTypeDef);
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {
    CInterface cInterface =
        finishBuildingInterfaceOrTypeCollection(new CInterface(), francaTypeCollection);
    storeResult(cInterface);
    closeContext();
  }

  private CInterface finishBuildingInterfaceOrTypeCollection(
      CInterface cInterface, FTypeCollection francaTypeCollection) {
    cInterface.functions.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CFunction.class));
    cInterface.structs.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CStructTypedef.class));

    cInterface.headerIncludes = CBridgeComponents.collectHeaderIncludes(cInterface);
    cInterface.implementationIncludes = CBridgeComponents.collectImplementationIncludes(cInterface);

    cInterface.implementationIncludes.add(
        resolver.resolveInclude(francaTypeCollection, HeaderType.CBRIDGE_PUBLIC_HEADER));
    cInterface.privateHeaderIncludes = CBridgeComponents.collectPrivateHeaderIncludes(cInterface);
    return cInterface;
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    CFunction method =
        (rootModel.isStatic(francaMethod))
            ? buildStaticMethod(francaMethod)
            : buildInstanceMethod(francaMethod);
    storeResult(method);
    closeContext();
  }

  private CFunction buildInstanceMethod(FMethod francaMethod) {
    String baseFunctionName = cBridgeNameRules.getMethodName(francaMethod);
    String delegateMethodName = "get_pointer(_instance)->";
    String refName = cBridgeNameRules.getStructRefType(rootModel.getFrancaTypeCollection());
    CType typeSelf = new CType(refName);
    CInParameter parameterSelf = new CInParameter("_instance", typeSelf);
    List<CInParameter> inParams =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CInParameter.class);
    //Extra param the instance itself.
    inParams.add(0, parameterSelf);
    COutParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, COutParameter.class, new COutParameter());
    CFunction instanceFunction =
        CBridgeComponents.createFunction(
            inParams, baseFunctionName, delegateMethodName, returnParam, INSTANCE);
    instanceFunction.delegateCallInclude.add(
        resolver.resolveInclude(francaMethod, HeaderType.BASE_API_HEADER));
    instanceFunction.functionName = CppNameRules.getMethodName(francaMethod.getName());
    return instanceFunction;
  }

  private CFunction buildStaticMethod(FMethod francaMethod) {
    // TODO APIGEN-326: Include parameter types in function names
    String baseFunctionName = cBridgeNameRules.getMethodName(francaMethod);
    String delegateMethodName = cBridgeNameRules.getDelegateMethodName(francaMethod);

    List<CInParameter> inParams =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CInParameter.class);

    // TODO handle multiple return values
    COutParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, COutParameter.class, new COutParameter());

    CFunction staticFunction =
        CBridgeComponents.createFunction(
            inParams, baseFunctionName, delegateMethodName, returnParam, STATIC);
    staticFunction.delegateCallInclude.add(
        resolver.resolveInclude(francaMethod, HeaderType.BASE_API_HEADER));
    staticFunction.functionName = CppNameRules.getMethodName(francaMethod.getName());
    return staticFunction;
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(resolver, francaArgument.getType());
    String francaArgumentName = francaArgument.getName();
    List<CParameter> cParams = CBridgeComponents.constructCParameters(francaArgumentName, typeInfo);
    cParams.get(0).conversion =
        TypeConverter.createParamConversionRoutine(francaArgumentName, cParams, typeInfo);
    cParams.forEach(this::storeResult);
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(resolver, francaArgument.getType());
    COutParameter param = new COutParameter("result", typeInfo);
    param.conversion = TypeConverter.createReturnValueConversionRoutine(param.name, typeInfo);
    storeResult(param);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {
    CStruct cStruct =
        new CStruct(
            cBridgeNameRules.getStructRefType(francaStruct),
            cBridgeNameRules.getStructBaseName(francaStruct),
            cBridgeNameRules.getBaseApiStructName(francaStruct),
            CppTypeInfo.createStructTypeInfo(resolver, francaStruct));

    cStruct.fields =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CField.class);

    storeResult(createStructRefTypeDefinition(francaStruct));
    storeResult(CBridgeComponents.createGetPointerFuntion(cStruct, cStruct.baseApiName));
    storeResult(CBridgeComponents.createStructCreateFunction(cStruct));
    storeResult(CBridgeComponents.createStructReleaseFunction(cStruct));
    for (CField field : cStruct.fields) {
      storeResult(CBridgeComponents.createStructFieldGetter(cStruct, field));
      if (field.type.typeCategory != TypeCategory.STRUCT) {
        storeResult(CBridgeComponents.createStructFieldSetter(cStruct, field));
      }
    }
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FField francaField) {
    CField cField =
        new CField(francaField.getName(), CTypeMapper.mapType(resolver, francaField.getType()));
    storeResult(cField);
    super.finishBuilding(francaField);
  }

  private void populateFunctionTableWithMethods(
      CInterface cInterface, CStructTypedef functionTable) {
    for (CFunction function : cInterface.functions) {
      if (function.interfaceMethod) {
        CFunctionPointer functionPointer =
            CFunctionPointer.builder()
                .returnType(function.returnType)
                .parameters(function.parameters)
                .build();
        functionTable.fields.add(new CField(function.name, new CppTypeInfo(functionPointer)));
      }
    }
  }

  private CStructTypedef createInterfaceFunctionTable(FInterface francaInterface) {
    return new CStructTypedef(
        cBridgeNameRules.getFunctionTableName(francaInterface),
        Arrays.asList(
            new CField("swift_pointer", new CppTypeInfo(new CPointerType(CType.VOID))),
            new CField(
                "release",
                new CppTypeInfo(
                    CFunctionPointer.builder()
                        .returnType(CType.VOID)
                        .parameter(new CParameter("swift_pointer", new CPointerType(CType.VOID)))
                        .build()))));
  }

  private CStructTypedef createStructRefTypeDefinition(FStructType francaStruct) {
    CType fieldType = new CPointerType(CType.VOID);
    fieldType.isConst = true;

    return new CStructTypedef(
        cBridgeNameRules.getStructRefType(francaStruct),
        singletonList(new CField("private_pointer", new CppTypeInfo(fieldType))));
  }
}
