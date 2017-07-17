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
  CppDefaultInitializer.class
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

  private StubModelBuilder modelBuilder;

  private final CppCustomType cppCustomType = new CppCustomType("typically");
  private final CppMethod cppMethod = new CppMethod.Builder("classical").build();
  private final CppValue cppValue = new CppValue("valuable");
  private final CppConstant cppConstant = new CppConstant("permanent", cppCustomType, cppValue);
  private final CppEnum cppEnum = new CppEnum("innumerable");

  private CppElement getFirstResult() {
    List<CppElement> results = contextStack.getParentContext().previousResults;
    assertFalse(results.isEmpty());

    return results.get(0);
  }

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
        CppDefaultInitializer.class);
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

    when(francaMethod.getInArgs()).thenReturn(new ArrayEList<>());
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef);
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaAnotherTypeRef);
    when(francaField.getType()).thenReturn(francaTypeRef);

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

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppClass);
    assertTrue(((CppClass) result).name.toLowerCase().startsWith(CLASS_NAME));

    verify(francaInterface).getName();
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    injectResult(cppMethod);

    modelBuilder.finishBuilding(francaInterface);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppClass);

    CppClass cppClass = (CppClass) result;
    assertFalse(cppClass.methods.isEmpty());
    assertEquals(cppMethod, cppClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaMethodReadsReturnTypeData() {
    modelBuilder.finishBuilding(francaMethod);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppMethod);

    CppMethod cppMethod = (CppMethod) result;
    assertEquals(cppCustomType, cppMethod.getReturnType());
    assertTrue(cppMethod.comment.endsWith(RETURN_TYPE_COMMENT));
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticFlag() {
    when(interfacePropertyAccessor.getStatic(francaMethod)).thenReturn(true);
    when(rootModel.getPropertyAccessor()).thenReturn(interfacePropertyAccessor);

    modelBuilder.finishBuilding(francaMethod);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppMethod);

    assertTrue(((CppMethod) result).getSpecifiers().contains(CppMethod.Specifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodReadsInputParameters() {
    CppParameter cppParameter = new CppParameter();
    cppParameter.name = "flowers";
    injectResult(cppParameter);

    modelBuilder.finishBuilding(francaMethod);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppMethod);

    List<CppParameter> cppParameters = ((CppMethod) result).getInParameters();
    assertFalse(cppParameters.isEmpty());
    assertEquals(cppParameter, cppParameters.get(0));
  }

  @Test
  public void finishBuildingInputArgumentReadsName() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppParameter);

    CppParameter cppParameter = (CppParameter) result;
    assertEquals(PARAMETER_NAME, cppParameter.name);
    assertEquals(CppParameter.Mode.Input, cppParameter.mode);
  }

  @Test
  public void finishBuildingInputArgumentMapsType() {
    when(StubMethodMapper.mapArgumentType(any(), any(), any())).thenReturn(cppCustomType);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppParameter);

    assertEquals(cppCustomType, ((CppParameter) result).type);

    PowerMockito.verifyStatic();
    StubMethodMapper.mapArgumentType(same(francaArgument), same(null), same(rootModel));
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsStructs() {
    CppStruct cppStruct = new CppStruct();
    cppStruct.name = STRUCT_NAME;
    injectResult(cppStruct);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppElement result = getFirstResult();
    assertEquals(cppStruct, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsTypeDefs() {
    CppTypeDef cppTypeDef = new CppTypeDef();
    cppTypeDef.name = TYPE_DEF_NAME;
    injectResult(cppTypeDef);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppElement result = getFirstResult();
    assertEquals(cppTypeDef, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsEnums() {
    injectResult(cppEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppElement result = getFirstResult();
    assertEquals(cppEnum, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsConstants() {
    injectResult(cppConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    CppElement result = getFirstResult();
    assertEquals(cppConstant, result);
  }

  @Test
  public void finishBuildingFrancaConstant() {
    when(TypeGenerationHelper.buildCppConstant(any(), any())).thenReturn(cppConstant);

    modelBuilder.finishBuilding(francaConstant);

    CppElement result = getFirstResult();
    assertEquals(cppConstant, result);

    PowerMockito.verifyStatic();
    TypeGenerationHelper.buildCppConstant(rootModel, francaConstant);
  }

  @Test
  public void finishBuildingFrancaField() {
    when(CppTypeMapper.map(any(), any(FTypedElement.class))).thenReturn(cppCustomType);
    when(CppDefaultInitializer.map(any(FTypedElement.class))).thenReturn(cppValue);

    modelBuilder.finishBuilding(francaField);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppField);

    CppField cppField = (CppField) result;
    assertEquals(FIELD_NAME, cppField.name);
    assertEquals(cppCustomType, cppField.type);
    assertEquals(cppValue, cppField.initializer);

    PowerMockito.verifyStatic();
    CppTypeMapper.map(same(rootModel), same(francaField));
    CppDefaultInitializer.map(same(francaField));
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsName() {
    modelBuilder.finishBuilding(francaStructType);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppStruct);
    assertEquals(STRUCT_NAME, result.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    final CppField cppField = new CppField(cppCustomType, FIELD_NAME);
    injectResult(cppField);

    modelBuilder.finishBuilding(francaStructType);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppStruct);

    CppStruct cppStruct = (CppStruct) result;
    assertFalse(cppStruct.fields.isEmpty());
    assertEquals(cppField, cppStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaTypeDefInstanceId() {
    when(InstanceRules.isInstanceId(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeDef);

    List<CppElement> results = contextStack.getParentContext().previousResults;
    assertTrue(results.isEmpty());
  }

  @Test
  public void finishBuildingFrancaTypeDefNotInstanceId() {
    when(CppTypeMapper.map(any(), any(FTypeRef.class))).thenReturn(cppCustomType);

    modelBuilder.finishBuilding(francaTypeDef);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppTypeDef);

    CppTypeDef cppTypeDef = (CppTypeDef) result;
    assertEquals(TYPE_DEF_NAME, cppTypeDef.name.toLowerCase());
    assertEquals(cppCustomType, cppTypeDef.targetType);

    PowerMockito.verifyStatic();
    CppTypeMapper.map(rootModel, francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaArrayType() {
    when(CppTypeMapper.defineArray(any(), any())).thenReturn(cppCustomType);

    modelBuilder.finishBuilding(francaArrayType);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppTypeDef);

    CppTypeDef cppTypeDef = (CppTypeDef) result;
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

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppTypeDef);

    CppTypeDef cppTypeDef = (CppTypeDef) result;
    assertEquals(MAP_NAME, cppTypeDef.name.toLowerCase());
    assertEquals(cppCustomType, cppTypeDef.targetType);

    PowerMockito.verifyStatic();
    CppTypeMapper.wrapMapType(any(), same(keyType), same(valueType));
    CppTypeMapper.map(rootModel, francaTypeRef);
    CppTypeMapper.map(rootModel, francaAnotherTypeRef);
  }

  @Test
  public void finishBuildingFrancaEnumerationType() {
    when(TypeGenerationHelper.buildCppEnum(any())).thenReturn(cppEnum);

    modelBuilder.finishBuilding(francaEnumerationType);

    CppElement result = getFirstResult();
    assertEquals(cppEnum, result);

    PowerMockito.verifyStatic();
    TypeGenerationHelper.buildCppEnum(francaEnumerationType);
  }
}
