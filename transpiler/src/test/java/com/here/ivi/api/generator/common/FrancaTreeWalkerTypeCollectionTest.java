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

package com.here.ivi.api.generator.common;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.test.ArrayEList;
import java.util.Collections;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FExpression;
import org.franca.core.franca.FField;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FUnionType;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
@SuppressWarnings("PMD.TooManyFields")
public class FrancaTreeWalkerTypeCollectionTest {

  @Mock private ModelBuilder modelBuilder;
  @Mock private TypeCollection typeCollection;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FConstantDef francaConstant;
  @Mock private FConstantDef anotherFrancaConstant;
  @Mock private FField francaField;
  @Mock private FStructType francaStructType;
  @Mock private FArrayType francaArrayType;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FMapType francaMapType;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FExpression francaExpression;
  @Mock private FUnionType francaUnionType;

  private final ArrayEList<FConstantDef> constants = new ArrayEList<>();
  private final ArrayEList<FType> types = new ArrayEList<>();
  private final ArrayEList<FField> fields = new ArrayEList<>();
  private final ArrayEList<FEnumerator> enumerators = new ArrayEList<>();

  private FrancaTreeWalker treeWalker;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    constants.add(francaConstant);
    fields.add(francaField);
    enumerators.add(francaEnumerator);

    types.add(francaStructType);
    types.add(francaArrayType);
    types.add(francaEnumerationType);
    types.add(francaMapType);
    types.add(francaTypeDef);
    types.add(francaUnionType);

    when(typeCollection.getFrancaTypeCollection()).thenReturn(francaTypeCollection);

    when(francaTypeCollection.getConstants()).thenReturn(constants);
    when(francaTypeCollection.getTypes()).thenReturn(types);

