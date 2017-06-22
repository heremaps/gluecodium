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

import static java.util.stream.Collectors.toList;

import com.here.ivi.api.generator.cbridge.templates.CBridgeHeaderTemplate;
import com.here.ivi.api.generator.cbridge.templates.CBridgeImplementationTemplate;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.franca.Interface;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import navigation.BaseApiSpec;
import org.franca.core.franca.FMethod;

public class CBridgeGenerator {
  private final CBridgeNameRules cBridgeNameRules;

  public CBridgeGenerator(CBridgeNameRules nameRules) {
    this.cBridgeNameRules = nameRules;
  }

  public List<GeneratedFile> generate(Interface<BaseApiSpec.InterfacePropertyAccessor> iface) {
    CInterface cModel = buildCBridgeModel(iface);
    return Arrays.asList(
        new GeneratedFile(
            CBridgeHeaderTemplate.generate(cModel),
            cBridgeNameRules.getHeaderFileNameWithPath(iface)),
        new GeneratedFile(
            CBridgeImplementationTemplate.generate(cModel),
            cBridgeNameRules.getImplementationFileNameWithPath(iface)));
  }

  protected CInterface buildCBridgeModel(Interface<?> iface) {
    BaseApiSpec.InterfacePropertyAccessor propertyAccessor = iface.getPropertyAccessor();
    CInterface cInterface = new CInterface();
    cInterface.functions =
        iface
            .getFrancaInterface()
            .getMethods()
            .stream()
            .map(method -> constructFunction(method, iface, propertyAccessor))
            .collect(toList());

    cInterface.headerIncludes = collectHeaderIncludes(cInterface);
    cInterface.implementationIncludes = collectImplementationIncludes(iface, cInterface);
    return cInterface;
  }

  private Set<Includes.Include> collectImplementationIncludes(
      Interface<?> iface, CInterface cInterface) {
    Set<Includes.Include> includes = new HashSet<>();
    includes.add(new Includes.InternalPublicInclude(cBridgeNameRules.getHeaderFileName(iface)));
    includes.add(new Includes.InternalPublicInclude(CppNameRules.getHeaderPath(iface)));

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

  private CFunction constructFunction(
      FMethod method, Interface<?> iface, BaseApiSpec.InterfacePropertyAccessor propertyAccessor) {
    List<CParameter> parameters =
        method
            .getInArgs()
            .stream()
            .map(
                param ->
                    new CParameter(
                        cBridgeNameRules.getParameterName(param), CTypeMapper.mappedType(param)))
            .collect(toList());
    String functionName = cBridgeNameRules.getMethodName(iface, method);
    CType returnType = CTypeMapper.mappedReturnValue(method);
    CFunction function = new CFunction(functionName, returnType, parameters);
    function.delegateName = cBridgeNameRules.getDelegateMethodName(iface, method);
    return function;
  }
}
