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
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.PlatformUnsupportedFeatures;
import com.here.ivi.api.generator.cpp.CppCommentParser;
import com.here.ivi.api.model.common.InstanceRules;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.swift.*;
import com.here.ivi.api.model.swift.SwiftType.TypeCategory;
import java.util.*;
import org.franca.core.franca.*;

public class SwiftModelBuilder extends AbstractModelBuilder<SwiftModelElement> {

  public final Map<String, SwiftArray> arraysCollector = new HashMap<>();
  public final Set<String> enumsAsErrors = new HashSet<>();

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
    file.typeDefs.addAll(getPreviousResults(SwiftTypeDef.class));
    storeResult(file);
    super.finishBuilding(typeCollection);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    boolean isInterface = deploymentModel.isInterface(francaInterface);

    SwiftClass clazz =
        SwiftClass.builder(SwiftNameRules.getClassName(francaInterface.getName()))
            .nameSpace(String.join("_", DefinedBy.getPackages(francaInterface)))
            .cInstance(CBridgeNameRules.getInterfaceName(francaInterface))
            .cInstanceRef(CBridgeNameRules.getInstanceRefType(francaInterface))
            .isInterface(isInterface)
            .functionTableName(
                isInterface ? CBridgeNameRules.getFunctionTableName(francaInterface) : null)
            .build();

    clazz.properties.addAll(getPreviousResults(SwiftProperty.class));
    clazz.typedefs.addAll(getPreviousResults(SwiftTypeDef.class));
    clazz.methods.addAll(getPreviousResults(SwiftMethod.class));

    SwiftFile file = new SwiftFile();
    if (isInterface) {
      // Instantiable Franca interface implemented as Swift protocol
      clazz.implementsProtocols.add(clazz.name);
      file.structs.addAll(getPreviousResults(SwiftContainerType.class));
      file.enums.addAll(getPreviousResults(SwiftEnum.class));

    } else {
      clazz.structs.addAll(getPreviousResults(SwiftContainerType.class));
      clazz.enums.addAll(getPreviousResults(SwiftEnum.class));
    }

    String comment = CppCommentParser.parse(francaInterface).getMainBodyText();
    clazz.comment = comment != null ? comment : "";

    file.classes.add(clazz);
    storeResult(file);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaStruct)) {
      closeContext();
      return;
    }

    SwiftContainerType parent = getPreviousResult(SwiftContainerType.class);

    SwiftContainerType swiftStruct =
        SwiftContainerType.builder(SwiftNameRules.getStructName(francaStruct, deploymentModel))
            .parent(parent)
            .cPrefix(CBridgeNameRules.getStructBaseName(francaStruct))
            .cType(CBridgeNameRules.getStructRefType(francaStruct))
            .build();
    String comment = CppCommentParser.parse(francaStruct).getMainBodyText();
    swiftStruct.comment = comment != null ? comment : "";

    if (parent != null) {
      swiftStruct.fields.addAll(parent.fields);
    }
    swiftStruct.fields.addAll(getPreviousResults(SwiftField.class));

    storeResult(swiftStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {
    String comment = CppCommentParser.parse(francaEnumerationType).getMainBodyText();
    List<SwiftEnumItem> enumItems =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, SwiftEnumItem.class);
    storeResult(
        SwiftEnum.builder(SwiftNameRules.getEnumTypeName(francaEnumerationType, deploymentModel))
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
    storeResult(SwiftValueMapper.mapExpression(expression));
    super.finishBuilding(expression);
  }

  @Override
  public void finishBuilding(FField francaField) {

    String fieldName = SwiftNameRules.getFieldName(francaField.getName());
    SwiftType fieldType = getPreviousResult(SwiftType.class);
    String deploymentDefaultValue = deploymentModel.getDefaultValue(francaField);
    SwiftValue defaultValue =
        deploymentDefaultValue != null
            ? SwiftValueMapper.mapDefaultValue(fieldType, deploymentDefaultValue)
            : null;
    SwiftField structField = new SwiftField(fieldName, fieldType, defaultValue);

    storeResult(structField);
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    SwiftType swiftType = getPreviousResult(SwiftType.class);
    SwiftInParameter swiftParameter =
        new SwiftInParameter(SwiftNameRules.getParameterName(francaArgument), swiftType);
    storeResult(swiftParameter);

    if (swiftType instanceof SwiftArray) {
      storeResult(new SwiftGenericParameter(swiftParameter.name, (SwiftArray) swiftParameter.type));
    }

    super.finishBuildingInputArgument(francaArgument);
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    SwiftType swiftType = getPreviousResult(SwiftType.class);
    if (swiftType.category == TypeCategory.STRUCT
        || swiftType.category == TypeCategory.BUILTIN_STRING) {
      swiftType = swiftType.createOptionalType();
    }
    storeResult(new SwiftOutParameter(SwiftNameRules.getParameterName(francaArgument), swiftType));
    super.finishBuildingOutputArgument(francaArgument);
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaTypeDef)) {
      closeContext();
      return;
    }

    if (!InstanceRules.isInstanceId(francaTypeDef)) {
      SwiftTypeDef typedefValue =
          new SwiftTypeDef(
              SwiftNameRules.getTypeDefName(francaTypeDef, deploymentModel),
              getPreviousResult(SwiftType.class));
      storeResult(typedefValue);
    }
    super.finishBuilding(francaTypeDef);
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    if (PlatformUnsupportedFeatures.hasUnsupportedParameters(francaMethod)) {
      closeContext();
      return;
    }

    List<SwiftParameter> inParams =
        getPreviousResults(SwiftInParameter.class)
            .stream()
            .map(SwiftParameter.class::cast)
            .collect(toList());

    String comment = CppCommentParser.parse(francaMethod).getMainBodyText();
    // TODO: APIGEN-471 - handle multiple return values
    SwiftParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, SwiftOutParameter.class, new SwiftOutParameter());
    SwiftMethod method =
        SwiftMethod.builder(SwiftNameRules.getMethodName(francaMethod))
            .comment(comment)
            .returnType(returnParam.type)
            .isStatic(deploymentModel.isStatic(francaMethod))
            .cBaseName(CBridgeNameRules.getMethodName(francaMethod))
            .error(createErrorIfNeeded(francaMethod))
            .build();
    method.parameters.addAll(inParams);
    method.genericParameters.addAll(getPreviousResults(SwiftGenericParameter.class));

    storeResult(method);
    super.finishBuilding(francaMethod);
  }

  private SwiftEnum createErrorIfNeeded(FMethod francaMethod) {
    FEnumerationType errorEnum = francaMethod.getErrorEnum();
    if (errorEnum != null) {
      String swiftEnumName = SwiftNameRules.getEnumTypeName(errorEnum, deploymentModel);
      enumsAsErrors.add(swiftEnumName);
      return SwiftEnum.builder(swiftEnumName).build();
    } else {
      return null;
    }
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {
    SwiftType swiftType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);
    if (swiftType instanceof SwiftArray) {
      SwiftArray array = (SwiftArray) swiftType;
      arraysCollector.put(array.underlyingType.name, array);
    }

    storeResult(swiftType);
    super.finishBuilding(francaTypeRef);
  }

  @Override
  public void finishBuilding(FAttribute attribute) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(attribute.getType())) {
      closeContext();
      return;
    }

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
    SwiftType innerType = SwiftTypeMapper.mapType(francaArray.getElementType(), deploymentModel);
    SwiftArray arrayType = SwiftArrayMapper.create(innerType, francaArray);
    arraysCollector.put(innerType.name, arrayType);
    super.finishBuilding(francaArray);
  }
}