    when(francaStructType.getElements()).thenReturn(fields);
    when(francaField.getType()).thenReturn(francaTypeRef);
    when(francaEnumerationType.getEnumerators()).thenReturn(enumerators);
    when(francaEnumerator.getValue()).thenReturn(francaExpression);
  }

  @Test
  public void walkNullModelDoesNotWalkTypeCollection() {
    treeWalker.walk(null);

    verify(modelBuilder, never()).startBuilding(any(FTypeCollection.class));
  }

  @Test
  public void walkUnsupportedModelDoesNotWalkTypeCollection() {
    treeWalker.walk(mock(FrancaElement.class));

    verify(modelBuilder, never()).startBuilding(any(FTypeCollection.class));
  }

  @Test
  public void walkFrancaTypeCollection() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaTypeCollection);
    verify(modelBuilder).finishBuilding(francaTypeCollection);
  }

  @Test
  public void walkWithOneConstant() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaConstant);
    verify(modelBuilder).finishBuilding(francaConstant);
  }

  @Test
  public void walkWithTwoConstants() {
    constants.add(anotherFrancaConstant);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaConstant);
    verify(modelBuilder).finishBuilding(francaConstant);
    verify(modelBuilder).startBuilding(anotherFrancaConstant);
    verify(modelBuilder).finishBuilding(anotherFrancaConstant);
  }

  @Test
  public void walkWithOneField() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaField);
    verify(modelBuilder).finishBuilding(francaField);
  }

  @Test
  public void walkWithTwoFields() {
    FField anotherFrancaField = mock(FField.class);
    fields.add(anotherFrancaField);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaField);
    verify(modelBuilder).finishBuilding(francaField);
    verify(modelBuilder).startBuilding(anotherFrancaField);
    verify(modelBuilder).finishBuilding(anotherFrancaField);
  }

  @Test
  public void walkWithOneStructType() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaStructType);
    verify(modelBuilder).finishBuilding(francaStructType);
  }

  @Test
  public void walkWithTwoStructTypes() {
    FStructType anotherFrancaStructType = mock(FStructType.class);
    types.add(anotherFrancaStructType);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaStructType);
    verify(modelBuilder).finishBuilding(francaStructType);
    verify(modelBuilder).startBuilding(anotherFrancaStructType);
    verify(modelBuilder).finishBuilding(anotherFrancaStructType);
  }

  @Test
  public void walkWithOneArrayType() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaArrayType);
    verify(modelBuilder).finishBuilding(francaArrayType);
  }

  @Test
  public void walkWithTwoArrayTypes() {
    FArrayType anotherFrancaArrayType = mock(FArrayType.class);
    types.add(anotherFrancaArrayType);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaArrayType);
    verify(modelBuilder).finishBuilding(francaArrayType);
    verify(modelBuilder).startBuilding(anotherFrancaArrayType);
    verify(modelBuilder).finishBuilding(anotherFrancaArrayType);
  }

  @Test
  public void walkWithOneEnumerationType() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaEnumerationType);
    verify(modelBuilder).finishBuilding(francaEnumerationType);
  }

  @Test
  public void walkWithTwoEnumerationTypes() {
    FEnumerationType anotherFrancaEnumerationType = mock(FEnumerationType.class);
    types.add(anotherFrancaEnumerationType);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaEnumerationType);
    verify(modelBuilder).finishBuilding(francaEnumerationType);
    verify(modelBuilder).startBuilding(anotherFrancaEnumerationType);
    verify(modelBuilder).finishBuilding(anotherFrancaEnumerationType);
  }

  @Test
  public void walkWithOneMapType() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaMapType);
    verify(modelBuilder).finishBuilding(francaMapType);
  }

  @Test
  public void walkWithTwoMapTypes() {
    FMapType anotherFrancaMapType = mock(FMapType.class);
    types.add(anotherFrancaMapType);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaMapType);
    verify(modelBuilder).finishBuilding(francaMapType);
    verify(modelBuilder).startBuilding(anotherFrancaMapType);
    verify(modelBuilder).finishBuilding(anotherFrancaMapType);
  }

  @Test
  public void walkWithOneTypeDef() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaTypeDef);
    verify(modelBuilder).finishBuilding(francaTypeDef);
  }

  @Test
  public void walkWithTwoTypeDefs() {
    FTypeDef anotherFrancaTypeDef = mock(FTypeDef.class);
    types.add(anotherFrancaTypeDef);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaTypeDef);
    verify(modelBuilder).finishBuilding(francaTypeDef);
    verify(modelBuilder).startBuilding(anotherFrancaTypeDef);
    verify(modelBuilder).finishBuilding(anotherFrancaTypeDef);
  }

  @Test
  public void walkWithTypeRef() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithOneEnumerator() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaEnumerator);
    verify(modelBuilder).finishBuilding(francaEnumerator);
  }

  @Test
  public void walkWithTwoEnumerators() {
    FEnumerator anotherFrancaEnumerator = mock(FEnumerator.class);
    enumerators.add(anotherFrancaEnumerator);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaEnumerator);
    verify(modelBuilder).finishBuilding(francaEnumerator);
    verify(modelBuilder).startBuilding(anotherFrancaEnumerator);
    verify(modelBuilder).finishBuilding(anotherFrancaEnumerator);
  }

  @Test
  public void walkWithExpression() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaExpression);
    verify(modelBuilder).finishBuilding(francaExpression);
  }

  @Test
  public void walkWithOneUnion() {
    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaUnionType);
    verify(modelBuilder).finishBuilding(francaUnionType);
  }

  @Test
  public void walkWithTwoUnions() {
    FUnionType anotherFrancaUnionType = mock(FUnionType.class);
    types.add(anotherFrancaUnionType);

    treeWalker.walk(typeCollection);

    verify(modelBuilder).startBuilding(francaUnionType);
    verify(modelBuilder).finishBuilding(francaUnionType);
    verify(modelBuilder).startBuilding(anotherFrancaUnionType);
    verify(modelBuilder).finishBuilding(anotherFrancaUnionType);
  }
}
