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

package com.here.genium.generator.cpp;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.model.common.Include;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.test.ArrayEList;
import com.here.genium.test.MockContextStack;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({InstanceRules.class, DefinedBy.class})
public final class CppModelBuilderTest {

  private static final String STRUCT_NAME = "structural";
  private static final String FIELD_NAME = "many_Flowers";
  private static final String CONSTANT_NAME = "permanent";
  private static final String ENUM_NAME = "innumerable";
  private static final String METHOD_NAME = "methodical";
  private static final String ATTRIBUTE_NAME = "tribute";

  private final MockContextStack<CppElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private CppTypeMapper typeMapper;
  @Mock private CppValueMapper valueMapper;

  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FConstantDef francaConstant;
  @Mock private FField francaField;
  @Mock private FStructType francaStructType;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FArrayType francaArrayType;
  @Mock private FMapType francaMapType;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FTypeRef francaAnotherTypeRef;
  @Mock private FInitializerExpression francaInitializerExpression;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FExpression francaExpression;
  @Mock private FAttribute francaAttribute;

  private CppModelBuilder modelBuilder;

  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("typically").build();

  private final CppMethod cppMethod = new CppMethod.Builder("classical").build();
  private final CppValue cppValue = new CppValue("valuable");
  private final CppEnum cppEnum = CppEnum.builder(ENUM_NAME).fullyQualifiedName(ENUM_NAME).build();
  private final CppStruct cppStruct = new CppStruct(STRUCT_NAME);
  private final CppTypeRef cppTypeRef = CppPrimitiveTypeRef.INT64;
  private final CppTypeDefRef cppTypeDefRef =
      new CppTypeDefRef("useful", cppTypeRef, Include.createInternalInclude("foo"));
  private final CppUsing cppUsing = CppUsing.builder("useful", cppTypeDefRef).build();
  private final CppConstant cppConstant = new CppConstant(CONSTANT_NAME, cppTypeRef, cppValue);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(InstanceRules.class, DefinedBy.class);

    MockitoAnnotations.initMocks(this);

    modelBuilder = new CppModelBuilder(contextStack, deploymentModel, typeMapper, valueMapper);

