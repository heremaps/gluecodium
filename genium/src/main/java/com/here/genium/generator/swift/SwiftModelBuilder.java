/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
import com.here.genium.common.FrancaSignatureResolver;
import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.CommentHelper;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.*;
import java.util.*;
import org.franca.core.framework.FrancaHelpers;
import org.franca.core.franca.*;

public class SwiftModelBuilder extends AbstractModelBuilder<SwiftModelElement> {

  public final Map<String, SwiftArray> arraysCollector = new HashMap<>();
  public final Map<String, SwiftDictionary> mapCollector = new HashMap<>();
  public final Set<String> enumsAsErrors = new HashSet<>();

  private final FrancaDeploymentModel deploymentModel;
  private final FrancaSignatureResolver signatureResolver;

  public SwiftModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final FrancaSignatureResolver signatureResolver) {
    this(new ModelBuilderContextStack<>(), deploymentModel, signatureResolver);
  }

  @VisibleForTesting
  SwiftModelBuilder(
      final ModelBuilderContextStack<SwiftModelElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final FrancaSignatureResolver signatureResolver) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.signatureResolver = signatureResolver;
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
          new SwiftStruct(
              SwiftNameRules.getClassName(francaTypeCollection.getName()),
              getVisibility(francaTypeCollection));
      swiftStruct.getConstants().addAll(constants);
      file.structs.add(swiftStruct);
    }

    storeResult(file);
    super.finishBuilding(francaTypeCollection);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    boolean isInterface = deploymentModel.isInterface(francaInterface);
    SwiftClass parentClass = getPreviousResult(SwiftClass.class);
    boolean parentIsInterface = parentClass != null && parentClass.isInterface();
    boolean parentIsClass = parentClass != null && !parentClass.isInterface();

    boolean isObjcInterface = deploymentModel.isObjcInterface(francaInterface);
    String parentClassName = parentIsClass ? parentClass.name : null;
    if (parentClassName == null && isObjcInterface && !isInterface) {
      parentClassName = SwiftTypeMapper.OBJC_PARENT_CLASS;
    }

    SwiftClass clazz =
        new SwiftClass(
            SwiftNameRules.getClassName(francaInterface.getName()),
            getVisibility(francaInterface),
            isInterface,
            parentClassName,
            String.join("_", DefinedBy.getPackages(francaInterface)),
            CBridgeNameRules.getInterfaceName(francaInterface),
            isInterface ? CBridgeNameRules.getFunctionTableName(francaInterface) : null,
            parentIsClass && !isInterface,
            isObjcInterface);

    if (parentIsInterface) {
      clazz.getImplementsProtocols().add(parentClass.name);
      clazz.getMethods().addAll(parentClass.getMethods());
      clazz.getProperties().addAll(parentClass.getProperties());
    }

    clazz.getMethods().addAll(getPreviousResults(SwiftMethod.class));
    clazz.getProperties().addAll(getPreviousResults(SwiftProperty.class));
    clazz.getTypedefs().addAll(getPreviousResults(SwiftTypeDef.class));
    clazz.getConstants().addAll(getPreviousResults(SwiftConstant.class));

    String comment = CommentHelper.getDescription(francaInterface);
    clazz.comment = comment != null ? comment : "";

    SwiftFile file = new SwiftFile();
    file.classes.add(clazz);
    file.dictionaries.addAll(getPreviousResults(SwiftDictionary.class));

    if (isInterface) {
      file.structs.addAll(getPreviousResults(SwiftStruct.class));
      file.enums.addAll(getPreviousResults(SwiftEnum.class));
    } else {
      clazz.getStructs().addAll(getPreviousResults(SwiftStruct.class));
      clazz.getEnums().addAll(getPreviousResults(SwiftEnum.class));
    }

    storeResult(clazz);
    storeResult(file);
    super.finishBuilding(francaInterface);
  }

  @Override
  public void finishBuilding(FStructType francaStruct) {

    SwiftStruct swiftStruct =
        new SwiftStruct(
            SwiftNameRules.getStructName(francaStruct, deploymentModel),
            CBridgeNameRules.getStructBaseName(francaStruct),
            getVisibility(francaStruct),
            SwiftType.TypeCategory.STRUCT,
            false,
            null,
            false,
            deploymentModel.isEquatable(francaStruct),
            deploymentModel.isImmutable(francaStruct));
    String comment = CommentHelper.getDescription(francaStruct);
    swiftStruct.comment = comment != null ? comment : "";

    swiftStruct.getFields().addAll(getPreviousResults(SwiftField.class));

    storeResult(swiftStruct);
    super.finishBuilding(francaStruct);
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {

    List<SwiftEnumItem> enumItems =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, SwiftEnumItem.class);

    SwiftEnum swiftEnum =
        new SwiftEnum(
            SwiftNameRules.getEnumTypeName(francaEnumerationType, deploymentModel),
            getVisibility(francaEnumerationType),
            enumItems);
    swiftEnum.comment = CommentHelper.getDescription(francaEnumerationType);

    storeResult(swiftEnum);
    super.finishBuilding(francaEnumerationType);
  }

  @Override
  public void finishBuilding(FEnumerator enumerator) {

    SwiftEnumItem swiftEnumItem =
        new SwiftEnumItem(
            SwiftNameRules.getEnumItemName(enumerator),
            CollectionsHelper.getFirstOfType(
                getCurrentContext().previousResults, SwiftValue.class));
    swiftEnumItem.comment = CommentHelper.getDescription(enumerator);

    storeResult(swiftEnumItem);
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

    String fieldName = SwiftNameRules.getFieldName(francaField.getName());
    String deploymentDefaultValue = deploymentModel.getDefaultValue(francaField);
    SwiftValue defaultValue = SwiftValueMapper.mapDefaultValue(fieldType, deploymentDefaultValue);
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
    super.finishBuildingInputArgument(francaArgument);
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {

    SwiftParameter swiftParameter =
        new SwiftOutParameter(
            SwiftNameRules.getParameterName(francaArgument), getPreviousResult(SwiftType.class));
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
    boolean isConstructor = deploymentModel.isConstructor(francaMethod);
    SwiftMethod method =
        new SwiftMethod(
            SwiftNameRules.getMethodName(francaMethod),
            getVisibility(francaMethod),
            comment,
            isConstructor ? new SwiftType(CBridgeNameRules.BASE_REF_NAME, null) : returnParam.type,
            returnParam.comment,
            CBridgeNameRules.getNestedSpecifierString(francaMethod),
            CBridgeNameRules.getShortMethodName(francaMethod),
            createErrorIfNeeded(francaMethod),
            deploymentModel.isStatic(francaMethod) || isConstructor,
            isConstructor,
            isConstructor && signatureResolver.hasSignatureClash(francaMethod),
            inParams);

    storeResult(method);
    super.finishBuilding(francaMethod);
  }

  private SwiftEnum createErrorIfNeeded(FMethod francaMethod) {
    FEnumerationType errorEnum = francaMethod.getErrorEnum();
    if (errorEnum != null) {
      String swiftEnumName = SwiftNameRules.getEnumTypeName(errorEnum, deploymentModel);
      enumsAsErrors.add(swiftEnumName);
      return new SwiftEnum(swiftEnumName);
    } else {
      return null;
    }
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {
    SwiftType swiftType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);
    if (swiftType instanceof SwiftArray) {
      SwiftArray array = (SwiftArray) swiftType;
      FTypeRef elementType =
          FrancaTypeHelper.isImplicitArray(francaTypeRef)
              ? francaTypeRef
              : ((FArrayType) FrancaHelpers.getActualDerived(francaTypeRef)).getElementType();
      String elementTypeKey = SwiftTypeMapper.getActualTypeKey(elementType, deploymentModel);
      arraysCollector.putIfAbsent(elementTypeKey, array);
    }

    storeResult(swiftType);
    super.finishBuilding(francaTypeRef);
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

    SwiftVisibility propertyVisibility = getVisibility(francaAttribute);
    SwiftType swiftType = getPreviousResult(SwiftType.class);
    boolean isStatic = deploymentModel.isStatic(francaAttribute);

    String nestedSpecifier = CBridgeNameRules.getNestedSpecifierString(francaAttribute);
    SwiftMethod getterMethod =
        new SwiftMethod(
            "",
            propertyVisibility,
            null,
            swiftType,
            null,
            nestedSpecifier,
            CBridgeNameRules.getPropertyGetterName(francaAttribute),
            null,
            isStatic);

    SwiftMethod setterMethod = null;
    if (!francaAttribute.isReadonly()) {
      SwiftVisibility setterVisibility =
          deploymentModel.hasInternalSetter(francaAttribute)
              ? SwiftVisibility.INTERNAL
              : propertyVisibility;
      setterMethod =
          new SwiftMethod(
              "",
              setterVisibility,
              null,
              SwiftType.VOID,
              null,
              nestedSpecifier,
              CBridgeNameRules.getPropertySetterName(francaAttribute),
              null,
              isStatic,
              false,
              false,
              Collections.singletonList(new SwiftParameter("newValue", swiftType)));
    }

    SwiftProperty property =
        new SwiftProperty(
            SwiftNameRules.getPropertyName(francaAttribute.getName(), swiftType),
            propertyVisibility,
            swiftType,
            getterMethod,
            setterMethod,
            isStatic);
    property.comment = CommentHelper.getDescription(francaAttribute);

    storeResult(property);
    super.finishBuilding(francaAttribute);
  }

  @Override
  public void finishBuilding(final FArrayType francaArray) {
    SwiftArray arrayType = SwiftTypeMapper.mapArrayType(francaArray, deploymentModel);
    String elementTypeKey =
        SwiftTypeMapper.getActualTypeKey(francaArray.getElementType(), deploymentModel);
    arraysCollector.putIfAbsent(elementTypeKey, arrayType);

    SwiftTypeDef swiftTypeDef =
        new SwiftTypeDef(
            SwiftNameRules.getTypeDefName(francaArray, deploymentModel),
            getVisibility(francaArray),
            new SwiftType(arrayType.name, null));
    swiftTypeDef.comment = CommentHelper.getDescription(francaArray);

    storeResult(swiftTypeDef);
    super.finishBuilding(francaArray);
  }

  @Override
  public void finishBuilding(final FMapType francaMapType) {

    String typeDefName = SwiftNameRules.getTypeDefName(francaMapType, deploymentModel);
    String mapName = SwiftNameRules.getMapName(francaMapType, deploymentModel);
    List<SwiftType> typeRefs = getPreviousResults(SwiftType.class);
    SwiftDictionary swiftDictionary =
        new SwiftDictionary(
            mapName,
            null,
            typeDefName,
            CBridgeNameRules.getStructBaseName(francaMapType),
            typeRefs.get(0),
            typeRefs.get(1));

    String keyTypeKey =
        SwiftTypeMapper.getActualTypeKey(francaMapType.getKeyType(), deploymentModel);
    String valueTypeKey =
        SwiftTypeMapper.getActualTypeKey(francaMapType.getValueType(), deploymentModel);
    mapCollector.putIfAbsent(keyTypeKey + ":" + valueTypeKey, swiftDictionary);
    storeResult(swiftDictionary);

    SwiftType namelessDictionary = new SwiftType(swiftDictionary.getDictionaryDefinition(), null);
    SwiftTypeDef swiftTypeDef =
        new SwiftTypeDef(typeDefName, getVisibility(francaMapType), namelessDictionary);
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
