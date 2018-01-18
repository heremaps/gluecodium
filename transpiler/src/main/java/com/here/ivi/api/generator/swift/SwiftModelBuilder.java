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
import com.here.ivi.api.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.ivi.api.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.ivi.api.model.common.InstanceRules;
import com.here.ivi.api.model.franca.CommentHelper;
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
    SwiftClass parentClass = getPreviousResult(SwiftClass.class);
    boolean parentIsInterface = parentClass != null && parentClass.isInterface;

    SwiftClass clazz =
        SwiftClass.builder(SwiftNameRules.getClassName(francaInterface.getName()))
            .nameSpace(String.join("_", DefinedBy.getPackages(francaInterface)))
            .cInstance(CBridgeNameRules.getInterfaceName(francaInterface))
            .isInterface(isInterface)
            .parentClass(parentClass != null ? parentClass.name : null)
            .useParentCInstance(parentClass != null && !isInterface && !parentIsInterface)
            .functionTableName(
                isInterface ? CBridgeNameRules.getFunctionTableName(francaInterface) : null)
            .build();

    if (parentClass != null && parentIsInterface) {
      clazz.methods.addAll(parentClass.methods);
      for (final SwiftProperty parentProperty : parentClass.properties) {
        SwiftProperty swiftProperty = new SwiftProperty(parentProperty.name, parentProperty.type);
        swiftProperty.propertyAccessors.addAll(parentProperty.propertyAccessors);
        clazz.properties.add(swiftProperty);
      }
    }
    clazz.methods.addAll(getPreviousResults(SwiftMethod.class));
    clazz.properties.addAll(getPreviousResults(SwiftProperty.class));
    clazz.typedefs.addAll(getPreviousResults(SwiftTypeDef.class));

    String comment = CommentHelper.getDescription(francaInterface);
    clazz.comment = comment != null ? comment : "";

    SwiftFile file = new SwiftFile();
    file.classes.add(clazz);
    if (isInterface) {
      // Instantiable Franca interface implemented as Swift protocol
      clazz.implementsProtocols.add(clazz.name);
      file.structs.addAll(getPreviousResults(SwiftContainerType.class));
      file.enums.addAll(getPreviousResults(SwiftEnum.class));

    } else {
      clazz.structs.addAll(getPreviousResults(SwiftContainerType.class));
      clazz.enums.addAll(getPreviousResults(SwiftEnum.class));
    }

    storeResult(clazz);
    storeResult(file);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {

    SwiftContainerType parent = getPreviousResult(SwiftContainerType.class);

    SwiftContainerType swiftStruct =
        SwiftContainerType.builder(SwiftNameRules.getStructName(francaStruct, deploymentModel))
            .parent(parent)
            .cPrefix(CBridgeNameRules.getStructBaseName(francaStruct))
            .build();
    String comment = CommentHelper.getDescription(francaStruct);
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
    String comment = CommentHelper.getDescription(francaEnumerationType);
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
    String comment = CommentHelper.getDescription(enumerator);
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

    List<SwiftParameter> inParams =
        getPreviousResults(SwiftInParameter.class)
            .stream()
            .map(SwiftParameter.class::cast)
            .collect(toList());

    String comment = CommentHelper.getDescription(francaMethod);
    SwiftParameter returnParam =
        CollectionsHelper.getFirstOfType(
            getCurrentContext().previousResults, SwiftOutParameter.class, new SwiftOutParameter());
    SwiftMethod method =
        SwiftMethod.builder(SwiftNameRules.getMethodName(francaMethod))
            .comment(comment)
            .returnType(returnParam.type)
            .isStatic(deploymentModel.isStatic(francaMethod))
            .cNestedSpecifier(CBridgeNameRules.getNestedSpecifierString(francaMethod))
            .cShortName(CBridgeNameRules.getShortMethodName(francaMethod))
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

    SwiftProperty property =
        new SwiftProperty(
            SwiftNameRules.getPropertyName(attribute), getPreviousResult(SwiftType.class));

    String nestedSpecifier = CBridgeNameRules.getNestedSpecifierString(attribute);
    SwiftMethod getterMethod =
        SwiftMethod.builder("")
            .cNestedSpecifier(nestedSpecifier)
            .cShortName(CBridgeNameRules.getPropertyGetterName(attribute))
            .returnType(property.type)
            .forceReturnValueUnwrapping(true)
            .build();
    property.propertyAccessors.add(getterMethod);

    if (!attribute.isReadonly()) {
      SwiftMethod setterMethod =
          SwiftMethod.builder("")
              .cNestedSpecifier(nestedSpecifier)
              .cShortName(CBridgeNameRules.getPropertySetterName(attribute))
              .returnType(SwiftType.VOID)
              .build();
      setterMethod.parameters.add(new SwiftParameter("newValue", property.type));
      property.propertyAccessors.add(setterMethod);
    }

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
