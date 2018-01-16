/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.here.android.matchers;

import static org.hamcrest.core.IsEqual.equalTo;

import java.lang.reflect.Field;
import org.hamcrest.FeatureMatcher;

public class FieldMatcher<T, U> extends FeatureMatcher<T, U> {
  private final String fieldName;

  private FieldMatcher(String fieldName, U fieldValue) {
    super(equalTo(fieldValue), fieldName, fieldName);
    this.fieldName = fieldName;
  }

  @Override
  @SuppressWarnings("unchecked")
  protected U featureValueOf(T actual) {
    Class<?> clazz = actual.getClass();
    Field field;
    try {
      field = clazz.getField(fieldName);
    } catch (NoSuchFieldException e) {
      return null;
    }
    try {
      return (U) field.get(actual);
    } catch (IllegalAccessException e) {
      return null;
    }
  }

  @SuppressWarnings("unchecked")
  public static <U> FieldMatcher hasFieldWithValue(String fieldName, U fieldValue) {
    return new FieldMatcher(fieldName, fieldValue);
  }
}
