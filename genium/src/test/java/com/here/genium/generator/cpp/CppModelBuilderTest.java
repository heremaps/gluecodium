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
import com.here.genium.model.cpp.CppMethod.Specifier;
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
@PrepareForTest(InstanceRules.class)
public final class CppModelBuilderTest {

  private static final String DUMMY_NAME = "Foo";
  private static final String NONSENSE_NAME = "nonsense";
  private static final String DUMMY_FQN = "::bar::Baz";

  private final MockContextStack<CppElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private CppTypeMapper typeMapper;
  @Mock private CppValueMapper valueMapper;
  @Mock private CppNameResolver nameResolver;

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

  private final CppComplexTypeRef cppComplexTypeRef = new CppComplexTypeRef(NONSENSE_NAME);

  private final CppMethod cppMethod = new CppMethod(NONSENSE_NAME);
  private final CppValue cppValue = new CppValue(NONSENSE_NAME);
  private final CppEnum cppEnum =
      new CppEnum(NONSENSE_NAME, NONSENSE_NAME, false, Collections.emptyList());
  private final CppStruct cppStruct = new CppStruct(NONSENSE_NAME);
  private final CppTypeRef cppTypeRef = CppPrimitiveTypeRef.Companion.getINT64();
  private final CppTypeDefRef cppTypeDefRef =
      new CppTypeDefRef(
          NONSENSE_NAME,
          Collections.singletonList(Include.Companion.createInternalInclude(NONSENSE_NAME)),
          cppTypeRef);
  private final CppUsing cppUsing = new CppUsing(NONSENSE_NAME, NONSENSE_NAME, cppTypeDefRef);
  private final CppConstant cppConstant =
      new CppConstant(NONSENSE_NAME, NONSENSE_NAME, cppTypeRef, cppValue);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(InstanceRules.class);
    MockitoAnnotations.initMocks(this);

    modelBuilder =
        new CppModelBuilder(contextStack, deploymentModel, typeMapper, valueMapper, nameResolver);

    when(nameResolver.getName(any())).thenReturn(DUMMY_NAME);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn(DUMMY_FQN);
    when(nameResolver.getGetterName(any())).thenReturn("");
    when(nameResolver.getSetterName(any())).thenReturn("");

