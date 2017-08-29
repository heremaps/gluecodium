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

import static com.here.ivi.api.common.CollectionsHelper.getAllOfType;
import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppCommentParser;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftInParameter;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftModelElement;
import com.here.ivi.api.model.swift.SwiftOutParameter;
import com.here.ivi.api.model.swift.SwiftParameter;
import java.util.ArrayList;
import java.util.List;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;

public class SwiftModelBuilder extends AbstractModelBuilder<SwiftModelElement> {
  private final Interface<?> rootModel;
  private final SwiftNameRules nameRules;

  public SwiftModelBuilder(final Interface<?> rootModel, final SwiftNameRules nameRules) {
    this(rootModel, nameRules, new ModelBuilderContextStack<>());
  }

  public SwiftModelBuilder(
      Interface<?> rootModel,
      SwiftNameRules nameRules,
      ModelBuilderContextStack<SwiftModelElement> contextStack) {
    super(contextStack);
    this.rootModel = rootModel;
    this.nameRules = nameRules;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    SwiftClass clazz = new SwiftClass(nameRules.getClassName(francaInterface));
    String comment = CppCommentParser.parse(francaInterface).getMainBodyText();
    clazz.comment = comment != null ? comment : "";
    clazz.methods = getAllOfType(getCurrentContext().previousResults, SwiftMethod.class);
    clazz.nameSpace = String.join("_", rootModel.getModelInfo().getPackageNames());
    clazz.imports = new ArrayList<>(singletonList("Foundation"));

    storeResult(clazz);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    storeResult(
        new SwiftInParameter(
            nameRules.getParameterName(francaArgument), SwiftTypeMapper.mapType(francaArgument)));
    super.finishBuildingInputArgument(francaArgument);
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    storeResult(
        new SwiftOutParameter(
            nameRules.getParameterName(francaArgument), SwiftTypeMapper.mapType(francaArgument)));
    super.finishBuildingOutputArgument(francaArgument);
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    List<SwiftParameter> inParams =
        getAllOfType(getCurrentContext().previousResults, SwiftInParameter.class)
            .stream()
            .map(SwiftParameter.class::cast)
            .collect(toList());
    SwiftMethod method = new SwiftMethod(nameRules.getMethodName(francaMethod), inParams);

    // TODO: APIGEN-471 - handle multiple return values
    SwiftParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, SwiftOutParameter.class, new SwiftOutParameter());
    method.returnType = returnParam.type;
    String comment = CppCommentParser.parse(francaMethod).getMainBodyText();
    method.comment = comment != null ? comment : "";
    Boolean isStatic = rootModel.getPropertyAccessor().getStatic(francaMethod);
    method.isStatic = isStatic != null && isStatic;
    storeResult(method);
    super.finishBuilding(francaMethod);
  }
}