    when(francaInterface.getName()).thenReturn("classy");
    when(francaArgument.getName()).thenReturn("flowers");
    when(francaStructType.getName()).thenReturn(STRUCT_NAME);
    when(francaTypeDef.getName()).thenReturn("definitely");
    when(francaArrayType.getName()).thenReturn("relay");
    when(francaMapType.getName()).thenReturn("tigers");
    when(francaField.getName()).thenReturn(FIELD_NAME);
    when(francaConstant.getName()).thenReturn(CONSTANT_NAME);
    when(francaEnumerationType.getName()).thenReturn(ENUM_NAME);
    when(francaEnumerator.getName()).thenReturn("enumerated");
    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    when(francaMethod.getInArgs()).thenReturn(new ArrayEList<>());
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef);
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaAnotherTypeRef);
    when(francaConstant.getRhs()).thenReturn(francaInitializerExpression);

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaTypeCollection);
    when(DefinedBy.getPackages(any())).thenReturn(Collections.singletonList("nonsense"));

    contextStack.getCurrentContext().nameRules = CppNameRules.INSTANCE;
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsName() {
    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaInterface);

    modelBuilder.finishBuilding(francaInterface);

    CppClass resultClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(resultClass);
    assertEquals("Classy", resultClass.name);
    assertEquals("::nonsense::Classy", resultClass.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    contextStack.injectResult(cppMethod);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.methods.isEmpty());
    assertEquals(cppMethod, cppClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStructs() {
    contextStack.injectResult(cppStruct);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.members.isEmpty());
    assertEquals(cppStruct, cppClass.members.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnums() {
    contextStack.injectResult(cppEnum);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.members.isEmpty());
    assertEquals(cppEnum, cppClass.members.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsUsings() {
    contextStack.injectResult(cppUsing);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(1, cppClass.members.size());
    assertEquals(cppUsing, cppClass.members.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstants() {
    contextStack.injectResult(cppConstant);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(1, cppClass.members.size());
    assertEquals(cppConstant, cppClass.members.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParent() {
    FInterface parentInterface = mock(FInterface.class);
    when(francaInterface.getBase()).thenReturn(parentInterface);
    when(typeMapper.mapComplexType(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(1, cppClass.inheritances.size());

    CppInheritance cppInheritance = cppClass.inheritances.iterator().next();
    assertEquals(cppComplexTypeRef, cppInheritance.parent);
    assertEquals(CppInheritance.Type.Public, cppInheritance.visibility);

    verify(typeMapper).mapComplexType(parentInterface);
  }

  @Test
  public void finishBuildingFrancaMethodReadsNames() {
    when(DefinedBy.getPackages(any())).thenReturn(Collections.singletonList("nonsense"));

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(METHOD_NAME, resultMethod.name);
    assertEquals("::nonsense::" + METHOD_NAME, resultMethod.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaMethodOmitsSelector() {
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(METHOD_NAME, resultMethod.name);
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticFlag() {
    when(deploymentModel.isStatic(francaMethod)).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertTrue(resultMethod.specifiers.contains(CppMethod.Specifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodReadsInputParameters() {
    CppParameter cppParameter = new CppParameter("flowers", null);
    contextStack.injectResult(cppParameter);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);

    List<CppParameter> cppParameters = resultMethod.parameters;
    assertFalse(cppParameters.isEmpty());
    assertEquals(cppParameter, cppParameters.get(0));
  }

  @Test
  public void finishBuildingFrancaMethodReadsOutputParameters() {
    contextStack.injectResult(new CppParameter("flowers", cppComplexTypeRef, true));

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(cppComplexTypeRef, resultMethod.returnType);
  }

  @Test
  public void finishBuildingFrancaMethodMapsErrorType() {
    contextStack.injectResult(mock(CppTypeRef.class));

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(CppTypeMapper.STD_ERROR_CODE_TYPE, resultMethod.returnType);
  }

  @Test
  public void finishBuildingInputArgumentReadsName() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals("flowers", cppParameter.name);
  }

  @Test
  public void finishBuildingInputArgumentReadsTypeRef() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(cppComplexTypeRef, cppParameter.type);
  }

  @Test
  public void finishBuildingOutputArgument() {
    modelBuilder.finishBuildingOutputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals("flowers", cppParameter.name);
    assertTrue(cppParameter.isOutput);
  }

  @Test
  public void finishBuildingOutputArgumentReadsTypeRef() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(cppComplexTypeRef, cppParameter.type);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsStructs() {
    contextStack.injectResult(cppStruct);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppStruct result = modelBuilder.getFinalResult(CppStruct.class);
    assertEquals(cppStruct, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsUsings() {
    contextStack.injectResult(cppUsing);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppUsing result = modelBuilder.getFinalResult(CppUsing.class);
    assertEquals(cppUsing, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsEnums() {
    contextStack.injectResult(cppEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppEnum result = modelBuilder.getFinalResult(CppEnum.class);
    assertEquals(cppEnum, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsConstants() {
    contextStack.injectResult(cppConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppConstant result = modelBuilder.getFinalResult(CppConstant.class);
    assertEquals(cppConstant, result);
  }

  @Test
  public void finishBuildingFrancaConstantMapsValue() {
    contextStack.injectResult(cppComplexTypeRef);
    contextStack.injectResult(cppValue);

    modelBuilder.finishBuilding(francaConstant);

    CppConstant result = modelBuilder.getFinalResult(CppConstant.class);
    assertNotNull(result);
    assertEquals("::nonsense::" + CONSTANT_NAME, result.fullyQualifiedName.toLowerCase());
    assertEquals(cppValue, result.value);
  }

  @Test
  public void finishBuildingFrancaConstantReadsTypeRef() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaConstant);

    CppConstant result = modelBuilder.getFinalResult(CppConstant.class);
    assertNotNull(result);
    assertEquals(cppComplexTypeRef, result.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals("many_flowers", cppField.name);
  }

  @Test
  public void finishBuildingFrancaFieldInExternalStructPreservesName() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals("many_Flowers", cppField.name);
  }

  @Test
  public void finishBuildingFrancaFieldReadsTypeRef() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(cppComplexTypeRef, cppField.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsDefaultValue() {
    when(deploymentModel.getDefaultValue(any())).thenReturn("SomeDefault");
    when(valueMapper.mapDeploymentDefaultValue(any(), any())).thenReturn(cppValue);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(cppValue, cppField.initializer);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsName() {
    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertEquals("Structural", resultStruct.name);
    assertEquals("::nonsense::Structural", resultStruct.fullyQualifiedName);

    verify(francaStructType, atLeastOnce()).getName();
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    final CppField cppField = new CppField(FIELD_NAME, cppComplexTypeRef);
    contextStack.injectResult(cppField);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertFalse(resultStruct.fields.isEmpty());
    assertEquals(cppField, resultStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsInheritance() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertEquals(1, resultStruct.inheritances.size());

    CppInheritance cppInheritance = resultStruct.inheritances.iterator().next();
    assertEquals(cppComplexTypeRef, cppInheritance.parent);
    assertEquals(CppInheritance.Type.Public, cppInheritance.visibility);
  }

  @Test
  public void finishBuildingFrancaStructTypeCreatesTypeRef() {
    when(typeMapper.mapComplexType(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaStructType);

    CppComplexTypeRef resultTypeRef = modelBuilder.getFinalResult(CppComplexTypeRef.class);
    assertEquals(cppComplexTypeRef, resultTypeRef);

    verify(typeMapper).mapComplexType(francaStructType);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsExternalType() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertTrue(resultStruct.isExternal);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsExternalName() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);
    when(deploymentModel.getExternalName(any())).thenReturn("::very::External");

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertEquals("::very::External", resultStruct.name);
    assertEquals("::very::External", resultStruct.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsEquatable() {
    when(deploymentModel.isEquatable(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertTrue(resultStruct.isEquatable);
  }

  @Test
  public void finishBuildingFrancaTypeDefInstanceId() {
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeDef);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNull(resultUsing);

    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void finishBuildingFrancaTypeDefNotInstanceId() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaTypeDef);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("definitely", resultUsing.name.toLowerCase());
    assertEquals("::nonsense::Definitely", resultUsing.fullyQualifiedName);
    assertEquals(cppComplexTypeRef, resultUsing.definition);

    PowerMockito.verifyStatic(atLeastOnce());
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void finishBuildingFrancaArrayType() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaArrayType);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("relay", resultUsing.name.toLowerCase());
    assertEquals("::nonsense::Relay", resultUsing.fullyQualifiedName);
    assertTrue(resultUsing.definition instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) resultUsing.definition;
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.templateClass);
    assertEquals(1, cppTemplateTypeRef.templateParameters.size());
    assertEquals(cppComplexTypeRef, cppTemplateTypeRef.templateParameters.get(0));
  }

  @Test
  public void finishBuildingFrancaMapType() {
    CppTypeRef mapTypeRef = CppPrimitiveTypeRef.INT8;
    when(typeMapper.wrapMap(any(), any())).thenReturn(mapTypeRef);
    CppTypeRef cppPrimitiveTypeRef = CppPrimitiveTypeRef.INT8;
    contextStack.injectResult(cppPrimitiveTypeRef);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaMapType);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("tigers", resultUsing.name.toLowerCase());
    assertEquals("::nonsense::Tigers", resultUsing.fullyQualifiedName);
    assertEquals(mapTypeRef, resultUsing.definition);
    verify(typeMapper).wrapMap(cppPrimitiveTypeRef, cppComplexTypeRef);
  }

  @Test
  public void finishBuildingFrancaTypeRef() {
    when(typeMapper.map(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaTypeRef);

    CppComplexTypeRef result = modelBuilder.getFinalResult(CppComplexTypeRef.class);
    assertEquals(cppComplexTypeRef, result);

    verify(typeMapper).map(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaTypeRefWrapsArray() {
    when(francaField.isArray()).thenReturn(true);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(typeMapper.map(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaTypeRef);

    CppComplexTypeRef result = modelBuilder.getFinalResult(CppComplexTypeRef.class);
    assertTrue(result instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) result;
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.templateClass);
    assertEquals(1, cppTemplateTypeRef.templateParameters.size());
    assertEquals(cppComplexTypeRef, cppTemplateTypeRef.templateParameters.get(0));

    verify(typeMapper).map(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsName() {
    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFinalResult(CppEnum.class);
    assertNotNull(resultEnum);
    assertEquals("Innumerable", resultEnum.name);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsEnumItems() {
    CppEnumItem cppEnumItem = new CppEnumItem("enumerated");
    contextStack.injectResult(cppEnumItem);

    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFinalResult(CppEnum.class);
    assertNotNull(resultEnum);
    assertFalse(resultEnum.items.isEmpty());
    assertEquals(cppEnumItem, resultEnum.items.get(0));
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCreatesTypeRef() {
    when(typeMapper.mapComplexType(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaEnumerationType);

    CppComplexTypeRef resultTypeRef = modelBuilder.getFinalResult(CppComplexTypeRef.class);
    assertEquals(cppComplexTypeRef, resultTypeRef);

    verify(typeMapper).mapComplexType(francaEnumerationType);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsExternalType() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFinalResult(CppEnum.class);
    assertTrue(resultEnum.isExternal);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsExternalName() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);
    when(deploymentModel.getExternalName(any())).thenReturn("::very::External");

    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFinalResult(CppEnum.class);
    assertEquals("::very::External", resultEnum.name);
    assertEquals("::very::External", resultEnum.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaEnumerator() {
    modelBuilder.finishBuilding(francaEnumerator);

    CppEnumItem cppEnumItem = modelBuilder.getFinalResult(CppEnumItem.class);
    assertNotNull(cppEnumItem);
    assertEquals("ENUMERATED", cppEnumItem.name);
  }

  @Test
  public void finishBuildingFrancaEnumeratorExternalEnum() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaEnumerator);

    CppEnumItem cppEnumItem = modelBuilder.getFinalResult(CppEnumItem.class);
    assertNotNull(cppEnumItem);
    assertEquals("enumerated", cppEnumItem.name);
  }

  @Test
  public void finishBuildingFrancaExpression() {
    when(valueMapper.map(any(FExpression.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaExpression);

    CppValue result = modelBuilder.getFinalResult(CppValue.class);
    assertEquals(cppValue, result);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesGetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals("get_" + ATTRIBUTE_NAME, resultMethod.name.toLowerCase());
    assertTrue(resultMethod.qualifiers.contains(CppMethod.Qualifier.CONST));
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());
    assertEquals("set_" + ATTRIBUTE_NAME, methods.get(1).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    contextStack.injectResult(cppComplexTypeRef);

    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(1, methods.size());
    assertEquals("get_" + ATTRIBUTE_NAME, methods.get(0).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoGetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(cppComplexTypeRef, resultMethod.returnType);
    assertTrue(resultMethod.parameters.isEmpty());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoSetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());

    CppMethod resultMethod = methods.get(1);
    assertEquals(CppPrimitiveTypeRef.VOID, resultMethod.returnType);
    assertFalse(resultMethod.parameters.isEmpty());
    assertEquals(cppComplexTypeRef, resultMethod.parameters.get(0).type);
  }

  @Test
  public void finishBuildingFrancaBooleanAttributeCreatesGetter() {
    contextStack.injectResult(CppPrimitiveTypeRef.BOOL);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals("is_" + ATTRIBUTE_NAME, resultMethod.name.toLowerCase());
  }
}
