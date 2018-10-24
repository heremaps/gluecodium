/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.swift;

import static java.util.stream.Collectors.toList;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.CommentHelper;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.*;
import com.here.genium.model.swift.SwiftType.TypeCategory;
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
  public void finishBuilding(FTypeCollection francaTypeCollection) {

    SwiftFile file = new SwiftFile();
    file.structs.addAll(getPreviousResults(SwiftStruct.class));
    file.enums.addAll(getPreviousResults(SwiftEnum.class));
    file.typeDefs.addAll(getPreviousResults(SwiftTypeDef.class));
    file.dictionaries.addAll(getPreviousResults(SwiftDictionary.class));

    List<SwiftConstant> constants = getPreviousResults(SwiftConstant.class);
    if (!constants.isEmpty()) {
      SwiftStruct swiftStruct =
          SwiftStruct.builder(SwiftNameRules.getClassName(francaTypeCollection.getName()))
              .visibility(getVisibility(francaTypeCollection))
              .build();
      swiftStruct.constants.addAll(constants);
      file.structs.add(swiftStruct);
    }

    storeResult(file);
    super.finishBuilding(francaTypeCollection);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    boolean isInterface = deploymentModel.isInterface(francaInterface);
    SwiftClass parentClass = getPreviousResult(SwiftClass.class);
    boolean parentIsInterface = parentClass != null && parentClass.isInterface;
    boolean parentIsClass = parentClass != null && !parentClass.isInterface;

    boolean isObjcInterface = deploymentModel.isObjcInterface(francaInterface);
    String parentClassName = parentIsClass ? parentClass.name : null;
    if (parentClassName == null && isObjcInterface && !isInterface) {
      parentClassName = SwiftTypeMapper.OBJC_PARENT_CLASS;
    }

    SwiftClass clazz =
        SwiftClass.builder(SwiftNameRules.getClassName(francaInterface.getName()))
            .nameSpace(String.join("_", DefinedBy.getPackages(francaInterface)))
            .cInstance(CBridgeNameRules.getInterfaceName(francaInterface))
            .isInterface(isInterface)
            .parentClass(parentClassName)
            .useParentCInstance(parentIsClass && !isInterface)
            .functionTableName(
                isInterface ? CBridgeNameRules.getFunctionTableName(francaInterface) : null)
            .visibility(getVisibility(francaInterface))
            .isObjcInterface(isObjcInterface)
            .build();

    if (parentIsInterface) {
      clazz.implementsProtocols.add(parentClass.name);
      clazz.methods.addAll(parentClass.methods);
      for (final SwiftProperty parentProperty : parentClass.properties) {
        SwiftProperty swiftProperty =
            new SwiftProperty(parentProperty.name, parentProperty.visibility, parentProperty.type);
        swiftProperty.propertyAccessors.addAll(parentProperty.propertyAccessors);
        clazz.properties.add(swiftProperty);
      }
    }
    clazz.methods.addAll(getPreviousResults(SwiftMethod.class));
    clazz.properties.addAll(getPreviousResults(SwiftProperty.class));
    clazz.typedefs.addAll(getPreviousResults(SwiftTypeDef.class));
    clazz.constants.addAll(getPreviousResults(SwiftConstant.class));

    String comment = CommentHelper.getDescription(francaInterface);
    clazz.comment = comment != null ? comment : "";

    SwiftFile file = new SwiftFile();
    file.classes.add(clazz);
    file.dictionaries.addAll(getPreviousResults(SwiftDictionary.class));

    if (isInterface) {
      file.structs.addAll(getPreviousResults(SwiftStruct.class));
      file.enums.addAll(getPreviousResults(SwiftEnum.class));
    } else {
      clazz.structs.addAll(getPreviousResults(SwiftStruct.class));
      clazz.enums.addAll(getPreviousResults(SwiftEnum.class));
    }

    storeResult(clazz);
    storeResult(file);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {

    SwiftStruct swiftStruct =
        SwiftStruct.builder(SwiftNameRules.getStructName(francaStruct, deploymentModel))
            .cPrefix(CBridgeNameRules.getStructBaseName(francaStruct))
            .visibility(getVisibility(francaStruct))
            .isEquatable(deploymentModel.isEquatable(francaStruct))
            .isImmutable(deploymentModel.isImmutable(francaStruct))
            .build();
    String comment = CommentHelper.getDescription(francaStruct);
    swiftStruct.comment = comment != null ? comment : "";

    swiftStruct.fields.addAll(getPreviousResults(SwiftField.class));

    storeResult(swiftStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {

    List<SwiftEnumItem> enumItems =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, SwiftEnumItem.class);

    SwiftEnum swiftEnum =
        SwiftEnum.builder(SwiftNameRules.getEnumTypeName(francaEnumerationType, deploymentModel))
            .comment(CommentHelper.getDescription(francaEnumerationType))
            .items(enumItems)
            .visibility(getVisibility(francaEnumerationType))
            .build();

    storeResult(swiftEnum);
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
  public void finishBuilding(FInitializerExpression expression) {
    storeResult(SwiftValueMapper.map(expression));
    super.finishBuilding(expression);
  }

  @Override
  public void finishBuilding(FField francaField) {

    SwiftType fieldType = getPreviousResult(SwiftType.class);
    if (fieldType.category == TypeCategory.CLASS && deploymentModel.isNotNull(francaField)) {
      fieldType = fieldType.withOptional(false);
    }

    String fieldName = SwiftNameRules.getFieldName(francaField.getName());
    String deploymentDefaultValue = deploymentModel.getDefaultValue(francaField);
    SwiftValue defaultValue =
        deploymentDefaultValue != null
            ? SwiftValueMapper.mapDefaultValue(fieldType, deploymentDefaultValue)
            : null;
    SwiftVisibility visibility = getVisibility(francaField);

    SwiftField structField = new SwiftField(fieldName, visibility, fieldType, defaultValue);
    structField.comment = CommentHelper.getDescription(francaField);

    storeResult(structField);
    super.finishBuilding(francaField);
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    SwiftType swiftType = getPreviousResult(SwiftType.class);
    SwiftInParameter swiftParameter =
        new SwiftInParameter(SwiftNameRules.getParameterName(francaArgument), swiftType);
    swiftParameter.comment = CommentHelper.getDescription(francaArgument);
    storeResult(swiftParameter);

    if (swiftType instanceof SwiftArray) {
      storeResult(new SwiftGenericParameter(swiftParameter.name, (SwiftArray) swiftParameter.type));
    }

    super.finishBuildingInputArgument(francaArgument);
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    SwiftType swiftType = getPreviousResult(SwiftType.class);
    if (swiftType.category == TypeCategory.STRUCT) {
      swiftType = swiftType.withOptional(true);
    }

    SwiftParameter swiftParameter =
        new SwiftOutParameter(SwiftNameRules.getParameterName(francaArgument), swiftType);
    swiftParameter.comment = CommentHelper.getDescription(francaArgument);
    storeResult(swiftParameter);
    super.finishBuildingOutputArgument(francaArgument);
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {

    if (!InstanceRules.isInstanceId(francaTypeDef)) {

      SwiftTypeDef typedefValue =
          new SwiftTypeDef(
              SwiftNameRules.getTypeDefName(francaTypeDef, deploymentModel),
              getVisibility(francaTypeDef),
              getPreviousResult(SwiftType.class));
      typedefValue.comment = CommentHelper.getDescription(francaTypeDef);
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
            .returnComment(returnParam.comment)
            .isStatic(deploymentModel.isStatic(francaMethod))
            .cNestedSpecifier(CBridgeNameRules.getNestedSpecifierString(francaMethod))
            .cShortName(CBridgeNameRules.getShortMethodName(francaMethod))
            .error(createErrorIfNeeded(francaMethod))
            .visibility(getVisibility(francaMethod))
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
  public void finishBuilding(FAttribute francaAttribute) {

    SwiftProperty property =
        new SwiftProperty(
            SwiftNameRules.getPropertyName(francaAttribute),
            getVisibility(francaAttribute),
            getPreviousResult(SwiftType.class));
    property.comment = CommentHelper.getDescription(francaAttribute);

    String nestedSpecifier = CBridgeNameRules.getNestedSpecifierString(francaAttribute);
    SwiftMethod getterMethod =
        SwiftMethod.builder("")
            .cNestedSpecifier(nestedSpecifier)
            .cShortName(CBridgeNameRules.getPropertyGetterName(francaAttribute))
            .returnType(property.type)
            .build();
    property.propertyAccessors.add(getterMethod);

    if (!francaAttribute.isReadonly()) {
      SwiftMethod setterMethod =
          SwiftMethod.builder("")
              .cNestedSpecifier(nestedSpecifier)
              .cShortName(CBridgeNameRules.getPropertySetterName(francaAttribute))
              .returnType(SwiftType.VOID)
              .build();
      setterMethod.parameters.add(new SwiftParameter("newValue", property.type));
      property.propertyAccessors.add(setterMethod);
    }

    storeResult(property);
    super.finishBuilding(francaAttribute);
  }

  @Override
  public void finishBuilding(FArrayType francaArray) {
    SwiftType innerType = SwiftTypeMapper.mapType(francaArray.getElementType(), deploymentModel);
    SwiftArray arrayType = SwiftArrayMapper.create(innerType, francaArray);
    arraysCollector.put(innerType.name, arrayType);
    super.finishBuilding(francaArray);
  }

  @Override
  public void finishBuilding(final FMapType francaMapType) {

    String typeDefName = SwiftNameRules.getTypeDefName(francaMapType, deploymentModel);
    String mapName = SwiftNameRules.getMapName(francaMapType, deploymentModel);
    List<SwiftType> typeRefs = getPreviousResults(SwiftType.class);
    SwiftType swiftDictionary =
        SwiftDictionary.builder(mapName)
            .publicName(typeDefName)
            .cPrefix(CBridgeNameRules.getStructBaseName(francaMapType))
            .keyType(typeRefs.get(0))
            .valueType(typeRefs.get(1))
            .build();
    storeResult(swiftDictionary);

    SwiftVisibility visibility = getVisibility(francaMapType);
    SwiftType namelessDictionary = new SwiftType(swiftDictionary.implementingClass);

    SwiftTypeDef swiftTypeDef = new SwiftTypeDef(typeDefName, visibility, namelessDictionary);
    swiftTypeDef.comment = CommentHelper.getDescription(francaMapType);

    storeResult(swiftTypeDef);
    super.finishBuilding(francaMapType);
  }

  @Override
  public void finishBuilding(final FConstantDef francaConstant) {

    String name = SwiftNameRules.getConstantName(francaConstant.getName());
    SwiftType type = getPreviousResult(SwiftType.class);
    SwiftVisibility visibility = getVisibility(francaConstant);
    SwiftValue value = getPreviousResult(SwiftValue.class);

    SwiftConstant swiftConstant = new SwiftConstant(name, visibility, type, value);
    swiftConstant.comment = CommentHelper.getDescription(francaConstant);

    storeResult(swiftConstant);
    super.finishBuilding(francaConstant);
  }

  private SwiftVisibility getVisibility(final FModelElement francaModelElement) {
    return deploymentModel.isInternal(francaModelElement)
        ? SwiftVisibility.INTERNAL
        : SwiftVisibility.PUBLIC;
  }
}