    when(francaMethod.getInArgs()).thenReturn(new ArrayEList<>());
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef);
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaAnotherTypeRef);
    when(francaConstant.getRhs()).thenReturn(francaInitializerExpression);

    when(nameResolver.getFullyQualifiedGetterName(any())).thenReturn(DUMMY_FQN);
    when(nameResolver.getFullyQualifiedSetterName(any())).thenReturn(DUMMY_FQN);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsName() {
    modelBuilder.finishBuilding(francaInterface);

    CppClass resultClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(resultClass);
    assertEquals(DUMMY_NAME, resultClass.name);
    assertEquals(DUMMY_FQN, resultClass.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    contextStack.injectResult(cppMethod);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.getMethods().isEmpty());
    assertEquals(cppMethod, cppClass.getMethods().iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStructs() {
    contextStack.injectResult(cppStruct);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.getMembers().isEmpty());
    assertEquals(cppStruct, cppClass.getMembers().iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnums() {
    contextStack.injectResult(cppEnum);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.getMembers().isEmpty());
    assertEquals(cppEnum, cppClass.getMembers().iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsUsings() {
    contextStack.injectResult(cppUsing);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(1, cppClass.getMembers().size());
    assertEquals(cppUsing, cppClass.getMembers().iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstants() {
    contextStack.injectResult(cppConstant);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(1, cppClass.getMembers().size());
    assertEquals(cppConstant, cppClass.getMembers().iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParent() {
    FInterface parentInterface = mock(FInterface.class);
    when(francaInterface.getBase()).thenReturn(parentInterface);
    when(typeMapper.mapComplexType(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(1, cppClass.getInheritances().size());

    CppInheritance cppInheritance = cppClass.getInheritances().get(0);
    assertEquals(cppComplexTypeRef, cppInheritance.getParent());
    assertEquals(CppInheritance.Type.Public, cppInheritance.getVisibility());

    verify(typeMapper).mapComplexType(parentInterface);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsExternalType() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaInterface);

    CppClass resultClass = modelBuilder.getFinalResult(CppClass.class);
    assertTrue(resultClass.isExternal());
  }

  @Test
  public void finishBuildingFrancaMethodReadsNames() {
    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(DUMMY_NAME, resultMethod.name);
    assertEquals(DUMMY_FQN, resultMethod.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticFlag() {
    when(deploymentModel.isStatic(francaMethod)).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertTrue(resultMethod.getSpecifiers().contains(CppMethod.Specifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodReadsConstructorFlag() {
    when(deploymentModel.isConstructor(francaMethod)).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertTrue(resultMethod.getSpecifiers().contains(CppMethod.Specifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodReadsInputParameters() {
    CppParameter cppParameter = new CppParameter(NONSENSE_NAME, cppTypeRef);
    contextStack.injectResult(cppParameter);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);

    List<CppParameter> cppParameters = resultMethod.getParameters();
    assertFalse(cppParameters.isEmpty());
    assertEquals(cppParameter, cppParameters.get(0));
  }

  @Test
  public void finishBuildingFrancaMethodReadsOutputParameters() {
    contextStack.injectResult(new CppParameter(NONSENSE_NAME, cppComplexTypeRef, true));

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(cppComplexTypeRef, resultMethod.getReturnType());
  }

  @Test
  public void finishBuildingFrancaMethodMapsErrorType() {
    contextStack.injectResult(mock(CppTypeRef.class));

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(CppTypeMapper.STD_ERROR_CODE_TYPE, resultMethod.getReturnType());
  }

  @Test
  public void finishBuildingInputArgumentReadsName() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(DUMMY_NAME, cppParameter.name);
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
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(DUMMY_NAME, cppParameter.name);
    assertTrue(cppParameter.isOutput());
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
    assertEquals(DUMMY_FQN, result.fullyQualifiedName);
    assertEquals(cppValue, result.getValue());
  }

  @Test
  public void finishBuildingFrancaConstantReadsTypeRef() {
    contextStack.injectResult(cppComplexTypeRef);
    contextStack.injectResult(cppValue);

    modelBuilder.finishBuilding(francaConstant);

    CppConstant result = modelBuilder.getFinalResult(CppConstant.class);
    assertNotNull(result);
    assertEquals(cppComplexTypeRef, result.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(DUMMY_NAME, cppField.name);
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
    when(deploymentModel.getDefaultValue(any())).thenReturn(NONSENSE_NAME);
    when(valueMapper.mapDeploymentDefaultValue(any(), any())).thenReturn(cppValue);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(cppValue, cppField.getInitializer());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsName() {
    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertEquals(DUMMY_NAME, resultStruct.name);
    assertEquals(DUMMY_FQN, resultStruct.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    final CppField cppField = new CppField(NONSENSE_NAME, cppComplexTypeRef);
    contextStack.injectResult(cppField);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertFalse(resultStruct.getFields().isEmpty());
    assertEquals(cppField, resultStruct.getFields().get(0));
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsExternalType() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertTrue(resultStruct.isExternal());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsEquatable() {
    when(deploymentModel.isEquatable(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertTrue(resultStruct.isEquatable());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsImmutable() {
    when(deploymentModel.isImmutable(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertTrue(resultStruct.isImmutable());
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
    assertEquals(DUMMY_NAME, resultUsing.name);
    assertEquals(DUMMY_FQN, resultUsing.fullyQualifiedName);
    assertEquals(cppComplexTypeRef, resultUsing.getDefinition());

    PowerMockito.verifyStatic(atLeastOnce());
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void finishBuildingFrancaArrayType() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaArrayType);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals(DUMMY_NAME, resultUsing.name);
    assertEquals(DUMMY_FQN, resultUsing.fullyQualifiedName);
    assertTrue(resultUsing.getDefinition() instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) resultUsing.getDefinition();
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.getTemplateClass());
    assertEquals(1, cppTemplateTypeRef.getTemplateParameters().size());
    assertEquals(cppComplexTypeRef, cppTemplateTypeRef.getTemplateParameters().get(0));
  }

  @Test
  public void finishBuildingFrancaMapType() {
    CppTypeRef mapTypeRef = CppPrimitiveTypeRef.Companion.getINT8();
    when(typeMapper.wrapMap(any(), any())).thenReturn(mapTypeRef);
    CppTypeRef cppPrimitiveTypeRef = CppPrimitiveTypeRef.Companion.getINT8();
    contextStack.injectResult(cppPrimitiveTypeRef);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaMapType);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals(DUMMY_NAME, resultUsing.name);
    assertEquals(DUMMY_FQN, resultUsing.fullyQualifiedName);
    assertEquals(mapTypeRef, resultUsing.getDefinition());
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
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.getTemplateClass());
    assertEquals(1, cppTemplateTypeRef.getTemplateParameters().size());
    assertEquals(cppComplexTypeRef, cppTemplateTypeRef.getTemplateParameters().get(0));

    verify(typeMapper).map(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsName() {
    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFinalResult(CppEnum.class);
    assertNotNull(resultEnum);
    assertEquals(DUMMY_NAME, resultEnum.name);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsEnumItems() {
    CppEnumItem cppEnumItem = new CppEnumItem(NONSENSE_NAME, null);
    contextStack.injectResult(cppEnumItem);

    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFinalResult(CppEnum.class);
    assertNotNull(resultEnum);
    assertFalse(resultEnum.getItems().isEmpty());
    assertEquals(cppEnumItem, resultEnum.getItems().get(0));
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
    assertTrue(resultEnum.isExternal());
  }

  @Test
  public void finishBuildingFrancaEnumerator() {
    modelBuilder.finishBuilding(francaEnumerator);

    CppEnumItem cppEnumItem = modelBuilder.getFinalResult(CppEnumItem.class);
    assertNotNull(cppEnumItem);
    assertEquals(DUMMY_NAME, cppEnumItem.name);
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
    when(nameResolver.getGetterName(any())).thenReturn(NONSENSE_NAME);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(NONSENSE_NAME, resultMethod.name);
    assertEquals(DUMMY_FQN, resultMethod.fullyQualifiedName);
    assertTrue(resultMethod.getQualifiers().contains(CppMethod.Qualifier.CONST));
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    when(nameResolver.getSetterName(any())).thenReturn(NONSENSE_NAME);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());
    CppMethod resultMethod = methods.get(1);
    assertEquals(NONSENSE_NAME, resultMethod.name);
    assertEquals(DUMMY_FQN, resultMethod.fullyQualifiedName);
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    when(nameResolver.getGetterName(any())).thenReturn(NONSENSE_NAME);
    contextStack.injectResult(cppComplexTypeRef);
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(1, methods.size());
    assertEquals(NONSENSE_NAME, methods.get(0).name);
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoGetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(cppComplexTypeRef, resultMethod.getReturnType());
    assertTrue(resultMethod.getParameters().isEmpty());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoSetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());

    CppMethod resultMethod = methods.get(1);
    assertEquals(CppPrimitiveTypeRef.Companion.getVOID(), resultMethod.getReturnType());
    assertFalse(resultMethod.getParameters().isEmpty());
    assertEquals(cppComplexTypeRef, resultMethod.getParameters().get(0).type);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesNotNullGetter() {
    when(deploymentModel.isNotNull(any())).thenReturn(true);
    when(nameResolver.getGetterName(any())).thenReturn(NONSENSE_NAME);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertTrue(resultMethod.isNotNull());
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesNotNullSetter() {
    when(deploymentModel.isNotNull(any())).thenReturn(true);
    when(nameResolver.getSetterName(any())).thenReturn(NONSENSE_NAME);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());
    CppMethod setterMethod = methods.get(1);
    assertEquals(1, setterMethod.getParameters().size());
    assertTrue(setterMethod.getParameters().get(0).isNotNull());
  }

  @Test
  public void finishBuildingFrancaAttributeWithStatic() {
    when(deploymentModel.isStatic(any(FAttribute.class))).thenReturn(true);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());
    assertTrue(methods.get(0).getSpecifiers().contains(Specifier.STATIC));
    assertTrue(methods.get(1).getSpecifiers().contains(Specifier.STATIC));
  }
}
