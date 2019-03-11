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

package com.here.genium.validator;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.test.ArrayEList;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class NameValidatorTest {

  private static final String MODEL_NAME = "my.package.name";
  private static final String TYPE_NAME = "myFancyType";
  private static final String INTERFACE_NAME = "Face";

  @Mock private FModel fModel;

  @Mock private FInterface francaInterface;
  @Mock private FTypeCollection francaTypeCollection;

  private final List<FTypeCollection> typeCollections = new LinkedList<>();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(fModel.getName()).thenReturn(MODEL_NAME);
    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);

    when(francaInterface.eContainer()).thenReturn(fModel);
    when(francaTypeCollection.eContainer()).thenReturn(fModel);
  }

  @Test
  public void checkTypeNamesWithSingleTypeCollection() {
    typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel));

    assertTrue(NameValidator.checkTypeNamesInTypeCollection(typeCollections));
  }

  @Test
  public void checkTypeNamesWithMultipleTypeCollectionsUniqueTypeNames() {
    typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel));
    typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME + "2", fModel));

    assertTrue(NameValidator.checkTypeNamesInTypeCollection(typeCollections));
  }

  @Test
  public void checkTypeNamesWithMultipleTypeCollectionsNonUniqueTypeNames() {
    typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel));
    typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel));

    assertFalse(NameValidator.checkTypeNamesInTypeCollection(typeCollections));
  }

  @Test
  public void checkTypeNamesWithMultipleTypeCollectionsNonUniqueTypeNamesDifferentPackages() {
    FModel fModel2 = mock(FModel.class);
    when(fModel2.getName()).thenReturn(MODEL_NAME + ".xtra");

    typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel));
    typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel2));

    assertTrue(NameValidator.checkTypeNamesInTypeCollection(typeCollections));
  }

  @Test
  public void checkTypeCollectionNamesWithSingleInterface() {
    typeCollections.add(francaInterface);

    assertTrue(NameValidator.checkTypeCollectionNames(typeCollections));
  }

  @Test
  public void checkTypeCollectionNamesWithSingleTypeCollection() {
    typeCollections.add(francaTypeCollection);

    assertTrue(NameValidator.checkTypeCollectionNames(typeCollections));
  }

  @Test
  public void checkTypeCollectionNamesWithTwoUniqueNames() {
    when(francaTypeCollection.getName()).thenReturn(INTERFACE_NAME + "Off");
    typeCollections.add(francaInterface);
    typeCollections.add(francaTypeCollection);

    assertTrue(NameValidator.checkTypeCollectionNames(typeCollections));
  }

  @Test
  public void checkTypeCollectionNamesWithTwoNonUniqueNames() {
    when(francaTypeCollection.getName()).thenReturn(INTERFACE_NAME);
    typeCollections.add(francaInterface);
    typeCollections.add(francaTypeCollection);

    assertFalse(NameValidator.checkTypeCollectionNames(typeCollections));
  }

  @Test
  public void checkTypeCollectionNamesWithTwoNonUniqueNamesDifferentPackages() {
    FModel anotherFModel = mock(FModel.class);
    when(anotherFModel.getName()).thenReturn(MODEL_NAME + ".xtra");
    when(francaTypeCollection.eContainer()).thenReturn(anotherFModel);

    when(francaTypeCollection.getName()).thenReturn(INTERFACE_NAME);
    typeCollections.add(francaInterface);
    typeCollections.add(francaTypeCollection);

    assertTrue(NameValidator.checkTypeCollectionNames(typeCollections));
  }

  private FTypeCollection mockTypeCollectionContainingType(String typeName, FModel fModelParam) {

    FType type = mock(FType.class);
    when(type.getName()).thenReturn(typeName);

    FTypeCollection fTypeCollection = mock(FTypeCollection.class);

    when(fTypeCollection.eContainer()).thenReturn(fModelParam);
    when(fTypeCollection.eContainer()).thenReturn(fModelParam);

    ArrayEList<FType> types = new ArrayEList<>();
    types.add(type);
    when(fTypeCollection.getTypes()).thenReturn(types);
    return fTypeCollection;
  }
}
