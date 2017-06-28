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
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.franca.Interface;
import java.util.Arrays;
import java.util.List;
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

  protected CInterface buildCBridgeModel(Interface<BaseApiSpec.InterfacePropertyAccessor> iface) {
    BaseApiSpec.InterfacePropertyAccessor propertyAccessor = iface.getPropertyAccessor();
    CInterface cInterface = new CInterface();
    cInterface.fileName = cBridgeNameRules.getHeaderFileName(iface);
    cInterface.stubHeaderFileName = CppNameRules.getHeaderPath(iface);

    cInterface.functions =
        iface
            .getFrancaInterface()
            .getMethods()
            .stream()
            .map(method -> constructFunction(method, iface, propertyAccessor))
            .collect(toList());
    return cInterface;
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
    CFunction function = new CFunction(cBridgeNameRules.getMethodName(iface, method), parameters);
    function.returnType = CTypeMapper.mappedReturnValue(method);
    function.delegateName = cBridgeNameRules.getDelegateMethodName(iface, method);
    return function;
  }
}
