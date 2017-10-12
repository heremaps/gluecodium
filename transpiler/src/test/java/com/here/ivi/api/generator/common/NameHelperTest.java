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
}
