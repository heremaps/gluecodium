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
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.CommentHelper;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.test.MockContextStack;
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
@PrepareForTest({CommentHelper.class, DefinedBy.class, InstanceRules.class})
public class CppModelBuilderCommentsTest {

  private static final String COMMENT = "nonsense";

  private final MockContextStack<CppElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private CppTypeMapper typeMapper;

  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FConstantDef francaConstant;
  @Mock private FField francaField;
  @Mock private FStructType francaStructType;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FArrayType francaArrayType;
  @Mock private FMapType francaMapType;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FAttribute francaAttribute;

  private CppModelBuilder modelBuilder;

  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("typically").build();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(CommentHelper.class, DefinedBy.class, InstanceRules.class);

    modelBuilder = new CppModelBuilder(contextStack, deploymentModel, typeMapper, null);

    when(CommentHelper.getDescription(any())).thenReturn(COMMENT);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsComment() {
    modelBuilder.finishBuilding(francaInterface);

    CppClass cppClass = modelBuilder.getFinalResult(CppClass.class);
    assertNotNull(cppClass);
    assertEquals(COMMENT, cppClass.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaInterface);
  }

  @Test
  public void finishBuildingFrancaMethodReadsComment() {
    modelBuilder.finishBuilding(francaMethod);

    CppMethod cppMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(cppMethod);
    assertEquals(COMMENT, cppMethod.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaMethod);
  }

  @Test
  public void finishBuildingFrancaMethodReadsReturnTypeComment() {
    CppParameter returnTypeParameter = new CppParameter("flowers", cppComplexTypeRef, true);
    returnTypeParameter.comment = "foobar";
    contextStack.injectResult(returnTypeParameter);

    modelBuilder.finishBuilding(francaMethod);

    CppMethod cppMethod = modelBuilder.getFinalResult(CppMethod.class);
    assertNotNull(cppMethod);
    assertEquals("foobar", cppMethod.returnComment);
  }

  @Test
  public void finishBuildingInputArgumentReadsComment() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(COMMENT, cppParameter.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaArgument);
  }

  @Test
  public void finishBuildingOutputArgumentReadsComment() {
    modelBuilder.finishBuildingOutputArgument(francaArgument);

    CppParameter cppParameter = modelBuilder.getFinalResult(CppParameter.class);
    assertNotNull(cppParameter);
    assertEquals(COMMENT, cppParameter.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaArgument);
  }

  @Test
  public void finishBuildingFrancaConstantReadsComment() {
    modelBuilder.finishBuilding(francaConstant);

    CppConstant cppConstant = modelBuilder.getFinalResult(CppConstant.class);
    assertNotNull(cppConstant);
    assertEquals(COMMENT, cppConstant.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaConstant);
  }

  @Test
  public void finishBuildingFrancaFieldReadsComment() {
    modelBuilder.finishBuilding(francaField);

    CppField cppField = modelBuilder.getFinalResult(CppField.class);
    assertNotNull(cppField);
    assertEquals(COMMENT, cppField.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaField);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsComment() {
    modelBuilder.finishBuilding(francaStructType);

    CppStruct cppStruct = modelBuilder.getFinalResult(CppStruct.class);
    assertNotNull(cppStruct);
    assertEquals(COMMENT, cppStruct.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaStructType);
  }

  @Test
  public void finishBuildingFrancaTypeDefReadsComment() {
    modelBuilder.finishBuilding(francaTypeDef);

    CppUsing cppUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(cppUsing);
    assertEquals(COMMENT, cppUsing.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaTypeDef);
  }

  @Test
  public void finishBuildingFrancaArrayTypeReadsComment() {
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaArrayType);

    CppUsing cppUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(cppUsing);
    assertEquals(COMMENT, cppUsing.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaArrayType);
  }

  @Test
  public void finishBuildingFrancaMapTypeReadsComment() {
    contextStack.injectResult(CppPrimitiveTypeRef.INT8);
    contextStack.injectResult(cppComplexTypeRef);

    modelBuilder.finishBuilding(francaMapType);

    CppUsing cppUsing = modelBuilder.getFinalResult(CppUsing.class);
    assertNotNull(cppUsing);
    assertEquals(COMMENT, cppUsing.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaMapType);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsComment() {
    modelBuilder.finishBuilding(francaEnumerationType);

    CppEnum cppEnum = modelBuilder.getFinalResult(CppEnum.class);
    assertNotNull(cppEnum);
    assertEquals(COMMENT, cppEnum.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaEnumerationType);
  }

  @Test
  public void finishBuildingFrancaEnumeratorReadsComment() {
    modelBuilder.finishBuilding(francaEnumerator);

    CppEnumItem cppEnumItem = modelBuilder.getFinalResult(CppEnumItem.class);
    assertNotNull(cppEnumItem);
    assertEquals(COMMENT, cppEnumItem.comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaEnumerator);
  }

  @Test
  public void finishBuildingFrancaAttributeReadsComment() {
    modelBuilder.finishBuilding(francaAttribute);

    List<CppMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CppMethod.class);
    assertEquals(2, methods.size());
    assertEquals(COMMENT, methods.get(0).comment);
    assertEquals(COMMENT, methods.get(1).comment);

    PowerMockito.verifyStatic();
    CommentHelper.getDescription(francaAttribute);
  }
}
