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

package com.here.ivi.api.generator.baseapi;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.generator.cpp.CppDefaultInitializer;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.cpp.CppTypeMapper;
import com.here.ivi.api.generator.cpp.CppValueMapper;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.test.MockContextStack;
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
@PrepareForTest({
  CppCommentParser.class,
  InstanceRules.class,
  CppDefaultInitializer.class,
  CppValueMapper.class,
  CppNameRules.class
})
@SuppressWarnings({
  "PMD.TooManyFields",
  "PMD.TooManyMethods",
  "PMD.CouplingBetweenObjects",
  "PMD.ExcessivePublicCount"
})
public class CppModelBuilderTest {

  private static final String STRUCT_NAME = "structural";
  private static final String FIELD_NAME = "flowers";
  private static final String CONSTANT_NAME = "permanent";
  private static final String ENUM_NAME = "innumerable";
  private static final String UNION_NAME = "soviet";
  private static final String METHOD_NAME = "methodical";
  private static final String ATTRIBUTE_NAME = "tribute";
  private static final String FULLY_QUALIFIED_NAME = "FullyQualifiedNonsense";
  private static final String CONSTANT_FULLY_QUALIFIED_NAME = "ConstantFullyQualifiedNonsense";

  private final MockContextStack<CppElement> contextStack = new MockContextStack<>();

  @Mock private FrancaElement rootModel;
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
  @Mock private FUnionType francaUnionType;
  @Mock private FAttribute francaAttribute;

  private CppModelBuilder modelBuilder;

  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("typically").build();

  private final CppMethod cppMethod = new CppMethod.Builder("classical").build();
  private final CppValue cppValue = new CppValue("valuable");
  private final CppEnum cppEnum = CppEnum.create(ENUM_NAME);
  private final CppStruct cppStruct = new CppStruct(STRUCT_NAME);
  private final CppTypeRef cppTypeRef = CppPrimitiveTypeRef.INT64;
  private final CppUsing cppUsing = new CppUsing("useful", new CppTypeDefRef("useful", cppTypeRef));

