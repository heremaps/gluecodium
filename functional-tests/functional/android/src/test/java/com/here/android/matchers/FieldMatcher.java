/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
