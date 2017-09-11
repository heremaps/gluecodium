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

package com.here.ivi.api.validator.common;

import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.test.ArrayEList;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class TypeNameValidatorTest {

  private static final String MODEL_NAME = "my.package.name";

  @Mock private FModel fModel;

  @Mock private FrancaModel francaModel;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    when(fModel.getName()).thenReturn(MODEL_NAME);
  }

  @Test
  public void validateFModelWithSingleTypeCollection() {

    TypeCollection typeCollection = mockTypeCollectionContainingType("myFancyType", fModel);

    when(francaModel.getTypeCollections()).thenReturn(ImmutableList.of(typeCollection));

    assertTrue(TypeNameValidator.validate(francaModel));
  }

  @Test
  public void validateFModelWithMultipleTypeCollectionsUniqueTypeNames() {

    TypeCollection typeCollection = mockTypeCollectionContainingType("myFancyType", fModel);
    TypeCollection typeCollection2 = mockTypeCollectionContainingType("myFancyType2", fModel);

    when(francaModel.getTypeCollections())
        .thenReturn(ImmutableList.of(typeCollection, typeCollection2));

    assertTrue(TypeNameValidator.validate(francaModel));
  }

  @Test
  public void validateFModelWithMultipleTypeCollectionsNonUniqueTypeNames() {

    TypeCollection typeCollection = mockTypeCollectionContainingType("myFancyType", fModel);
    TypeCollection typeCollection2 = mockTypeCollectionContainingType("myFancyType", fModel);

    when(francaModel.getTypeCollections())
        .thenReturn(ImmutableList.of(typeCollection, typeCollection2));

    assertFalse(TypeNameValidator.validate(francaModel));
  }

  @Test
  public void validateFModelWithMultipleTypeCollectionsNonUniqueTypeNamesDifferentPackages() {

    FModel fModel2 = mock(FModel.class);
    when(fModel2.getName()).thenReturn(MODEL_NAME + ".xtra");

    TypeCollection typeCollection = mockTypeCollectionContainingType("myFancyType", fModel);
    TypeCollection typeCollection2 = mockTypeCollectionContainingType("myFancyType", fModel2);

    when(francaModel.getTypeCollections())
        .thenReturn(ImmutableList.of(typeCollection, typeCollection2));

    assertTrue(TypeNameValidator.validate(francaModel));
  }

  private TypeCollection mockTypeCollectionContainingType(String typeName, FModel fModel) {

    FType type = mock(FType.class);
    when(type.getName()).thenReturn(typeName);

    TypeCollection typeCollection = mock(TypeCollection.class, Answers.RETURNS_DEEP_STUBS);

    FTypeCollection fTypeCollection = mock(FTypeCollection.class);

    when(typeCollection.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    when(fTypeCollection.eContainer()).thenReturn(fModel);

    ArrayEList<FType> types = new ArrayEList<>();
    types.add(type);
    when(typeCollection.getFrancaTypeCollection().getTypes()).thenReturn(types);
    return typeCollection;
  }
}
