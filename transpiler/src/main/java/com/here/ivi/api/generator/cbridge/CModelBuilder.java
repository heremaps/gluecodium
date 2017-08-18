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

import static com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory.STRUCT;
import static com.here.ivi.api.generator.cbridge.TypeConverter.createParamConversionRoutine;
import static java.lang.Math.toIntExact;
import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CField;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.Interface;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.IntStream;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypedElement;

public class CModelBuilder extends AbstractModelBuilder<CElement> {

  private final CBridgeNameRules cBridgeNameRules;
  private final Interface<?> rootModel;

  public CModelBuilder(final Interface<?> rootModel) {
    super(new ModelBuilderContextStack<>());
    cBridgeNameRules = new CBridgeNameRules();
    this.rootModel = rootModel;
  }

  CModelBuilder(
      Interface<BaseApiSpec.InterfacePropertyAccessor> rootModel,
      CBridgeNameRules nameRules,
      ModelBuilderContextStack<CElement> contextStack) {
    super(contextStack);
    cBridgeNameRules = nameRules;
    this.rootModel = rootModel;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    CInterface cInterface = new CInterface();
    cInterface.functions =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CFunction.class);
    cInterface.structs =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CStruct.class);

    cInterface.headerIncludes = collectHeaderIncludes(cInterface);
    cInterface.implementationIncludes = collectImplementationIncludes(cInterface);
    storeResult(cInterface);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    if (!rootModel.getPropertyAccessor().getStatic(francaMethod)) {
      closeContext();
      return;
    }

    // TODO APIGEN-326: Include parameter types in function names
    String baseFunctionName = cBridgeNameRules.getMethodName(rootModel, francaMethod);
    String delegateMethodName = cBridgeNameRules.getDelegateMethodName(rootModel, francaMethod);

    List<CInParameter> inParams =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CInParameter.class);

    // TODO handle multiple return values
    COutParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, COutParameter.class, new COutParameter());

    CFunction mainCallFunction =
        createMainFunction(inParams, baseFunctionName, delegateMethodName, returnParam);

    storeResult(mainCallFunction);

    if (CppTypeInfo.BYTE_VECTOR.equals(returnParam.mappedType)
        || CppTypeInfo.STRING.equals(returnParam.mappedType)) {
      storeResult(createReleaseFunction(baseFunctionName, returnParam.mappedType));
      storeResult(createGetDataFunction(baseFunctionName, returnParam.mappedType));
      storeResult(createGetLengthFunction(baseFunctionName, returnParam.mappedType));
    }

    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(rootModel, francaArgument.getType());
    String francaArgumentName = francaArgument.getName();
    List<CParameter> cParams = constructCParameters(francaArgumentName, typeInfo);
    cParams.get(0).conversion = createParamConversionRoutine(francaArgumentName, cParams, typeInfo);
    cParams.forEach(this::storeResult);
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(rootModel, francaArgument.getType());
    COutParameter param = new COutParameter("result", typeInfo);
    param.conversion = TypeConverter.createReturnValueConversionRoutine(param.name, typeInfo);
    storeResult(param);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {
    CStruct cStruct =
        new CStruct(
            cBridgeNameRules.getStructName(rootModel, francaStruct),
            cBridgeNameRules.getStructBaseName(rootModel, francaStruct),
            cBridgeNameRules.getBaseApiStructName(rootModel, francaStruct),
            CppTypeInfo.createStructTypeInfo(rootModel, francaStruct));

    cStruct.fields =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CField.class);

    storeResult(cStruct);
    storeResult(createGetPointerFunction(cStruct.name, cStruct.baseApiName));
    storeResult(createStructCreateFunction(cStruct));
    storeResult(createStructReleaseFunction(cStruct));
    for (CField field : cStruct.fields) {
      storeResult(createStructFieldGetter(cStruct, field));
      if (field.type.typeCategory != STRUCT) {
        storeResult(createStructFieldSetter(cStruct, field));
      }
    }
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FTypedElement francaTypedElement) {
    CField cField =
        new CField(
            francaTypedElement.getName(),
            CTypeMapper.mapType(rootModel, francaTypedElement.getType()));
    storeResult(cField);
    super.finishBuilding(francaTypedElement);
  }

  private CFunction createGetPointerFunction(String cName, String cppName) {
    CFunction getPointerFunction =
        new CFunction.Builder("get_pointer")
            .parameters(singletonList(new CParameter("handle", new CType(cName))))
            .returnType(new CType(cppName))
            .build();
    getPointerFunction.declarationTemplate = null;
    getPointerFunction.definitionTemplate = "cbridge/getPointer_impl";
    return getPointerFunction;
  }

  private CFunction createStructReleaseFunction(CStruct cStruct) {
    CParameter param = new CParameter("handle", cStruct);
    param.conversion = TypeConverter.identity(param);
    return new CFunction.Builder(cStruct.releaseFunctionName)
        .parameters(singletonList(param))
        .delegateCallTemplate("delete get_pointer(%s)")
        .returnType(CType.VOID)
        .build();
  }

  private CFunction createStructCreateFunction(CStruct cStruct) {
    return new CFunction.Builder(cStruct.createFunctionName)
        .delegateCallTemplate(String.format(cStruct.mappedType.returnValueConstrExpr, ""))
        .returnType(cStruct.mappedType.functionReturnType)
        .build();
  }

  private CFunction createStructFieldGetter(CStruct cStruct, CField field) {
    List<CParameter> params = Collections.singletonList(new CParameter("handle", cStruct));
    return new CFunction.Builder(cStruct.getNameOfFieldGetter(field.name))
        .parameters(params)
        .returnType(field.type.functionReturnType)
        .delegateCallTemplate("get_pointer(%s)->" + field.name)
        .build();
  }

  private CFunction createStructFieldSetter(CStruct cStruct, CField field) {
    List<CParameter> params = new ArrayList<>();
    CParameter handle = new CParameter("handle", cStruct);
    List<CParameter> setterParams = constructCParameters(field.name, field.type);
    params.add(handle);
    params.addAll(setterParams);
    return new CFunction.Builder(cStruct.getNameOfFieldSetter(field.name))
        .parameters(params)
        .delegateCallTemplate(createCallTemplateForFieldSetter(field))
        .build();
  }

  private String createCallTemplateForFieldSetter(CField field) {
    StringBuilder template = new StringBuilder();
    template.append("get_pointer(%1$s)->");
    template.append(field.name);
    switch (field.type.typeCategory) {
      case BUILTIN_BYTEBUFFER:
        template.append(".assign(%2$s, %2$s + %3$s)");
        break;
      case BUILTIN_STRING:
        template.append(".assign(%2$s)");
        break;
      default:
        template.append(" =  %2$s");
    }
    return template.toString();
  }

  private static List<CParameter> constructCParameters(String name, CppTypeInfo cppTypeInfo) {
    return IntStream.range(0, cppTypeInfo.cTypesNeededByConstructor.size())
        .boxed()
        .map(
            index ->
                new CInParameter(
                    name + cppTypeInfo.paramSuffixes.get(index),
                    cppTypeInfo.cTypesNeededByConstructor.get(index)))
        .collect(toList());
  }

  private CFunction createGetLengthFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.CONST_VOID_PTR);
    param.conversion = TypeConverter.reinterpretCast(param, cppTypeInfo.baseType);
    return new CFunction.Builder(baseName + "_" + "getSize")
        .parameters(singletonList(param))
        .delegateCallTemplate(cppTypeInfo.getSizeExpr)
        .returnType(CType.INT64)
        .returnConversion(new TypeConverter.TypeConversion("result"))
        .build();
  }

  private CFunction createGetDataFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.CONST_VOID_PTR);
    param.conversion = TypeConverter.reinterpretCast(param, cppTypeInfo.baseType);
    return new CFunction.Builder(baseName + "_" + "getData")
        .parameters(singletonList(param))
        .delegateCallTemplate(cppTypeInfo.getDataExpr)
        .returnType(
            CPointerType.makeConstPointer(
                new CType(cppTypeInfo.heldType, cppTypeInfo.heldTypeIncludes)))
        .returnConversion(new TypeConverter.TypeConversion("result"))
        .build();
  }

  private CFunction createReleaseFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.CONST_VOID_PTR);
    param.conversion = TypeConverter.reinterpretCast(param, cppTypeInfo.baseType);
    return new CFunction.Builder(baseName + "_" + "release")
        .parameters(singletonList(param))
        .delegateCallTemplate("delete %1$s")
        .returnType(CType.VOID)
        .build();
  }

  private CFunction createMainFunction(
      List<CInParameter> params,
      String baseFunctionName,
      String delegateMethodName,
      CParameter returnValue) {

    int providedConversions =
        toIntExact(params.stream().map(param -> param.conversion).filter(Objects::nonNull).count());
    int numberOfPlaceholders = providedConversions > 0 ? providedConversions : params.size();

    return new CFunction.Builder(baseFunctionName)
        .parameters(params)
        .returnType(returnValue.type)
        .returnConversion(returnValue.conversion)
        .delegateCallTemplate(
            functionCallTemplateForNParams(delegateMethodName, numberOfPlaceholders))
        .build();
  }

  private String functionCallTemplateForNParams(
      String functionName, int numberOfFunctionParameters) {
    return new StringBuilder()
        .append(functionName)
        .append("(")
        .append(String.join(", ", Collections.nCopies(numberOfFunctionParameters, "%s")))
        .append(")")
        .toString();
  }

  private Set<Include> collectImplementationIncludes(CInterface cInterface) {
    Set<Include> includes = new HashSet<>();
    includes.add(Include.createInternalInclude(cBridgeNameRules.getHeaderFileName(rootModel)));
    includes.add(Include.createSystemInclude(CppNameRules.getHeaderPath(rootModel)));

    for (CFunction function : cInterface.functions) {
      for (TypeConverter.TypeConversion conversion : function.conversions) {
        includes.addAll(conversion.includes);
      }
      if (function.returnConversion != null) {
        includes.addAll(function.returnConversion.includes);
      }
    }

    includes.removeAll(cInterface.headerIncludes);
    return includes;
  }

  private Set<Include> collectHeaderIncludes(CInterface cInterface) {
    Set<Include> includes = new HashSet<>();

    for (CFunction function : cInterface.functions) {
      for (CParameter param : function.parameters) {
        includes.addAll(param.type.includes);
      }
      includes.addAll(function.returnType.includes);
    }
    return includes;
  }
}
