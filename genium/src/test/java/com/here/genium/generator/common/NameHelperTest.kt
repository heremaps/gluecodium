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

package com.here.genium.generator.common;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class NameHelperTest {
  private static final String LOWER_CAMEL_CASE = "someTestString";
  private static final String UPPER_CAMEL_CASE = "SomeTestString";
  private static final String LOWER_SNAKE_CASE = "some_test_string";
  private static final String UPPER_SNAKE_CASE = "SOME_TEST_STRING";
  private static final String UPPER_CASE = "SOMETESTSTRING";
  private static final String LOWER_CASE = "someteststring";
  private static final String SIMPLE_UPPER_CAMEL_CASE = "Someteststring";

  @Test
  public void fromLowerCamelToLowerCamel() {
    String actual = NameHelper.toLowerCamelCase(LOWER_CAMEL_CASE);

    assertEquals(LOWER_CAMEL_CASE, actual);
  }

  @Test
  public void fromUpperCamelToLowerCamel() {
    String actual = NameHelper.toLowerCamelCase(UPPER_CAMEL_CASE);

    assertEquals(LOWER_CAMEL_CASE, actual);
  }

  @Test
  public void fromLowerSnakeCaseToLowerCamel() {
    String actual = NameHelper.toLowerCamelCase(LOWER_SNAKE_CASE);

    assertEquals(LOWER_CAMEL_CASE, actual);
  }

  @Test
  public void fromUpperSnakeCaseToLowerCamel() {
    String actual = NameHelper.toLowerCamelCase(UPPER_SNAKE_CASE);

    assertEquals(LOWER_CAMEL_CASE, actual);
  }

  @Test
  public void fromLowerCaseToLowerCamel() {
    String actual = NameHelper.toLowerCamelCase(LOWER_CASE);

    assertEquals(LOWER_CASE, actual);
  }

  @Test
  public void fromUpperCaseToLowerCamel() {
    String actual = NameHelper.toLowerCamelCase(UPPER_CASE);

    assertEquals(LOWER_CASE, actual);
  }

  @Test
  public void fromLowerCamelToUpperCamel() {
    String actual = NameHelper.toUpperCamelCase(LOWER_CAMEL_CASE);

    assertEquals(UPPER_CAMEL_CASE, actual);
  }

  @Test
  public void fromUpperCamelToUpperCamel() {
    String actual = NameHelper.toUpperCamelCase(UPPER_CAMEL_CASE);

    assertEquals(UPPER_CAMEL_CASE, actual);
  }

  @Test
  public void fromLowerSnakeCaseToUpperCamel() {
    String actual = NameHelper.toUpperCamelCase(LOWER_SNAKE_CASE);

    assertEquals(UPPER_CAMEL_CASE, actual);
  }

  @Test
  public void fromUpperSnakeCaseToUpperCamel() {
    String actual = NameHelper.toUpperCamelCase(UPPER_SNAKE_CASE);

    assertEquals(UPPER_CAMEL_CASE, actual);
  }

  @Test
  public void fromLowerCaseToUpperCamel() {
    String actual = NameHelper.toUpperCamelCase(LOWER_CASE);

    assertEquals(SIMPLE_UPPER_CAMEL_CASE, actual);
  }

  @Test
  public void fromUpperCaseToUpperCamel() {
    String actual = NameHelper.toUpperCamelCase(UPPER_CASE);

    assertEquals(SIMPLE_UPPER_CAMEL_CASE, actual);
  }

  @Test
  public void fromLowerCamelToUpperSnakeCase() {
    String actual = NameHelper.toUpperSnakeCase(LOWER_CAMEL_CASE);

    assertEquals(UPPER_SNAKE_CASE, actual);
  }

  @Test
  public void fromUpperCamelToUpperSnakeCase() {
    String actual = NameHelper.toUpperSnakeCase(UPPER_CAMEL_CASE);

    assertEquals(UPPER_SNAKE_CASE, actual);
  }

  @Test
  public void fromLowerSnakeCaseToUpperSnakeCase() {
    String actual = NameHelper.toUpperSnakeCase(LOWER_SNAKE_CASE);

    assertEquals(UPPER_SNAKE_CASE, actual);
  }

  @Test
  public void fromUpperSnakeCaseToUpperSnakeCase() {
    String actual = NameHelper.toUpperSnakeCase(UPPER_SNAKE_CASE);

    assertEquals(UPPER_SNAKE_CASE, actual);
  }

  @Test
  public void fromUpperCaseToUpperSnakeCase() {
    String actual = NameHelper.toUpperSnakeCase(UPPER_CASE);

    assertEquals(UPPER_CASE, actual);
  }

  @Test
  public void fromLowerCaseToUpperSnakeCase() {
    String actual = NameHelper.toUpperSnakeCase(LOWER_CASE);

    assertEquals(UPPER_CASE, actual);
  }

  @Test
  public void fromLowerCamelToLowerSnakeCase() {
    String actual = NameHelper.toLowerSnakeCase(LOWER_CAMEL_CASE);

    assertEquals(LOWER_SNAKE_CASE, actual);
  }

  @Test
  public void fromUpperCamelToLowerSnakeCase() {
    String actual = NameHelper.toLowerSnakeCase(UPPER_CAMEL_CASE);

    assertEquals(LOWER_SNAKE_CASE, actual);
  }

  @Test
  public void fromLowerSnakeCaseToLowerSnakeCase() {
    String actual = NameHelper.toLowerSnakeCase(LOWER_SNAKE_CASE);

    assertEquals(LOWER_SNAKE_CASE, actual);
  }

  @Test
  public void fromUpperSnakeCaseToLowerSnakeCase() {
    String actual = NameHelper.toLowerSnakeCase(UPPER_SNAKE_CASE);

    assertEquals(LOWER_SNAKE_CASE, actual);
  }

  @Test
  public void fromUpperCaseToLowerSnakeCase() {
    String actual = NameHelper.toLowerSnakeCase(UPPER_CASE);

    assertEquals(LOWER_CASE, actual);
  }

  @Test
  public void fromLowerCaseToLowerSnakeCase() {
    String actual = NameHelper.toLowerSnakeCase(LOWER_CASE);

    assertEquals(LOWER_CASE, actual);
  }
}
