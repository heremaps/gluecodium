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

import static java.util.stream.Collectors.toList;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppCommentParser;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.swift.*;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.*;

public class SwiftModelBuilder extends AbstractModelBuilder<SwiftModelElement> {
  private final FrancaElement rootModel;

  public SwiftModelBuilder(final FrancaElement rootModel) {
    this(rootModel, new ModelBuilderContextStack<>());
  }

  public SwiftModelBuilder(
      FrancaElement rootModel, ModelBuilderContextStack<SwiftModelElement> contextStack) {
    super(contextStack);
    this.rootModel = rootModel;
  }

  @Override
  public void finishBuilding(FTypeCollection typeCollection) {
    SwiftFile file = new SwiftFile();
    file.structs.addAll(getPreviousResults(SwiftContainerType.class));
    file.enums.addAll(getPreviousResults(SwiftEnum.class));
    file.typeDefs = getPreviousResults(SwiftTypeDef.class);
    storeResult(file);
    super.finishBuilding(typeCollection);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    SwiftClass clazz = new SwiftClass(SwiftNameRules.getClassName(francaInterface));
    String comment = CppCommentParser.parse(francaInterface).getMainBodyText();
    clazz.comment = comment != null ? comment : "";
    clazz.methods = getPreviousResults(SwiftMethod.class);
    clazz.nameSpace = String.join("_", rootModel.getPackageNames());
    clazz.typedefs =
        getPreviousResults(SwiftTypeDef.class)
            .stream()
            .filter(s -> !s.name.equals(clazz.name))
            .collect(toList());

    clazz.structs = getPreviousResults(SwiftContainerType.class);
    clazz.enums = getPreviousResults(SwiftEnum.class);
    clazz.cInstance = CBridgeNameRules.getInterfaceName(francaInterface);
    if (!clazz.isStatic()) {
      clazz.implementsProtocols = Collections.singletonList(clazz.name);
      clazz.cInstanceRef = CBridgeNameRules.getInstanceRefType(rootModel.getFrancaTypeCollection());
    }
    SwiftFile file = new SwiftFile();
    file.classes.add(clazz);
    storeResult(file);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {
    SwiftContainerType swiftStruct =
        new SwiftContainerType(SwiftNameRules.getStructName(francaStruct.getName()));
    String comment = CppCommentParser.parse(francaStruct).getMainBodyText();
    swiftStruct.comment = comment != null ? comment : "";
    swiftStruct.fields = getPreviousResults(SwiftField.class);
    swiftStruct.cPrefix = CBridgeNameRules.getStructBaseName(francaStruct);
    swiftStruct.cType = CBridgeNameRules.getStructRefType(francaStruct);

    storeResult(swiftStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {
    String comment = CppCommentParser.parse(francaEnumerationType).getMainBodyText();
    List<SwiftEnumItem> enumItems =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, SwiftEnumItem.class);
    storeResult(
        SwiftEnum.builder(SwiftNameRules.getEnumTypeName(francaEnumerationType))
            .comment(comment)
            .items(enumItems)
            .build());
    super.finishBuilding(francaEnumerationType);
  }

  public void finishBuilding(FEnumerator enumerator) {
    String comment = CppCommentParser.parse(enumerator).getMainBodyText();
    SwiftValue value =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, SwiftValue.class);
    storeResult(
        SwiftEnumItem.builder(SwiftNameRules.getEnumItemName(enumerator))
            .comment(comment)
            .value(value)
            .build());
    super.finishBuilding(enumerator);
  }

  @Override
  public void finishBuilding(FExpression expression) {
    storeResult(SwiftTypeMapper.mapType(expression));
    super.finishBuilding(expression);
  }

  @Override
  public void finishBuilding(FField francaField) {
    SwiftField structField =
        new SwiftField(francaField.getName(), SwiftTypeMapper.mapType(francaField.getType()));
    storeResult(structField);
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    storeResult(
        new SwiftInParameter(
            SwiftNameRules.getParameterName(francaArgument),
            SwiftTypeMapper.mapType(francaArgument.getType())));
    super.finishBuildingInputArgument(francaArgument);
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    storeResult(
        new SwiftOutParameter(
            SwiftNameRules.getParameterName(francaArgument),
            SwiftTypeMapper.mapOutputType(francaArgument.getType())));
    super.finishBuildingOutputArgument(francaArgument);
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {
    SwiftTypeDef typedefValue =
        new SwiftTypeDef(
            francaTypeDef.getName(), SwiftTypeMapper.mapType(francaTypeDef.getActualType()));
    storeResult(typedefValue);
    super.finishBuilding(francaTypeDef);
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    List<SwiftParameter> inParams =
        getPreviousResults(SwiftInParameter.class)
            .stream()
            .map(SwiftParameter.class::cast)
            .collect(toList());
    SwiftMethod method = new SwiftMethod(SwiftNameRules.getMethodName(francaMethod), inParams);

    // TODO: APIGEN-471 - handle multiple return values
    SwiftParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, SwiftOutParameter.class, new SwiftOutParameter());
    method.returnType = returnParam.type;
    String comment = CppCommentParser.parse(francaMethod).getMainBodyText();
    method.comment = comment != null ? comment : "";
    method.isStatic = rootModel.isStatic(francaMethod);
    method.cBaseName = CBridgeNameRules.getMethodName(francaMethod);
    storeResult(method);
    super.finishBuilding(francaMethod);
  }
}
