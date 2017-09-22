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

import static java.lang.Math.toIntExact;
import static java.util.Collections.singletonList;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CField;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CFunctionPointer;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.CStructTypedef;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
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
    CInterface cInterface = finishBuildingInterfaceOrTypeCollection(francaInterface);

    CStructTypedef functionTable = createInterfaceFunctionTable(francaInterface);
    populateFunctionTableWithMethods(cInterface, functionTable);
    cInterface.structs.add(functionTable);

    storeResult(cInterface);
    closeContext();
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

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {
    CInterface cInterface = finishBuildingInterfaceOrTypeCollection(francaTypeCollection);
    storeResult(cInterface);
    closeContext();
  }

  private CInterface finishBuildingInterfaceOrTypeCollection(FTypeCollection francaTypeCollection) {
    CInterface cInterface = new CInterface();
    cInterface.functions =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CFunction.class);
    cInterface.structs =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CStructTypedef.class);

    cInterface.headerIncludes = collectHeaderIncludes(cInterface);
    cInterface.implementationIncludes = collectImplementationIncludes(cInterface);

    cInterface.implementationIncludes.add(
        resolver.resolveInclude(francaTypeCollection, HeaderType.CBRIDGE_PUBLIC_HEADER));
    cInterface.privateHeaderIncludes = collectPrivateHeaderIncludes(cInterface);
    return cInterface;
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    if (!rootModel.isStatic(francaMethod)) {
      closeContext();
      return;
    }

    // TODO APIGEN-326: Include parameter types in function names
    String baseFunctionName = cBridgeNameRules.getMethodName(francaMethod);
    String delegateMethodName = cBridgeNameRules.getDelegateMethodName(francaMethod);

    List<CInParameter> inParams =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CInParameter.class);

    // TODO handle multiple return values
    COutParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, COutParameter.class, new COutParameter());

    CFunction mainCallFunction =
        createMainFunction(inParams, baseFunctionName, delegateMethodName, returnParam);
    mainCallFunction.delegateCallInclude.add(
        resolver.resolveInclude(francaMethod, HeaderType.BASE_API_HEADER));
    storeResult(mainCallFunction);

    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    CppTypeInfo typeInfo = CTypeMapper.mapType(resolver, francaArgument.getType());
    String francaArgumentName = francaArgument.getName();
    List<CParameter> cParams = constructCParameters(francaArgumentName, typeInfo);
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
    storeResult(createGetPointerFunction(cStruct));
    storeResult(createStructCreateFunction(cStruct));
    storeResult(createStructReleaseFunction(cStruct));
    for (CField field : cStruct.fields) {
      storeResult(createStructFieldGetter(cStruct, field));
      if (field.type.typeCategory != TypeCategory.STRUCT) {
        storeResult(createStructFieldSetter(cStruct, field));
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

  private CStructTypedef createStructRefTypeDefinition(FStructType francaStruct) {
    CType fieldType = new CPointerType(CType.VOID);
    fieldType.isConst = true;

    return new CStructTypedef(
        cBridgeNameRules.getStructRefType(francaStruct),
        singletonList(new CField("private_pointer", new CppTypeInfo(fieldType))));
  }

  private CFunction createGetPointerFunction(CStruct cStruct) {
    CFunction getPointerFunction =
        new CFunction.Builder("get_pointer")
            .parameters(singletonList(new CParameter("handle", cStruct)))
            .returnType(
                new CPointerType(
                    new CType(cStruct.baseApiName, cStruct.mappedType.conversionFromCppIncludes)))
            .markAsInternalOnly()
            .build();

    getPointerFunction.definitionTemplate = "cbridge/getPointer_impl";
    return getPointerFunction;
  }

  private CFunction createStructReleaseFunction(CStruct cStruct) {
    CParameter param = new CParameter("handle", cStruct);
    param.conversion = TypeConverter.identity(param);
    return new CFunction.Builder(cStruct.releaseFunctionName)
        .parameters(singletonList(param))
        .delegateCallTemplate("delete get_pointer(%s)")
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionToCppIncludes))
        .returnType(CType.VOID)
        .build();
  }

  private CFunction createStructCreateFunction(CStruct cStruct) {
    return new CFunction.Builder(cStruct.createFunctionName)
        .delegateCallTemplate(String.format(cStruct.mappedType.returnValueConstrExpr, ""))
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionFromCppIncludes))
        .returnType(cStruct.mappedType.functionReturnType)
        .build();
  }

  private CFunction createStructFieldGetter(CStruct cStruct, CField field) {
    List<CParameter> params = Collections.singletonList(new CParameter("handle", cStruct));
    String delegateCallTemplate =
        TypeCategory.BUILTIN_SIMPLE.equals(field.type.typeCategory)
            ? "get_pointer(%s)->" + field.name
            : field.type.functionReturnType + "{&get_pointer(%s)->" + field.name + "}";
    return new CFunction.Builder(cStruct.getNameOfFieldGetter(field.name))
        .parameters(params)
        .returnType(field.type.functionReturnType)
        .delegateCallTemplate(delegateCallTemplate)
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionToCppIncludes))
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
        .delegateCallIncludes(new LinkedHashSet<>(cStruct.mappedType.conversionToCppIncludes))
        .build();
  }

  private String createCallTemplateForFieldSetter(CField field) {
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

  private static List<CParameter> constructCParameters(String name, CppTypeInfo cppTypeInfo) {
    return IntStream.range(0, cppTypeInfo.cTypesNeededByConstructor.size())
        .boxed()
        .map(
            index ->
                new CInParameter(
                    name + cppTypeInfo.paramSuffixes.get(index),
                    cppTypeInfo.cTypesNeededByConstructor.get(index)))
        .collect(Collectors.toList());
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
        .markAsInterfaceMethod()
        .build();
  }

  private static String functionCallTemplateForNParams(
      String functionName, int numberOfFunctionParameters) {
    return functionName
        + "("
        + String.join(", ", Collections.nCopies(numberOfFunctionParameters, "%s"))
        + ")";
  }

  private Set<Include> collectImplementationIncludes(CInterface cInterface) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CFunction function : cInterface.functions) {
      if (!function.internalOnlyFunction) {
        includes.addAll(collectFunctionSignatureIncludes(function));
        includes.addAll(collectFunctionBodyIncludes(function));
      }
    }
    return includes;
  }

  private Set<Include> collectPrivateHeaderIncludes(CInterface cInterface) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CFunction function : cInterface.functions) {
      if (function.internalOnlyFunction) {
        includes.addAll(collectFunctionSignatureIncludes(function));
        includes.addAll(collectFunctionBodyIncludes(function));
      }
    }
    return includes;
  }

  private Set<Include> collectHeaderIncludes(CInterface cInterface) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CFunction function : cInterface.functions) {
      if (!function.internalOnlyFunction) {
        includes.addAll(collectFunctionSignatureIncludes(function));
      }
    }
    return includes;
  }

  private Set<Include> collectFunctionSignatureIncludes(CFunction function) {
    Set<Include> includes = new LinkedHashSet<>();
    for (CParameter param : function.parameters) {
      includes.addAll(param.type.includes);
    }
    includes.addAll(function.returnType.includes);
    return includes;
  }

  private Set<Include> collectFunctionBodyIncludes(CFunction function) {
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
}
