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

import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.generator.cbridge.templates.CBridgeHeaderTemplate;
import com.here.ivi.api.generator.cbridge.templates.CBridgeImplementationTemplate;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.franca.Interface;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import navigation.BaseApiSpec;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;

public class CBridgeGenerator {
  private final CBridgeNameRules cBridgeNameRules;

  public CBridgeGenerator(CBridgeNameRules nameRules) {
    this.cBridgeNameRules = nameRules;
  }

  public List<GeneratedFile> generate(Interface<?> iface) {
    CInterface cModel = buildCBridgeModel(iface);
    return Arrays.asList(
        new GeneratedFile(
            CBridgeHeaderTemplate.generate(cModel),
            cBridgeNameRules.getHeaderFileNameWithPath(iface)),
        new GeneratedFile(
            CBridgeImplementationTemplate.generate(cModel),
            cBridgeNameRules.getImplementationFileNameWithPath(iface)));
  }

  CInterface buildCBridgeModel(Interface<?> iface) {
    BaseApiSpec.InterfacePropertyAccessor propertyAccessor = iface.getPropertyAccessor();

    List<CFunction> functions =
        iface
            .getFrancaInterface()
            .getMethods()
            .stream()
            .map(method -> constructFunctionsForFMethod(method, iface, propertyAccessor))
            .flatMap(Collection::stream)
            .collect(toList());

    CInterface cInterface = new CInterface();
    cInterface.functions = functions;
    cInterface.headerIncludes = collectHeaderIncludes(cInterface);
    cInterface.implementationIncludes = collectImplementationIncludes(iface, cInterface);
    return cInterface;
  }

  private List<CFunction> constructFunctionsForFMethod(
      FMethod method, Interface<?> iface, BaseApiSpec.InterfacePropertyAccessor propertyAccessor) {
    List<CFunction> result = new ArrayList<>();
    if (!propertyAccessor.getStatic(method)) {
      return result;
    }
    List<String> inParamNames =
        method.getInArgs().stream().map(FModelElement::getName).collect(Collectors.toList());
    List<CppTypeInfo> mappedInTypes =
        method.getInArgs().stream().map(CTypeMapper::mapType).collect(Collectors.toList());
    List<CppTypeInfo> mappedOutTypes =
        method.getOutArgs().stream().map(CTypeMapper::mapType).collect(Collectors.toList());

    // TODO APIGEN-326: Include parameter types in function names
    String baseFunctionName = cBridgeNameRules.getMethodName(iface, method);
    String delegateMethodName = cBridgeNameRules.getDelegateMethodName(iface, method);
    // TODO handle multiple return values
    CppTypeInfo mappedReturnType =
        mappedOutTypes.stream().findFirst().orElse(new CppTypeInfo(CType.VOID));

    result.add(
        createMainFunction(
            inParamNames, mappedInTypes, baseFunctionName, delegateMethodName, mappedReturnType));

    if (CppTypeInfo.BYTE_VECTOR.equals(mappedReturnType)
        || CppTypeInfo.STRING.equals(mappedReturnType)) {
      result.add(createReleaseFunction(baseFunctionName, mappedReturnType));
      result.add(createGetDataFunction(baseFunctionName, mappedReturnType));
      result.add(createGetLengthFunction(baseFunctionName, mappedReturnType));
    }

    return result;
  }

  private CFunction createMainFunction(
      List<String> paramNames,
      List<CppTypeInfo> types,
      String baseFunctionName,
      String delegateMethodName,
      CppTypeInfo mappedReturnType) {
    CFunction.Builder builder = new CFunction.Builder(baseFunctionName);

    return builder
        .parameters(paramNames, types)
        .returnType(mappedReturnType.functionReturnType)
        .returnConversion(TypeConverter.createReturnValueConversionRoutine(mappedReturnType))
        .delegateCallTemplate(functionCallTemplateForNParams(delegateMethodName, paramNames.size()))
        .build();
  }

  private CFunction createGetLengthFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.VOID_PTR);
    return new CFunction.Builder(baseName + "_" + "getSize")
        .parameters(singletonList(param))
        .conversions(singletonList(TypeConverter.reinterpretCast(param, cppTypeInfo.baseType)))
        .delegateCallTemplate(cppTypeInfo.getSizeExpr)
        .returnType(CType.UINT64)
        .returnConversion(new TypeConverter.TypeConversion("result"))
        .build();
  }

  private CFunction createGetDataFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.VOID_PTR);
    return new CFunction.Builder(baseName + "_" + "getData")
        .parameters(singletonList(param))
        .conversions(singletonList(TypeConverter.reinterpretCast(param, cppTypeInfo.baseType)))
        .delegateCallTemplate(cppTypeInfo.getDataExpr)
        .returnType(new CPointerType(new CType(cppTypeInfo.heldType, cppTypeInfo.heldTypeIncludes)))
        .returnConversion(new TypeConverter.TypeConversion("result"))
        .build();
  }

  private CFunction createReleaseFunction(String baseName, CppTypeInfo cppTypeInfo) {
    CParameter param = new CParameter("handle", CPointerType.VOID_PTR);
    return new CFunction.Builder(baseName + "_" + "release")
        .parameters(singletonList(param))
        .conversions(singletonList(TypeConverter.reinterpretCast(param, cppTypeInfo.baseType)))
        .delegateCallTemplate("delete %1$s")
        .returnType(CType.VOID)
        .build();
  }

  private String functionCallTemplateForNParams(
      String functionName, int numberOfFunctionParameters) {
    StringBuilder builder = new StringBuilder();
    builder.append(functionName);
    builder.append("(");
    List<String> placeHolders =
        IntStream.rangeClosed(1, numberOfFunctionParameters)
            .boxed()
            .map(index -> "%" + index.toString() + "$s")
            .collect(toList());
    ;
    builder.append(String.join(", ", placeHolders));
    builder.append(")");
    return builder.toString();
  }

  private Set<Includes.Include> collectImplementationIncludes(
      Interface<?> iface, CInterface cInterface) {
    Set<Includes.Include> includes = new HashSet<>();
    includes.add(new Includes.InternalPublicInclude(cBridgeNameRules.getHeaderFileName(iface)));
    includes.add(new Includes.SystemInclude(CppNameRules.getHeaderPath(iface)));

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
