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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.same;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.cpp.CppDefaultInitializer;
import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.generator.common.cpp.CppValueMapper;
import com.here.ivi.api.generator.common.cpp.TypeGenerationHelper;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppTypeDef;
import com.here.ivi.api.model.cppmodel.CppValue;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import com.here.ivi.api.test.ArrayEList;
import java.util.ArrayList;
import java.util.List;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FField;
import org.franca.core.franca.FInitializerExpression;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({
  StubMethodMapper.class,
  TypeGenerationHelper.class,
  StubCommentParser.class,
  InstanceRules.class,
  CppTypeMapper.class,
  DefinedBy.class,
  CppDefaultInitializer.class,
  CppValueMapper.class
})
public class StubModelBuilderTest {

  private static final String CLASS_NAME = "classy";
  private static final String RETURN_TYPE_COMMENT = "no comments";
  private static final String PARAMETER_NAME = "flowers";
  private static final String STRUCT_NAME = "structural";
  private static final String TYPE_DEF_NAME = "definitely";
  private static final String ARRAY_NAME = "relay";
  private static final String MAP_NAME = "tigers";
  private static final String FIELD_NAME = "flowers";
  private static final String CONSTANT_NAME = "permanent";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private ModelBuilderContextStack<CppElement> contextStack;

  @Mock private FrancaElement<BaseApiSpec.IDataPropertyAccessor> rootModel;
  @Mock private BaseApiSpec.IDataPropertyAccessor propertyAccessor;
  @Mock private BaseApiSpec.InterfacePropertyAccessor interfacePropertyAccessor;

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

  private StubModelBuilder modelBuilder;

  private final CppCustomType cppCustomType = new CppCustomType("typically");
  private final CppMethod cppMethod = new CppMethod.Builder("classical").build();
  private final CppValue cppValue = new CppValue("valuable");
  private final CppEnum cppEnum = new CppEnum("innumerable");
  private final CppStruct cppStruct = new CppStruct(STRUCT_NAME);

  private void injectResult(CppElement element) {
    contextStack.getCurrentContext().previousResults.add(element);
  }

