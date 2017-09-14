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

import static com.here.ivi.api.model.cmodel.CFunction.FunctionMember.*;
import static java.lang.Math.toIntExact;
import static java.util.Collections.singletonList;

import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.common.Include;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CBridgeComponents {

  // CFunction Helpers

  public static CFunction createFunction(
      List<CInParameter> params,
      String baseFunctionName,
      String delegateMethodName,
      CParameter returnValue,
      CFunction.FunctionMember type) {

    int providedConversions =
        toIntExact(params.stream().map(param -> param.conversion).filter(Objects::nonNull).count());
    int numberOfPlaceholders;
    if (type == INSTANCE) {
      numberOfPlaceholders = providedConversions > 1 ? providedConversions : params.size() - 1;
    } else {

      numberOfPlaceholders = providedConversions > 0 ? providedConversions : params.size();
    }

    CFunction function =
        new CFunction.Builder(baseFunctionName)
            .parameters(params)
            .returnType(returnValue.type)
            .returnConversion(returnValue.conversion)
            .delegateCallTemplate(
                CBridgeComponents.functionCallTemplateForNParams(
                    delegateMethodName, numberOfPlaceholders))
            .functionMember(type)
            .build();
    function.interfaceMethod = true;
    return function;
  }

  public static CFunction createStructReleaseFunction(CStruct cStruct) {
    CParameter param = new CParameter("handle", cStruct);
    return new CFunction.Builder(cStruct.releaseFunctionName)
        .parameters(singletonList(param))
        .delegateCallTemplate("delete get_pointer(%s)")
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionToCppIncludes))
        .returnType(CType.VOID)
        .build();
  }

  public static CFunction createStructCreateFunction(CStruct cStruct) {
    return new CFunction.Builder(cStruct.createFunctionName)
        .delegateCallTemplate(String.format(cStruct.mappedType.returnValueConstrExpr, ""))
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionFromCppIncludes))
        .returnType(cStruct.mappedType.functionReturnType)
        .build();
  }

  public static CFunction createStructFieldGetter(CStruct cStruct, CField field) {
    List<CParameter> params = Collections.singletonList(new CParameter("handle", cStruct));
    String delegateCallTemplate =
        CppTypeInfo.TypeCategory.BUILTIN_SIMPLE.equals(field.type.typeCategory)
            ? "get_pointer(%s)->" + field.name
            : field.type.functionReturnType + "{&get_pointer(%s)->" + field.name + "}";
    return new CFunction.Builder(cStruct.getNameOfFieldGetter(field.name))
        .parameters(params)
        .returnType(field.type.functionReturnType)
        .delegateCallTemplate(delegateCallTemplate)
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionToCppIncludes))
        .build();
  }

  public static CFunction createStructFieldSetter(CStruct cStruct, CField field) {
    List<CParameter> params = new ArrayList<>();
    CParameter handle = new CParameter("handle", cStruct);
    List<CParameter> setterParams = constructCParameters(field.name, field.type);
    params.add(handle);
    params.addAll(setterParams);
    return new CFunction.Builder(cStruct.getNameOfFieldSetter(field.name))
        .parameters(params)
        .delegateCallTemplate(createCallTemplateForFieldSetter(field))
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionToCppIncludes))
        .build();
  }

  // Get pointer function

  public static CFunction createGetPointerFuntion(final CStruct cStruct, String returnValue) {

    return new CFunction.Builder("get_pointer")
        .parameters(singletonList(new CParameter("handle", new CType(cStruct.name))))
        .returnType(
            new CPointerType(new CType(returnValue, cStruct.mappedType.conversionFromCppIncludes)))
        .markAsInternalOnly()
        .functionMember(POINTER)
        .build();
  }

  // Include collectors

  public static Set<Include> collectImplementationIncludes(CInterface cInterface) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CFunction function : cInterface.functions) {
      if (!function.internalOnlyFunction) {
        includes.addAll(collectFunctionSignatureIncludes(function));
        includes.addAll(collectFunctionBodyIncludes(function));
      }
    }
    return includes;
  }

  public static Set<Include> collectPrivateHeaderIncludes(CInterface cInterface) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CFunction function : cInterface.functions) {
      if (function.internalOnlyFunction) {
        includes.addAll(collectFunctionSignatureIncludes(function));
        includes.addAll(collectFunctionBodyIncludes(function));
      }
    }
    return includes;
  }

  public static Set<Include> collectHeaderIncludes(CInterface cInterface) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CFunction function : cInterface.functions) {
      if (!function.internalOnlyFunction) {
        includes.addAll(collectFunctionSignatureIncludes(function));
      }
    }
    return includes;
  }

  public static Set<Include> collectFunctionSignatureIncludes(CFunction function) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CParameter param : function.parameters) {
      includes.addAll(param.type.includes);
    }
    includes.addAll(function.returnType.includes);
    return includes;
  }

  public static Set<Include> collectFunctionBodyIncludes(CFunction function) {
    Set<Include> includes = new LinkedHashSet<>();
    for (TypeConverter.TypeConversion conversion : function.conversions) {
      includes.addAll(conversion.includes);
    }
    if (function.returnConversion != null) {
      includes.addAll(function.returnConversion.includes);
    }
    includes.addAll(function.delegateCallInclude);
    return includes;
  }

  public static String createCallTemplateForFieldSetter(CField field) {
    StringBuilder template = new StringBuilder();
    template.append("get_pointer(%1$s)->").append(field.name);
    switch (field.type.typeCategory) {
      case BUILTIN_BYTEBUFFER:
        template.append(".assign(%2$s, %2$s + %3$s)");
        break;
      case BUILTIN_STRING:
        template.append(".assign(%2$s)");
        break;
      default:
        template.append(" =  %2$s");
        break;
    }
    return template.toString();
  }

  // Helpers

  public static List<CParameter> constructCParameters(String name, CppTypeInfo cppTypeInfo) {
    return IntStream.range(0, cppTypeInfo.cTypesNeededByConstructor.size())
        .boxed()
        .map(
            index ->
                new CInParameter(
                    name + cppTypeInfo.paramSuffixes.get(index),
                    cppTypeInfo.cTypesNeededByConstructor.get(index)))
        .collect(Collectors.toList());
  }

  public static String functionCallTemplateForNParams(
      String functionName, int numberOfFunctionParameters) {
    return functionName
        + "("
        + String.join(", ", Collections.nCopies(numberOfFunctionParameters, "%s"))
        + ")";
  }
}
