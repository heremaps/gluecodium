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

import static com.here.ivi.api.generator.cbridge.TypeConverter.createParamConversionRoutine;
import static java.lang.Math.toIntExact;
import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.franca.Interface;
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
        getCurrentContext()
            .previousResults
            .stream()
            .filter(CFunction.class::isInstance)
            .map(CFunction.class::cast)
            .collect(toList());
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

    List<CParameter> inParams =
        getCurrentContext()
            .previousResults
            .stream()
            .filter(CInParameter.class::isInstance)
            .map(CParameter.class::cast)
            .collect(toList());
    // TODO handle multiple return values
    COutParameter returnParam =
        getCurrentContext()
            .previousResults
            .stream()
            .filter(COutParameter.class::isInstance)
            .map(COutParameter.class::cast)
            .findFirst()
            .orElse(new COutParameter());
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
    CppTypeInfo typeInfo = CTypeMapper.mapType(francaArgument);
    String francaArgumentName = francaArgument.getName();
    List<CParameter> cParams =
        IntStream.range(0, typeInfo.cTypesNeededByConstructor.size())
            .boxed()
            .map(
                index ->
                    new CInParameter(
                        francaArgumentName + typeInfo.paramSuffixes.get(index),
                        typeInfo.cTypesNeededByConstructor.get(index)))
            .collect(toList());
    cParams.get(0).conversion = createParamConversionRoutine(francaArgumentName, cParams, typeInfo);
    cParams.forEach(this::storeResult);
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(francaArgument);
    COutParameter param = new COutParameter("result", typeInfo);
    param.conversion = TypeConverter.createReturnValueConversionRoutine(param.name, typeInfo);
    storeResult(param);
    closeContext();
  }

  private CFunction createGetLengthFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.VOID_PTR);
    param.conversion = TypeConverter.reinterpretCast(param, cppTypeInfo.baseType);
    return new CFunction.Builder(baseName + "_" + "getSize")
        .parameters(singletonList(param))
        .delegateCallTemplate(cppTypeInfo.getSizeExpr)
        .returnType(CType.UINT64)
        .returnConversion(new TypeConverter.TypeConversion("result"))
        .build();
  }

  private CFunction createGetDataFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.VOID_PTR);
    param.conversion = TypeConverter.reinterpretCast(param, cppTypeInfo.baseType);
    return new CFunction.Builder(baseName + "_" + "getData")
        .parameters(singletonList(param))
        .delegateCallTemplate(cppTypeInfo.getDataExpr)
        .returnType(new CPointerType(new CType(cppTypeInfo.heldType, cppTypeInfo.heldTypeIncludes)))
        .returnConversion(new TypeConverter.TypeConversion("result"))
        .build();
  }

  private CFunction createReleaseFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.VOID_PTR);
    param.conversion = TypeConverter.reinterpretCast(param, cppTypeInfo.baseType);
    return new CFunction.Builder(baseName + "_" + "release")
        .parameters(singletonList(param))
        .delegateCallTemplate("delete %1$s")
        .returnType(CType.VOID)
        .build();
  }

  private CFunction createMainFunction(
      List<CParameter> params,
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

  private Set<Includes.Include> collectImplementationIncludes(CInterface cInterface) {
    Set<Includes.Include> includes = new HashSet<>();
    includes.add(new Includes.InternalPublicInclude(cBridgeNameRules.getHeaderFileName(rootModel)));
    includes.add(new Includes.SystemInclude(CppNameRules.getHeaderPath(rootModel)));

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

  private Set<Includes.Include> collectHeaderIncludes(CInterface cInterface) {
    Set<Includes.Include> includes = new HashSet<>();

    for (CFunction function : cInterface.functions) {
      for (CParameter param : function.parameters) {
        includes.addAll(param.type.includes);
      }
      includes.addAll(function.returnType.includes);
    }
    return includes;
  }
}