  @Before
  public void setUp() {
    PowerMockito.mockStatic(
        StubMethodMapper.class,
        TypeGenerationHelper.class,
        StubCommentParser.class,
        InstanceRules.class,
        CppTypeMapper.class,
        DefinedBy.class,
        CppDefaultInitializer.class,
        CppValueMapper.class);
    MockitoAnnotations.initMocks(this);

    modelBuilder = new StubModelBuilder(contextStack, rootModel);

    contextStack.getCurrentContext().currentResults = new ArrayList<>();
    contextStack.getCurrentContext().previousResults = new ArrayList<>();
    contextStack.getParentContext().previousResults = new ArrayList<>();

    when(rootModel.getPropertyAccessor()).thenReturn(propertyAccessor);

    when(francaInterface.getName()).thenReturn(CLASS_NAME);
    when(francaArgument.getName()).thenReturn(PARAMETER_NAME);
    when(francaStructType.getName()).thenReturn(STRUCT_NAME);
    when(francaTypeDef.getName()).thenReturn(TYPE_DEF_NAME);
    when(francaArrayType.getName()).thenReturn(ARRAY_NAME);
    when(francaMapType.getName()).thenReturn(MAP_NAME);
    when(francaField.getName()).thenReturn(FIELD_NAME);
    when(francaConstant.getName()).thenReturn(CONSTANT_NAME);

    when(francaMethod.getInArgs()).thenReturn(new ArrayEList<>());
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef);
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaAnotherTypeRef);
    when(francaField.getType()).thenReturn(francaTypeRef);
    when(francaConstant.getRhs()).thenReturn(francaInitializerExpression);

    when(StubMethodMapper.mapMethodReturnType(any(), any()))
        .thenReturn(new StubMethodMapper.ReturnTypeData(cppCustomType, RETURN_TYPE_COMMENT));
    when(StubCommentParser.parse(any(FModelElement.class)))
        .thenReturn(new AbstractFrancaCommentParser.Comments());
    when(StubCommentParser.parse(any(FMethod.class)))
        .thenReturn(new AbstractFrancaCommentParser.Comments());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsName() {
    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertTrue(cppClass.name.toLowerCase().startsWith(CLASS_NAME));

    verify(francaInterface).getName();
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    injectResult(cppMethod);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.methods.isEmpty());
    assertEquals(cppMethod, cppClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStructs() {
    injectResult(cppStruct);

    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFirstResult(CppClass.class);
    assertNotNull(cppClass);
    assertFalse(cppClass.structs.isEmpty());
    assertEquals(cppStruct, cppClass.structs.iterator().next());
  }

  @Test
  public void finishBuildingFrancaMethodReadsReturnTypeData() {
    modelBuilder.finishBuilding(francaMethod);

    CppMethod cppMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(cppMethod);
    assertEquals(cppCustomType, cppMethod.getReturnType());
    assertTrue(cppMethod.comment.endsWith(RETURN_TYPE_COMMENT));
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticFlag() {
    when(interfacePropertyAccessor.getStatic(francaMethod)).thenReturn(true);
    when(rootModel.getPropertyAccessor()).thenReturn(interfacePropertyAccessor);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod cppMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(cppMethod);
    assertTrue(cppMethod.getSpecifiers().contains(CppMethod.Specifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodReadsInputParameters() {
    CppParameter cppParameter = new CppParameter();
    cppParameter.name = "flowers";
    injectResult(cppParameter);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod cppMethod = modelBuilder.getFirstResult(CppMethod.class);
    assertNotNull(cppMethod);

    List<CppParameter> cppParameters = cppMethod.getInParameters();
    assertFalse(cppParameters.isEmpty());
    assertEquals(cppParameter, cppParameters.get(0));
  }

  @Test
  public void finishBuildingInputArgumentReadsName() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFirstResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(PARAMETER_NAME, cppParameter.name);
    assertEquals(CppParameter.Mode.Input, cppParameter.mode);
  }

  @Test
  public void finishBuildingInputArgumentMapsType() {
    when(StubMethodMapper.mapArgumentType(any(), any(), any())).thenReturn(cppCustomType);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFirstResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(cppCustomType, cppParameter.type);

    PowerMockito.verifyStatic();
    StubMethodMapper.mapArgumentType(same(francaArgument), same(null), same(rootModel));
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsStructs() {
    injectResult(cppStruct);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppStruct result = modelBuilder.getFirstResult(CppStruct.class);
    assertEquals(cppStruct, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsTypeDefs() {
    CppTypeDef cppTypeDef = new CppTypeDef();
    cppTypeDef.name = TYPE_DEF_NAME;
    injectResult(cppTypeDef);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppTypeDef result = modelBuilder.getFirstResult(CppTypeDef.class);
    assertEquals(cppTypeDef, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsEnums() {
    injectResult(cppEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppEnum result = modelBuilder.getFirstResult(CppEnum.class);
    assertEquals(cppEnum, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsConstants() {
    final CppConstant cppConstant = new CppConstant(CONSTANT_NAME, cppCustomType, cppValue);
    injectResult(cppConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppConstant result = modelBuilder.getFirstResult(CppConstant.class);
    assertEquals(cppConstant, result);
  }

  @Test
  public void finishBuildingFrancaConstant() {
    when(CppTypeMapper.map(any(), any(FConstantDef.class))).thenReturn(cppCustomType);
    when(CppValueMapper.map(any(), any(FInitializerExpression.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaConstant);

    CppConstant cppConstant = modelBuilder.getFirstResult(CppConstant.class);
    assertNotNull(cppConstant);
    assertEquals(CONSTANT_NAME, cppConstant.name.toLowerCase());
    assertEquals(cppCustomType, cppConstant.type);
    assertEquals(cppValue, cppConstant.value);

    PowerMockito.verifyStatic();
    CppTypeMapper.map(same(rootModel), same(francaConstant));
    PowerMockito.verifyStatic();
    CppValueMapper.map(same(cppCustomType), same(francaInitializerExpression));
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    when(CppDefaultInitializer.map(any(FTypedElement.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFirstResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(FIELD_NAME, cppField.name);
    assertEquals(cppValue, cppField.initializer);

    PowerMockito.verifyStatic();
    CppDefaultInitializer.map(same(francaField));
  }

  @Test
  public void finishBuildingFrancaFieldReadsType() {
    injectResult(cppCustomType);

    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFirstResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(cppCustomType, cppField.type);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsName() {
    modelBuilder.finishBuilding(francaStructType);

    CppStruct cppStruct = modelBuilder.getFirstResult(CppStruct.class);
    assertNotNull(cppStruct);
    assertEquals(STRUCT_NAME, cppStruct.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    final CppField cppField = new CppField(cppCustomType, FIELD_NAME);
    injectResult(cppField);

    modelBuilder.finishBuilding(francaStructType);

    CppStruct cppStruct = modelBuilder.getFirstResult(CppStruct.class);
    assertNotNull(cppStruct);
    assertFalse(cppStruct.fields.isEmpty());
    assertEquals(cppField, cppStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaTypeDefInstanceId() {
    when(InstanceRules.isInstanceId(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeDef);

    CppTypeDef cppTypeDef = modelBuilder.getFirstResult(CppTypeDef.class);
    assertNull(cppTypeDef);
  }

  @Test
  public void finishBuildingFrancaTypeDefNotInstanceId() {
    when(CppTypeMapper.map(any(), any(FTypeRef.class))).thenReturn(cppCustomType);

    modelBuilder.finishBuilding(francaTypeDef);

    CppTypeDef cppTypeDef = modelBuilder.getFirstResult(CppTypeDef.class);
    assertNotNull(cppTypeDef);
    assertEquals(TYPE_DEF_NAME, cppTypeDef.name.toLowerCase());
    assertEquals(cppCustomType, cppTypeDef.targetType);

    PowerMockito.verifyStatic();
    CppTypeMapper.map(rootModel, francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaArrayType() {
    when(CppTypeMapper.defineArray(any(), any())).thenReturn(cppCustomType);

    modelBuilder.finishBuilding(francaArrayType);

    CppTypeDef cppTypeDef = modelBuilder.getFirstResult(CppTypeDef.class);
    assertNotNull(cppTypeDef);
    assertEquals(ARRAY_NAME, cppTypeDef.name.toLowerCase());
    assertEquals(cppCustomType, cppTypeDef.targetType);

    PowerMockito.verifyStatic();
    CppTypeMapper.defineArray(rootModel, francaArrayType);
  }

  @Test
  public void finishBuildingFrancaMapType() {
    CppCustomType keyType = new CppCustomType("really");
    CppCustomType valueType = new CppCustomType("valuable");
    when(CppTypeMapper.wrapMapType(any(), any(), any())).thenReturn(cppCustomType);
    when(CppTypeMapper.map(any(), same(francaTypeRef))).thenReturn(keyType);
    when(CppTypeMapper.map(any(), same(francaAnotherTypeRef))).thenReturn(valueType);
    when(DefinedBy.createFromFModelElement(any())).thenReturn(mock(DefinedBy.class));

    modelBuilder.finishBuilding(francaMapType);

    CppTypeDef cppTypeDef = modelBuilder.getFirstResult(CppTypeDef.class);
    assertNotNull(cppTypeDef);
    assertEquals(MAP_NAME, cppTypeDef.name.toLowerCase());
    assertEquals(cppCustomType, cppTypeDef.targetType);

    PowerMockito.verifyStatic();
    CppTypeMapper.wrapMapType(any(), same(keyType), same(valueType));
    PowerMockito.verifyStatic();
    CppTypeMapper.map(rootModel, francaTypeRef);
    PowerMockito.verifyStatic();
    CppTypeMapper.map(rootModel, francaAnotherTypeRef);
  }

  @Test
  public void finishBuildingFrancaEnumerationType() {
    when(TypeGenerationHelper.buildCppEnum(any())).thenReturn(cppEnum);

    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum result = modelBuilder.getFirstResult(CppEnum.class);
    assertEquals(cppEnum, result);

    PowerMockito.verifyStatic();
    TypeGenerationHelper.buildCppEnum(francaEnumerationType);
  }

  @Test
  public void finishBuildingFrancaTypeRef() {
    when(CppTypeMapper.map(any(), any(FTypeRef.class))).thenReturn(cppCustomType);

    modelBuilder.finishBuilding(francaTypeRef);

    CppCustomType result = modelBuilder.getFirstResult(CppCustomType.class);
    assertEquals(cppCustomType, result);

    PowerMockito.verifyStatic();
    CppTypeMapper.map(same(rootModel), same(francaTypeRef));
  }
}
