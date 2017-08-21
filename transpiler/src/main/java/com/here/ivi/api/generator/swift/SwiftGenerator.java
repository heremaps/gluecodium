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

package com.here.ivi.api.generator.swift;

import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.generator.baseapi.StubCommentParser;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.swift.templates.SwiftFileTemplate;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftParameter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import navigation.BaseApiSpec;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;

public class SwiftGenerator {
  private SwiftNameRules nameRules;
  private SwiftIncludeResolver includeResolver;

  public SwiftGenerator(SwiftNameRules rules, SwiftIncludeResolver resolver) {
    nameRules = rules;
    includeResolver = resolver;
  }

  public List<GeneratedFile> generate(Interface<BaseApiSpec.InterfacePropertyAccessor> iface) {
    SwiftClass clazz = buildSwiftModel(iface);
    return singletonList(
        new GeneratedFile(
            SwiftFileTemplate.generate(clazz), nameRules.getImplementationFileName(iface)));
  }

  protected SwiftClass buildSwiftModel(Interface<?> iface) {
    BaseApiSpec.InterfacePropertyAccessor propertyAccessor = iface.getPropertyAccessor();
    FInterface francaInterface = iface.getFrancaInterface();
    String bridgeNameSpace = String.join("_", iface.getModelInfo().getPackageNames());
    SwiftClass clazz = new SwiftClass(nameRules.getClassName(francaInterface));
    String comment = StubCommentParser.parse(francaInterface).getMainBodyText();
    clazz.comment = comment != null ? comment : "";
    clazz.methods =
        francaInterface
            .getMethods()
            .stream()
            .map(method -> constructMethod(method, propertyAccessor))
            .collect(toList());
    clazz.nameSpace = bridgeNameSpace;
    clazz.imports = new ArrayList<>(Arrays.asList("Foundation"));
    return clazz;
  }

  private SwiftMethod constructMethod(
      FMethod francaMethod, BaseApiSpec.InterfacePropertyAccessor propertyAccessor) {
    List<SwiftParameter> parameters =
        francaMethod
            .getInArgs()
            .stream()
            .map(
                param ->
                    new SwiftParameter(
                        nameRules.getParameterName(param), SwiftTypeMapper.mapType(param)))
            .collect(toList());
    SwiftMethod method = new SwiftMethod(nameRules.getMethodName(francaMethod), parameters);
    method.returnType = SwiftTypeMapper.mapReturnValue(francaMethod);
    String comment = StubCommentParser.parse(francaMethod).getMainBodyText();
    method.comment = comment != null ? comment : "";
    Boolean isStatic = propertyAccessor.getStatic(francaMethod);
    method.isStatic = isStatic != null && isStatic;
    return method;
  }
}
