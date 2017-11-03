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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppCommentParser;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.rules.InstanceRules;
import com.here.ivi.api.model.swift.*;
import com.here.ivi.api.model.swift.SwiftType.TypeCategory;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.franca.core.franca.*;

public class SwiftModelBuilder extends AbstractModelBuilder<SwiftModelElement> {
  public Map<String, SwiftArray> arraysCollector = new HashMap<>();

  private final FrancaDeploymentModel deploymentModel;

  public SwiftModelBuilder(final FrancaDeploymentModel deploymentModel) {
    this(new ModelBuilderContextStack<>(), deploymentModel);
  }

  @VisibleForTesting
  SwiftModelBuilder(
      final ModelBuilderContextStack<SwiftModelElement> contextStack,
      final FrancaDeploymentModel deploymentModel) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
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
    SwiftFile file = new SwiftFile();
    SwiftClass clazz = new SwiftClass(SwiftNameRules.getClassName(francaInterface));
    String comment = CppCommentParser.parse(francaInterface).getMainBodyText();
    clazz.comment = comment != null ? comment : "";
    clazz.properties = getPreviousResults(SwiftProperty.class);
    clazz.nameSpace = String.join("_", DefinedBy.getPackages(francaInterface));
    clazz.typedefs = getPreviousResults(SwiftTypeDef.class);
    clazz.cInstance = CBridgeNameRules.getInterfaceName(francaInterface);

    if (deploymentModel.isInterface(francaInterface)) {
      // Instantiable Franca interface implemented as Swift protocol
      clazz.isInterface = true;
      clazz.cInstanceRef = CBridgeNameRules.getInstanceRefType(francaInterface);
      clazz.implementsProtocols = Collections.singletonList(clazz.name);
      file.structs = getPreviousResults(SwiftContainerType.class);
      file.enums = getPreviousResults(SwiftEnum.class);

      // TODO: APIGEN-868 validator should fail when static methods are defined in a interface
      clazz.methods =
          getPreviousResults(SwiftMethod.class)
              .stream()
              .filter(swiftMethod -> !swiftMethod.isStatic)
              .collect(toList());
    } else {
      addStructsEnumsMethods(clazz);
      clazz.cInstanceRef =
          clazz.properties.isEmpty() && hasOnlyStaticMethods(getPreviousResults(SwiftMethod.class))
              // Non instantiable Franca interface (static methods only)
              // TODO APIGEN-893: it should always be instantiable
              ? null
              // Instantiable Franca interface implemented as Swift class
              : CBridgeNameRules.getInstanceRefType(francaInterface);
    }

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

  @Override
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
        new SwiftField(
            SwiftNameRules.getFieldName(francaField.getName()), getPreviousResult(SwiftType.class));
    storeResult(structField);
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    storeResult(
        new SwiftInParameter(
            SwiftNameRules.getParameterName(francaArgument), getPreviousResult(SwiftType.class)));
    super.finishBuildingInputArgument(francaArgument);
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    SwiftType swiftType = getPreviousResult(SwiftType.class);
    if (swiftType.category == TypeCategory.STRUCT
        || swiftType.category == TypeCategory.BUILTIN_STRING) {
      swiftType.optional = true;
    }
    storeResult(new SwiftOutParameter(SwiftNameRules.getParameterName(francaArgument), swiftType));
    super.finishBuildingOutputArgument(francaArgument);
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {
    if (!InstanceRules.isInstanceId(francaTypeDef)) {
      SwiftTypeDef typedefValue =
          new SwiftTypeDef(francaTypeDef.getName(), getPreviousResult(SwiftType.class));
      storeResult(typedefValue);
    }

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
    method.isStatic = deploymentModel.isStatic(francaMethod);
    method.cBaseName = CBridgeNameRules.getMethodName(francaMethod);
    storeResult(method);
    super.finishBuilding(francaMethod);
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {
    SwiftType swiftType =
        SwiftTypeMapper.mapTypeWithDeploymentModel(francaTypeRef, deploymentModel);
    if (swiftType instanceof SwiftArray) {
      SwiftArray array = (SwiftArray) swiftType;
      arraysCollector.put(array.underlyingType.name, array);
    }

    storeResult(swiftType);
    super.finishBuilding(francaTypeRef);
  }

  @Override
  public void finishBuilding(FAttribute attribute) {
    SwiftProperty property =
        new SwiftProperty(
            SwiftNameRules.getPropertyName(attribute),
            getPreviousResult(SwiftType.class),
            attribute.isReadonly(),
            SwiftNameRules.getAccessorBaseName(attribute));

    storeResult(property);
    super.finishBuilding(attribute);
  }

  @Override
  public void finishBuilding(FArrayType francaArray) {
    SwiftType innerType =
        SwiftTypeMapper.mapTypeWithDeploymentModel(
            (FTypeRef) francaArray.getElementType(), deploymentModel);
    SwiftArray arrayType = SwiftArrayMapper.create(innerType, francaArray);
    arraysCollector.put(innerType.name, arrayType);
    super.finishBuilding(francaArray);
  }

  @VisibleForTesting
  static boolean hasOnlyStaticMethods(final List<SwiftMethod> methods) {
    return !methods.isEmpty() && methods.stream().allMatch(swiftMethod -> swiftMethod.isStatic);
  }

  private void addStructsEnumsMethods(SwiftClass clazz) {
    clazz.structs = getPreviousResults(SwiftContainerType.class);
    clazz.enums = getPreviousResults(SwiftEnum.class);
    clazz.methods = getPreviousResults(SwiftMethod.class);
  }
}
