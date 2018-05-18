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

package com.here.genium.generator.common.modelbuilder;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.genium.test.ArrayEList;
import java.util.Collections;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class FrancaTreeWalkerTest {

  @Mock private ModelBuilder modelBuilder;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FArgument anotherFrancaArgument;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FConstantDef francaConstant;
  @Mock private FConstantDef anotherFrancaConstant;
  @Mock private FAttribute francaAttribute;
  @Mock private FField francaField;
  @Mock private FStructType francaStructType;
  @Mock private FArrayType francaArrayType;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FMapType francaMapType;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FExpression francaExpression;

  private final ArrayEList<FMethod> methods = new ArrayEList<>();
  private final ArrayEList<FArgument> arguments = new ArrayEList<>();
  private final ArrayEList<FConstantDef> constants = new ArrayEList<>();
  private final ArrayEList<FAttribute> attributes = new ArrayEList<>();
  private final ArrayEList<FType> types = new ArrayEList<>();
  private final ArrayEList<FField> fields = new ArrayEList<>();
  private final ArrayEList<FEnumerator> enumerators = new ArrayEList<>();

  private FrancaTreeWalker treeWalker;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    methods.add(francaMethod);
    arguments.add(francaArgument);
    constants.add(francaConstant);
    attributes.add(francaAttribute);
    fields.add(francaField);
    enumerators.add(francaEnumerator);

    types.add(francaStructType);
    types.add(francaArrayType);
    types.add(francaEnumerationType);
    types.add(francaMapType);
    types.add(francaTypeDef);

    when(francaInterface.getMethods()).thenReturn(methods);
    when(francaInterface.getConstants()).thenReturn(constants);
    when(francaInterface.getAttributes()).thenReturn(attributes);
    when(francaInterface.getTypes()).thenReturn(types);

    when(francaMethod.getInArgs()).thenReturn(arguments);
    when(francaEnumerationType.getEnumerators()).thenReturn(enumerators);
  }

  @Test
  public void walkFrancaTypeCollection() {
    treeWalker.walkTree(francaTypeCollection);

    verify(modelBuilder).startBuilding(francaTypeCollection);
    verify(modelBuilder).finishBuilding(francaTypeCollection);
  }

  @Test
  public void walkFrancaInterface() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaInterface);
    verify(modelBuilder).finishBuilding(francaInterface);
  }

  @Test
  public void walkFrancaInterfaceWithParent() {
    FInterface parentInterface = mock(FInterface.class);
    when(francaInterface.getBase()).thenReturn(parentInterface);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(parentInterface);
    verify(modelBuilder).finishBuilding(parentInterface);
  }

  @Test
  public void walkWithOneMethod() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaMethod);
    verify(modelBuilder).finishBuilding(francaMethod);
  }

  @Test
  public void walkWithTwoMethods() {
    FMethod anotherFrancaMethod = mock(FMethod.class);
    methods.add(anotherFrancaMethod);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaMethod);
    verify(modelBuilder).finishBuilding(francaMethod);
    verify(modelBuilder).startBuilding(anotherFrancaMethod);
    verify(modelBuilder).finishBuilding(anotherFrancaMethod);
  }

  @Test
  public void walkWithOneInArg() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuildingInputArgument(francaArgument);
    verify(modelBuilder).finishBuildingInputArgument(francaArgument);
  }

  @Test
  public void walkWithTwoInArgs() {
    arguments.add(anotherFrancaArgument);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuildingInputArgument(francaArgument);
    verify(modelBuilder).finishBuildingInputArgument(francaArgument);
    verify(modelBuilder).startBuildingInputArgument(anotherFrancaArgument);
    verify(modelBuilder).finishBuildingInputArgument(anotherFrancaArgument);
  }

  @Test
  public void walkWithOneOutArg() {
    when(francaMethod.getInArgs()).thenReturn(null);
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuildingOutputArgument(francaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(francaArgument);
  }

  @Test
  public void walkWithTwoOutArgs() {
    arguments.add(anotherFrancaArgument);
    when(francaMethod.getInArgs()).thenReturn(null);
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuildingOutputArgument(francaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(francaArgument);
    verify(modelBuilder).startBuildingOutputArgument(anotherFrancaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(anotherFrancaArgument);
  }

  @Test
  public void walkWithInAndOutArgs() {
    ArrayEList<FArgument> outArguments = new ArrayEList<>();
    outArguments.add(anotherFrancaArgument);
    when(francaMethod.getOutArgs()).thenReturn(outArguments);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuildingInputArgument(francaArgument);
    verify(modelBuilder).finishBuildingInputArgument(francaArgument);
    verify(modelBuilder).startBuildingOutputArgument(anotherFrancaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(anotherFrancaArgument);
  }

  @Test
  public void walkWithErrorEnum() {
    types.remove(francaEnumerationType);
    when(francaMethod.getErrorEnum()).thenReturn(francaEnumerationType);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaEnumerationType);
    verify(modelBuilder).finishBuilding(francaEnumerationType);
  }

  @Test
  public void walkWithOneConstant() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaConstant);
    verify(modelBuilder).finishBuilding(francaConstant);
  }

  @Test
  public void walkWithTwoConstants() {
    constants.add(anotherFrancaConstant);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaConstant);
    verify(modelBuilder).finishBuilding(francaConstant);
    verify(modelBuilder).startBuilding(anotherFrancaConstant);
    verify(modelBuilder).finishBuilding(anotherFrancaConstant);
  }

  @Test
  public void walkWithOneAttribute() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaAttribute);
    verify(modelBuilder).finishBuilding(francaAttribute);
  }

  @Test
  public void walkWithTwoAttributes() {
    FAttribute anotherFrancaAttribute = mock(FAttribute.class);
    attributes.add(anotherFrancaAttribute);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaAttribute);
    verify(modelBuilder).finishBuilding(francaAttribute);
    verify(modelBuilder).startBuilding(anotherFrancaAttribute);
    verify(modelBuilder).finishBuilding(anotherFrancaAttribute);
  }

  @Test
  public void walkWithOneFieldInStruct() {
    when(francaStructType.getElements()).thenReturn(fields);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaField);
    verify(modelBuilder).finishBuilding(francaField);
  }

  @Test
  public void walkWithTwoFields() {
    when(francaStructType.getElements()).thenReturn(fields);
    FField anotherFrancaField = mock(FField.class);
    fields.add(anotherFrancaField);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaField);
    verify(modelBuilder).finishBuilding(francaField);
    verify(modelBuilder).startBuilding(anotherFrancaField);
    verify(modelBuilder).finishBuilding(anotherFrancaField);
  }

  @Test
  public void walkWithOneStructType() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaStructType);
    verify(modelBuilder).finishBuilding(francaStructType);
  }

  @Test
  public void walkWithTwoStructTypes() {
    FStructType anotherFrancaStructType = mock(FStructType.class);
    types.add(anotherFrancaStructType);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaStructType);
    verify(modelBuilder).finishBuilding(francaStructType);
    verify(modelBuilder).startBuilding(anotherFrancaStructType);
    verify(modelBuilder).finishBuilding(anotherFrancaStructType);
  }

  @Test
  public void walkWithInheritedStruct() {
    FStructType anotherFrancaStructType = mock(FStructType.class);
    when(francaStructType.getBase()).thenReturn(anotherFrancaStructType);

    treeWalker.walk(francaInterface);

    verify(modelBuilder).startBuilding(anotherFrancaStructType);
    verify(modelBuilder).finishBuilding(anotherFrancaStructType);
  }

  @Test
  public void walkWithOneArrayType() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaArrayType);
    verify(modelBuilder).finishBuilding(francaArrayType);
  }

  @Test
  public void walkWithTwoArrayTypes() {
    FArrayType anotherFrancaArrayType = mock(FArrayType.class);
    types.add(anotherFrancaArrayType);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaArrayType);
    verify(modelBuilder).finishBuilding(francaArrayType);
    verify(modelBuilder).startBuilding(anotherFrancaArrayType);
    verify(modelBuilder).finishBuilding(anotherFrancaArrayType);
  }

  @Test
  public void walkWithOneEnumerationType() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaEnumerationType);
    verify(modelBuilder).finishBuilding(francaEnumerationType);
  }

  @Test
  public void walkWithTwoEnumerationTypes() {
    FEnumerationType anotherFrancaEnumerationType = mock(FEnumerationType.class);
    types.add(anotherFrancaEnumerationType);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaEnumerationType);
    verify(modelBuilder).finishBuilding(francaEnumerationType);
    verify(modelBuilder).startBuilding(anotherFrancaEnumerationType);
    verify(modelBuilder).finishBuilding(anotherFrancaEnumerationType);
  }

  @Test
  public void walkWithOneMapType() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaMapType);
    verify(modelBuilder).finishBuilding(francaMapType);
  }

  @Test
  public void walkWithTwoMapTypes() {
    FMapType anotherFrancaMapType = mock(FMapType.class);
    types.add(anotherFrancaMapType);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaMapType);
    verify(modelBuilder).finishBuilding(francaMapType);
    verify(modelBuilder).startBuilding(anotherFrancaMapType);
    verify(modelBuilder).finishBuilding(anotherFrancaMapType);
  }

  @Test
  public void walkWithOneTypeDef() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeDef);
    verify(modelBuilder).finishBuilding(francaTypeDef);
  }

  @Test
  public void walkWithTwoTypeDefs() {
    FTypeDef anotherFrancaTypeDef = mock(FTypeDef.class);
    types.add(anotherFrancaTypeDef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeDef);
    verify(modelBuilder).finishBuilding(francaTypeDef);
    verify(modelBuilder).startBuilding(anotherFrancaTypeDef);
    verify(modelBuilder).finishBuilding(anotherFrancaTypeDef);
  }

  @Test
  public void walkWithTypeRefInArgument() {
    when(francaArgument.getType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithTypeRefInField() {
    when(francaStructType.getElements()).thenReturn(fields);
    when(francaField.getType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithTypeRefInAttribute() {
    when(francaAttribute.getType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithTypeRefInConstant() {
    when(francaConstant.getType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithTypeRefInTypeDef() {
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithTypeRefInArrayType() {
    when(francaArrayType.getElementType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithTypeRefInMapTypeAsKeyType() {
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithTypeRefInMapTypeAsValueType() {
    when(francaMapType.getValueType()).thenReturn(francaTypeRef);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithOneEnumerator() {
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaEnumerator);
    verify(modelBuilder).finishBuilding(francaEnumerator);
  }

  @Test
  public void walkWithTwoEnumerators() {
    FEnumerator anotherFrancaEnumerator = mock(FEnumerator.class);
    enumerators.add(anotherFrancaEnumerator);

    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaEnumerator);
    verify(modelBuilder).finishBuilding(francaEnumerator);
    verify(modelBuilder).startBuilding(anotherFrancaEnumerator);
    verify(modelBuilder).finishBuilding(anotherFrancaEnumerator);
  }

  @Test
  public void walkWithExpressionInEnumerator() {
    when(francaEnumerator.getValue()).thenReturn(francaExpression);
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaExpression);
    verify(modelBuilder).finishBuilding(francaExpression);
  }

  @Test
  public void walkWithExpressionInConstant() {
    when(francaConstant.getRhs()).thenReturn(francaExpression);
    treeWalker.walkTree(francaInterface);

    verify(modelBuilder).startBuilding(francaExpression);
    verify(modelBuilder).finishBuilding(francaExpression);
  }
}
