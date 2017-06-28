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

package com.here.ivi.api.generator.common.cpp;

import static org.hamcrest.core.IsCollectionContaining.hasItems;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.RETURNS_DEEP_STUBS;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.test.Issue;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.function.IntFunction;
import java.util.stream.Collectors;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FCompoundInitializer;
import org.franca.core.franca.FField;
import org.franca.core.franca.FFieldInitializer;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStringConstant;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.hamcrest.BaseMatcher;
import org.hamcrest.Description;
import org.hamcrest.Matcher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class TypeGenerationHelperTest {

  @Test
  @Issue("APIGEN-78")
  public void buildCppFieldsIsIndependentOfTheFieldOrder() {
    // mock franca types
    FTypeCollection fTypeCollection = mock(FTypeCollection.class);
    when(fTypeCollection.eContainer()).thenReturn(mock(FModel.class));

    List<String> data = Arrays.asList("foo", "bar", "baz");

    EList<FField> ffields = mockStringFields(fTypeCollection, data);
    EList<FFieldInitializer> ffieldInitializers = mockInitializer(ffields);

    // reverse list to ensure order is different than fields given
    Collections.reverse(ffieldInitializers);

    FrancaElement<?> rootType = mock(FrancaElement.class);

    FStructType struct = mock(FStructType.class);
    when(struct.getElements()).thenReturn(ffields);

    FCompoundInitializer defaultInitializer = mock(FCompoundInitializer.class);
    when(defaultInitializer.getElements()).thenReturn(ffieldInitializers);

    List<CppField> fields =
        TypeGenerationHelper.buildCppFields(rootType, struct, defaultInitializer);

    // ensure that the order is mismatched
    assertNotEquals(
        ((FStringConstant) ffieldInitializers.get(0).getValue()).getVal(),
        ffields.get(0).getName());

    //  test that there are three fields with field name and field value matching
    assertThat(
        fields,
        hasItems(
            data.stream()
                .map(TypeGenerationHelperTest::hasNameAndValue)
                .toArray((IntFunction<Matcher<CppField>[]>) Matcher[]::new)));
  }

  /// matchers

  private static Matcher<CppField> hasNameAndValue(final String expectedBaseName) {
    final String expectedValue = '"' + expectedBaseName + '"';

    return new BaseMatcher<CppField>() {

      @Override
      public boolean matches(final Object item) {
        final CppField cppField = (CppField) item;
        return expectedBaseName.equals(cppField.name)
            && expectedValue.equals(cppField.initializer.name);
      }

      @Override
      public void describeTo(final Description description) {
        description.appendText("name and value should match ").appendValue(expectedBaseName);
      }
    };
  }

  /// mocking helpers

  private static EList<FField> mockStringFields(
      final FTypeCollection root, final List<String> fieldNames) {
    return fieldNames
        .stream()
        .map(
            name -> {
              FField field = mock(FField.class, RETURNS_DEEP_STUBS);
              when(field.getName()).thenReturn(name);
              when(field.getType().getPredefined()).thenReturn(FBasicTypeId.STRING);
              when(field.getType().eContainer()).thenReturn(root);
              return field;
            })
        .collect(Collectors.toCollection(ArrayEList::new));
  }

  private static EList<FFieldInitializer> mockInitializer(final List<FField> ffields) {
    return ffields
        .stream()
        .map(
            field -> {
              FFieldInitializer fieldInitializer = mock(FFieldInitializer.class);
              when(fieldInitializer.getElement()).thenReturn(field);
              EObject root = field.eContainer(); // cannot be inlined, UnfinishedStubbingException
              when(fieldInitializer.eContainer()).thenReturn(root);
              String name = field.getName(); // cannot be inlined, UnfinishedStubbingException
              FStringConstant stringConstant = mock(FStringConstant.class);
              when(stringConstant.getVal()).thenReturn(name);
              // cannot be a deep stub, requires casting
              when(fieldInitializer.getValue()).thenReturn(stringConstant);
              return fieldInitializer;
            })
        .collect(Collectors.toCollection(ArrayEList::new));
  }
}
