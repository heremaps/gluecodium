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

