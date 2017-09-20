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
  CppMethodMapper.class,
  CppCommentParser.class,
  InstanceRules.class,
  CppDefaultInitializer.class,
  CppValueMapper.class,
  CppNameRules.class
})
@SuppressWarnings({"PMD.TooManyFields", "PMD.TooManyMethods", "PMD.CouplingBetweenObjects"})
public class CppModelBuilderTest {

  private static final String STRUCT_NAME = "structural";
  private static final String FIELD_NAME = "flowers";
  private static final String CONSTANT_NAME = "permanent";
  private static final String ENUM_NAME = "innumerable";
  private static final String UNION_NAME = "soviet";
  private static final String METHOD_NAME = "methodical";
  private static final String ATTRIBUTE_NAME = "tribute";

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
  private final CppEnum cppEnum = new CppEnum(ENUM_NAME);
  private final CppStruct cppStruct = new CppStruct(STRUCT_NAME);
  private final CppTypeRef cppTypeRef = CppPrimitiveTypeRef.INT64;
  private final CppUsing cppUsing = new CppUsing("useful", new CppTypeDefRef("useful", cppTypeRef));

  @Before
  public void setUp() {
    PowerMockito.mockStatic(
        CppMethodMapper.class,
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
    when(francaField.getType()).thenReturn(francaTypeRef);
    when(francaConstant.getRhs()).thenReturn(francaInitializerExpression);

    when(CppMethodMapper.mapMethodReturnType(any(), any()))
        .thenReturn(new CppMethodMapper.ReturnTypeData(cppComplexTypeRef, "no comments"));
    when(CppCommentParser.parse(any(FModelElement.class)))
        .thenReturn(new AbstractFrancaCommentParser.Comments());
    when(CppCommentParser.parse(any(FMethod.class)))
        .thenReturn(new AbstractFrancaCommentParser.Comments());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsName() {
    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertTrue(cppClass.name.toLowerCase().startsWith("classy"));

    verify(francaInterface).getName();
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    contextStack.injectResult(cppMethod);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.methods.isEmpty());
    assertEquals(cppMethod, cppClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStructs() {
    contextStack.injectResult(cppStruct);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.structs.isEmpty());
    assertEquals(cppStruct, cppClass.structs.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnums() {
    contextStack.injectResult(cppEnum);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.enums.isEmpty());
    assertEquals(cppEnum, cppClass.enums.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsUsings() {
    contextStack.injectResult(cppUsing);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(1, cppClass.usings.size());
    assertEquals(cppUsing, cppClass.usings.iterator().next());
  }

  @Test
  public void finishBuildingFrancaMethodReadsName() {
    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(METHOD_NAME, resultMethod.name);
  }

  @Test
  public void finishBuildingFrancaMethodOmitsSelector() {
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(METHOD_NAME, resultMethod.name);
  }

  @Test
  public void finishBuildingFrancaMethodReadsReturnTypeData() {
    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(cppComplexTypeRef, resultMethod.returnType);
    assertTrue(resultMethod.comment.endsWith("no comments"));
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticFlag() {
    when(rootModel.isStatic(francaMethod)).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertTrue(resultMethod.specifiers.contains(CppMethod.Specifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodReadsInputParameters() {
    CppParameter cppParameter = new CppParameter("flowers", null);
    contextStack.injectResult(cppParameter);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);

    List<CppParameter> cppParameters = resultMethod.parameters;
    assertFalse(cppParameters.isEmpty());
    assertEquals(cppParameter, cppParameters.get(0));
  }

  @Test
  public void finishBuildingInputArgumentReadsName() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFirstResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals("flowers", cppParameter.name);
  }

  @Test
  public void finishBuildingInputArgumentMapsType() {
    when(typeMapper.map(any(FTypedElement.class))).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFirstResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(cppComplexTypeRef, cppParameter.type);

    verify(typeMapper).map(francaArgument);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsStructs() {
    contextStack.injectResult(cppStruct);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppStruct result = modelBuilder.getFirstResult(CppStruct.class);
    assertEquals(cppStruct, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsUsings() {
    contextStack.injectResult(cppUsing);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppUsing result = modelBuilder.getFirstResult(CppUsing.class);
    assertEquals(cppUsing, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsEnums() {
    contextStack.injectResult(cppEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppEnum result = modelBuilder.getFirstResult(CppEnum.class);
    assertEquals(cppEnum, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsConstants() {
    final CppConstant cppConstant = new CppConstant(CONSTANT_NAME, cppComplexTypeRef, cppValue);
    contextStack.injectResult(cppConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppConstant result = modelBuilder.getFirstResult(CppConstant.class);
    assertEquals(cppConstant, result);
  }

  @Test
  public void finishBuildingFrancaConstant() {
    when(typeMapper.map(any(FConstantDef.class))).thenReturn(cppComplexTypeRef);
    when(valueMapper.map(any(), any(FInitializerExpression.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaConstant);

    CppConstant cppConstant = modelBuilder.getFirstResult(CppConstant.class);
    assertNotNull(cppConstant);
    assertEquals(CONSTANT_NAME, cppConstant.name.toLowerCase());
    assertEquals(cppComplexTypeRef, cppConstant.type);
    assertEquals(cppValue, cppConstant.value);

    verify(typeMapper).map(francaConstant);
    verify(valueMapper).map(cppComplexTypeRef, francaInitializerExpression);
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    when(CppDefaultInitializer.map(any(FField.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFirstResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(FIELD_NAME, cppField.name);
    assertEquals(cppValue, cppField.initializer);

    PowerMockito.verifyStatic();
    CppDefaultInitializer.map(francaField);
  }

  @Test
  public void finishBuildingFrancaFieldReadsType() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFirstResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(cppComplexTypeRef, cppField.type);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsName() {
    PowerMockito.mockStatic(CppNameRules.class);
    when(CppNameRules.getStructName(any())).thenReturn(STRUCT_NAME);
    when(CppNameRules.getFullyQualifiedName(any())).thenReturn(STRUCT_NAME);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFirstResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertEquals(STRUCT_NAME, resultStruct.name.toLowerCase());

    PowerMockito.verifyStatic();
    CppNameRules.getStructName(STRUCT_NAME);

    PowerMockito.verifyStatic();
    CppNameRules.getFullyQualifiedName(francaStructType);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    PowerMockito.mockStatic(CppNameRules.class);
    when(CppNameRules.getStructName(any())).thenReturn(STRUCT_NAME);
    when(CppNameRules.getFullyQualifiedName(any())).thenReturn(STRUCT_NAME);

    final CppField cppField = new CppField(cppComplexTypeRef, FIELD_NAME);
    contextStack.injectResult(cppField);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFirstResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertFalse(resultStruct.fields.isEmpty());
    assertEquals(cppField, resultStruct.fields.get(0));

    PowerMockito.verifyStatic();
    CppNameRules.getStructName(STRUCT_NAME);

    PowerMockito.verifyStatic();
    CppNameRules.getFullyQualifiedName(francaStructType);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsInheritance() {
    PowerMockito.mockStatic(CppNameRules.class);
    when(CppNameRules.getStructName(any())).thenReturn(STRUCT_NAME);
    when(CppNameRules.getFullyQualifiedName(any())).thenReturn(STRUCT_NAME);

    when(typeMapper.mapStruct(any())).thenReturn(cppComplexTypeRef);
    when(francaStructType.getBase()).thenReturn(mock(FStructType.class));

    modelBuilder.finishBuilding(francaStructType);

    CppStruct resultStruct = modelBuilder.getFirstResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertEquals(1, resultStruct.inheritances.size());

    CppInheritance cppInheritance = resultStruct.inheritances.iterator().next();
    assertEquals(cppComplexTypeRef, cppInheritance.parent);
    assertEquals(CppInheritance.Type.Public, cppInheritance.visibility);

    typeMapper.mapStruct(francaStructType);

    PowerMockito.verifyStatic();
    CppNameRules.getStructName(STRUCT_NAME);

    PowerMockito.verifyStatic();
    CppNameRules.getFullyQualifiedName(francaStructType);
  }

  @Test
  public void finishBuildingFrancaTypeDefInstanceId() {
    when(InstanceRules.isInstanceId(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeDef);

    CppUsing resultUsing = modelBuilder.getFirstResult(CppUsing.class);
    assertNull(resultUsing);

    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void finishBuildingFrancaTypeDefNotInstanceId() {
    when(typeMapper.map(any(FTypeRef.class))).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaTypeDef);

    CppUsing resultUsing = modelBuilder.getFirstResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("definitely", resultUsing.name.toLowerCase());
    assertEquals(cppComplexTypeRef, resultUsing.definition);

    verify(typeMapper).map(francaTypeRef);

    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void finishBuildingFrancaArrayType() {
    when(typeMapper.mapArray(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaArrayType);

    CppUsing resultUsing = modelBuilder.getFirstResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("relay", resultUsing.name.toLowerCase());
    assertEquals(cppComplexTypeRef, resultUsing.definition);

    verify(typeMapper).mapArray(francaArrayType);
  }

  @Test
  public void finishBuildingFrancaMapType() {
    when(typeMapper.mapMapType(any())).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaMapType);

    CppUsing resultUsing = modelBuilder.getFirstResult(CppUsing.class);
    assertNotNull(resultUsing);
    assertEquals("tigers", resultUsing.name.toLowerCase());
    assertEquals(cppComplexTypeRef, resultUsing.definition);

    verify(typeMapper).mapMapType(francaMapType);
  }

  @Test
  public void finishBuildingFrancaTypeRef() {
    when(typeMapper.map(any(FTypeRef.class))).thenReturn(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaTypeRef);

    CppComplexTypeRef result = modelBuilder.getFirstResult(CppComplexTypeRef.class);
    assertEquals(cppComplexTypeRef, result);

    verify(typeMapper).map(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsName() {
    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFirstResult(CppEnum.class);
    assertNotNull(resultEnum);
    assertEquals(ENUM_NAME, resultEnum.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsEnumItems() {
    CppEnumItem cppEnumItem = new CppEnumItem("enumerated");
    contextStack.injectResult(cppEnumItem);

    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum resultEnum = modelBuilder.getFirstResult(CppEnum.class);
    assertNotNull(resultEnum);
    assertFalse(resultEnum.items.isEmpty());
    assertEquals(cppEnumItem, resultEnum.items.get(0));
  }

  @Test
  public void finishBuildingFrancaEnumerator() {
    modelBuilder.finishBuilding(francaEnumerator);

    CppEnumItem cppEnumItem = modelBuilder.getFirstResult(CppEnumItem.class);
    assertNotNull(cppEnumItem);
    assertEquals("enumerated", cppEnumItem.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaExpression() {
    when(CppValueMapper.map(any(FExpression.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaExpression);

    CppValue result = modelBuilder.getFirstResult(CppValue.class);
    assertEquals(cppValue, result);

    PowerMockito.verifyStatic();
    CppValueMapper.map(francaExpression);
  }

  @Test
  public void finishBuildingFrancaUnionTypeReadsName() {
    PowerMockito.mockStatic(CppNameRules.class);
    when(CppNameRules.getStructName(any())).thenReturn(UNION_NAME);
    when(CppNameRules.getFullyQualifiedName(any())).thenReturn(UNION_NAME);

    modelBuilder.finishBuilding(francaUnionType);

    CppTaggedUnion cppTaggedUnion = modelBuilder.getFirstResult(CppTaggedUnion.class);
    assertNotNull(cppTaggedUnion);
    assertEquals(UNION_NAME, cppTaggedUnion.name.toLowerCase());

    PowerMockito.verifyStatic();
    CppNameRules.getStructName(UNION_NAME);

    PowerMockito.verifyStatic();
    CppNameRules.getFullyQualifiedName(francaUnionType);
  }

  @Test
  public void finishBuildingFrancaUnionTypeReadsFields() {
    PowerMockito.mockStatic(CppNameRules.class);
    when(CppNameRules.getStructName(any())).thenReturn(UNION_NAME);
    when(CppNameRules.getFullyQualifiedName(any())).thenReturn(UNION_NAME);

    final CppField cppField = new CppField(cppComplexTypeRef, FIELD_NAME);
    contextStack.injectResult(cppField);

    modelBuilder.finishBuilding(francaUnionType);

    CppStruct resultStruct = modelBuilder.getFirstResult(CppStruct.class);
    assertNotNull(resultStruct);
    assertFalse(resultStruct.fields.isEmpty());
    assertEquals(cppField, resultStruct.fields.get(0));

    PowerMockito.verifyStatic();
    CppNameRules.getStructName(UNION_NAME);

    PowerMockito.verifyStatic();
    CppNameRules.getFullyQualifiedName(francaUnionType);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesGetter() {
    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals("get" + ATTRIBUTE_NAME, resultMethod.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), CppMethod.class);
    assertEquals(2, methods.size());
    assertEquals("set" + ATTRIBUTE_NAME, methods.get(1).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), CppMethod.class);
    assertEquals(1, methods.size());
    assertEquals("get" + ATTRIBUTE_NAME, methods.get(0).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoGetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertEquals(cppComplexTypeRef, resultMethod.returnType);
    assertTrue(resultMethod.parameters.isEmpty());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoSetter() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), CppMethod.class);
    assertEquals(2, methods.size());

    CppMethod resultMethod = methods.get(1);
    assertEquals(CppPrimitiveTypeRef.VOID, resultMethod.returnType);
    assertFalse(resultMethod.parameters.isEmpty());
    assertEquals(cppComplexTypeRef, resultMethod.parameters.get(0).type);
  }

  @Test
  public void finishBuildingFrancaAttributeWrapsArrayTypeIntoVector() {
    when(francaAttribute.isArray()).thenReturn(true);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaAttribute);

    CppMethod resultMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(resultMethod);
    assertTrue(resultMethod.returnType instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) resultMethod.returnType;
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.templateClass);
    assertEquals(1, cppTemplateTypeRef.templateParameters.size());
    assertEquals(cppComplexTypeRef, cppTemplateTypeRef.templateParameters.get(0));
  }
}