  @Before
  public void setUp() {
    PowerMockito.mockStatic(
        CppCommentParser.class,
        InstanceRules.class,
        CppDefaultInitializer.class,
        CppValueMapper.class);

    MockitoAnnotations.initMocks(this);

    modelBuilder = new CppModelBuilder(contextStack, rootModel, typeMapper, valueMapper);

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
    when(francaUnionType.getName()).thenReturn(UNION_NAME);
    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    when(francaMethod.getInArgs()).thenReturn(new ArrayEList<>());
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef);
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaAnotherTypeRef);
    when(francaConstant.getRhs()).thenReturn(francaInitializerExpression);

    when(CppCommentParser.parse(any(FModelElement.class)))
        .thenReturn(new AbstractFrancaCommentParser.Comments());
    when(CppCommentParser.parse(any(FMethod.class)))
        .thenReturn(new AbstractFrancaCommentParser.Comments());

    PowerMockito.stub(PowerMockito.method(CppNameRules.class, "getFullyQualifiedName", FType.class))
        .toReturn(FULLY_QUALIFIED_NAME);

    PowerMockito.stub(PowerMockito.method(CppNameRules.class, "getConstantFullyQualifiedName"))
        .toReturn(CONSTANT_FULLY_QUALIFIED_NAME);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsName() {
    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertTrue(cppClass.name.toLowerCase().startsWith("classy"));

    verify(francaInterface).getName();
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
  public void finishBuildingFrancaMethodReadsName() {
    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(METHOD_NAME, resultMethod.name);
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
    when(rootModel.isStatic(francaMethod)).thenReturn(true);

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
  public void finishBuildingFrancaMethodMapsErrorEnum() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnumerationType);
    when(typeMapper.mapEnum(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(cppComplexTypeRef, resultMethod.returnType);

    verify(typeMapper).mapEnum(francaEnumerationType);
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
    final CppConstant cppConstant = new CppConstant(CONSTANT_NAME, cppComplexTypeRef, cppValue);
    contextStack.injectResult(cppConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppConstant result = modelBuilder.getFinalResult(CppConstant.class);
    assertEquals(cppConstant, result);
  }

  @Test
  public void finishBuildingFrancaConstantMapsValue() {
    when(valueMapper.map(any(), any(FInitializerExpression.class))).thenReturn(cppValue);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaConstant);

    CppConstant cppConstant = modelBuilder.getFinalResult(CppConstant.class);
    assertNotNull(cppConstant);
    assertEquals(CONSTANT_FULLY_QUALIFIED_NAME, cppConstant.fullyQualifiedName);
    assertEquals(cppValue, cppConstant.value);

    verify(valueMapper).map(cppComplexTypeRef, francaInitializerExpression);
  }

  @Test
  public void finishBuildingFrancaConstantReadsTypeRef() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaConstant);

    CppConstant cppConstant = modelBuilder.getFinalResult(CppConstant.class);
    assertNotNull(cppConstant);
    assertEquals(cppComplexTypeRef, cppConstant.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    when(CppDefaultInitializer.map(any(FField.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(FIELD_NAME, cppField.name);
    assertEquals(cppValue, cppField.initializer);

    PowerMockito.verifyStatic();
    CppDefaultInitializer.map(francaField);
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
  public void finishBuildingFrancaStructTypeReadsName() {
    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertEquals(STRUCT_NAME, resultStruct.name.toLowerCase());
    assertEquals(FULLY_QUALIFIED_NAME, resultStruct.fullyQualifiedName);

    verify(francaStructType).getName();

    PowerMockito.verifyStatic();
    CppNameRules.getFullyQualifiedName(francaStructType);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    final CppField cppField = new CppField(cppComplexTypeRef, FIELD_NAME);
    contextStack.injectResult(cppField);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertFalse(resultStruct.fields.isEmpty());
    assertEquals(cppField, resultStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsInheritance() {
    FStructType anotherFrancaStruct = mock(FStructType.class);
    when(francaStructType.getBase()).thenReturn(anotherFrancaStruct);
    when(typeMapper.mapStruct(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertEquals(1, resultStruct.inheritances.size());

    CppInheritance cppInheritance = resultStruct.inheritances.iterator().next();
    assertEquals(cppComplexTypeRef, cppInheritance.parent);
    assertEquals(CppInheritance.Type.Public, cppInheritance.visibility);

    verify(typeMapper).mapStruct(anotherFrancaStruct);
  }

  @Test
  public void finishBuildingFrancaTypeDefInstanceId() {
    when(InstanceRules.isInstanceId(any())).thenReturn(true);

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
    assertEquals(cppComplexTypeRef, resultUsing.definition);

    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void finishBuildingFrancaArrayType() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaArrayType);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("relay", resultUsing.name.toLowerCase());
    assertTrue(resultUsing.definition instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) resultUsing.definition;
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.templateClass);
    assertEquals(1, cppTemplateTypeRef.templateParameters.size());
    assertEquals(cppComplexTypeRef, cppTemplateTypeRef.templateParameters.get(0));
  }

  @Test
  public void finishBuildingFrancaMapType() {
    CppTypeRef cppPrimitiveTypeRef = CppPrimitiveTypeRef.INT8;
    contextStack.injectResult(cppPrimitiveTypeRef);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaMapType);

    CppUsing resultUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("tigers", resultUsing.name.toLowerCase());
    assertTrue(resultUsing.definition instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) resultUsing.definition;
    assertEquals(CppTemplateTypeRef.TemplateClass.MAP, cppTemplateTypeRef.templateClass);
    assertEquals(2, cppTemplateTypeRef.templateParameters.size());
    assertEquals(cppPrimitiveTypeRef, cppTemplateTypeRef.templateParameters.get(0));
    assertEquals(cppComplexTypeRef, cppTemplateTypeRef.templateParameters.get(1));
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
    assertEquals(ENUM_NAME, resultEnum.name.toLowerCase());
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
  public void finishBuildingFrancaEnumerator() {
    modelBuilder.finishBuilding(francaEnumerator);

    CppEnumItem cppEnumItem = modelBuilder.getFinalResult(CppEnumItem.class);
    assertNotNull(cppEnumItem);
    assertEquals("enumerated", cppEnumItem.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaExpression() {
    when(CppValueMapper.map(any(FExpression.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaExpression);

    CppValue result = modelBuilder.getFinalResult(CppValue.class);
    assertEquals(cppValue, result);

    PowerMockito.verifyStatic();
    CppValueMapper.map(francaExpression);
  }

  @Test
  public void finishBuildingFrancaUnionTypeReadsName() {
    modelBuilder.finishBuilding(francaUnionType);

    CppTaggedUnion cppTaggedUnion = modelBuilder.getFinalResult(CppTaggedUnion.class);
    assertNotNull(cppTaggedUnion);
    assertEquals(UNION_NAME, cppTaggedUnion.name.toLowerCase());
    assertEquals(FULLY_QUALIFIED_NAME, cppTaggedUnion.fullyQualifiedName);

    verify(francaUnionType).getName();

    PowerMockito.verifyStatic();
    CppNameRules.getFullyQualifiedName(francaUnionType);
  }

  @Test
  public void finishBuildingFrancaUnionTypeReadsFields() {
    final CppField cppField = new CppField(cppComplexTypeRef, FIELD_NAME);
    contextStack.injectResult(cppField);

    modelBuilder.finishBuilding(francaUnionType);

    CppStruct resultStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertFalse(resultStruct.fields.isEmpty());
    assertEquals(cppField, resultStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesGetter() {
    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals("get" + ATTRIBUTE_NAME, resultMethod.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());
    assertEquals("set" + ATTRIBUTE_NAME, methods.get(1).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(1, methods.size());
    assertEquals("get" + ATTRIBUTE_NAME, methods.get(0).name.toLowerCase());
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
}
