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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;

import android.os.Build;
import com.here.android.RobolectricApplication;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class LambdasTest {

  @Test
  public void callCppLambdaInJava() {
    String result = Lambdas.getConcatenator(">.<").apply("foo", "bar");

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callJavaLambdaInCpp() {
    String delimiter = ">.<";
    String result =
        Lambdas.concatenate("foo", "bar", (String s1, String s2) -> s1 + delimiter + s2);

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void capturingRoundtrip() {
    Lambdas.Concatenator concatenator = (String s1, String s2) -> s1 + s2;
    Lambdas.Tricatenator tricatenator = Lambdas.composeConcatenators(concatenator, concatenator);
    String result = tricatenator.apply("foo", ">.<", "bar");

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callConcatenateList() {
    List<String> strings = java.util.Arrays.asList("foo", ">.<", "bar");
    Lambdas.Concatenator concatenator = (String s1, String s2) -> s1 + s2;
    List<Lambdas.Concatenator> concatenators = java.util.Arrays.asList(concatenator, concatenator);
    String result = Lambdas.concatenateList(strings, concatenators);

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callCppLambdaInStructInJava() {
    String result = Lambdas.getConcatenatorInStruct(">.<").concatenator.apply("foo", "bar");

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callJavaLambdaInStructInCpp() {
    String delimiter = ">.<";
    Lambdas.LambdaHolder holder =
        new Lambdas.LambdaHolder((String s1, String s2) -> s1 + delimiter + s2);
    String result = Lambdas.concatenateInStruct("foo", "bar", holder);

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callNullableCppLambdaInJava() {
    String result = Lambdas.getConcatenatorOrNull(">.<").apply("foo", "bar");

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void getNullCppLambdaInJava() {
    Lambdas.Concatenator result = Lambdas.getConcatenatorOrNull(null);

    assertNull(result);
  }

  @Test
  public void callNullableJavaLambdaInCpp() {
    String delimiter = ">.<";
    String result =
        Lambdas.concatenateOrNot("foo", "bar", (String s1, String s2) -> s1 + delimiter + s2);

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callNullableJavaLambdaInCppWithNull() {
    String result = Lambdas.concatenateOrNot("foo", "bar", null);

    assertNull(result);
  }

  @Test
  public void setGetLambdaProperty() {
    Lambdas.setRealConcatenator(Lambdas.getConcatenator(">.<"));
    String result = Lambdas.getRealConcatenator().apply("foo", "bar");

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callCppNullableLambdaInJavaWithValue() {
    StandaloneProducer result = Lambdas.getNullableConfuser().confuse("foo");

    assertEquals("foo", result.apply());
  }

  @Test
  public void callCppNullableLambdaInJavaWithNull() {
    StandaloneProducer result = Lambdas.getNullableConfuser().confuse(null);

    assertNull(result);
  }

  @Test
  public void callJavaNullableLambdaInCppWithValue() {
    Lambdas.NullableConfounder confuser = (String s1) -> s1 != null ? () -> s1 : null;
    StandaloneProducer result = Lambdas.applyNullableConfuser(confuser, "foo");

    assertEquals("foo", result.apply());
  }

  @Test
  public void callJavaNullableLambdaInCppWithNull() {
    Lambdas.NullableConfounder confuser = (String s1) -> s1 != null ? () -> s1 : null;
    StandaloneProducer result = Lambdas.applyNullableConfuser(confuser, null);

    assertNull(result);
  }

  @Test
  public void callJavaOverloadedLambdaInCpp() {
    OverloadedLambda lambda = (int value) -> Integer.toString(value);
    String result = CallOverloadedLambda.invokeOverloadedLambda(lambda, 42);

    assertEquals("42", result);
  }
}
