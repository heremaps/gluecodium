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

import android.os.Build;

import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public class LambdasTest {

  @Test
  public void callCppLambdaInJava() {
    String result = Lambdas.getConcatenator(">.<").apply("foo", "bar");

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void callJavaLambdaInCpp() {
    String delimiter = ">.<";
    String result = Lambdas.concatenate("foo", "bar", (String s1, String s2)->s1+delimiter+s2);

    assertEquals("foo>.<bar", result);
  }

  @Test
  public void capturingRoundtrip() {
    Lambdas.Concatenator concatenator = (String s1, String s2)->s1+s2;
    Lambdas.Tricatenator tricatenator = Lambdas.composeConcatenators(concatenator, concatenator);
    String result = tricatenator.apply("foo", ">.<", "bar");

    assertEquals("foo>.<bar", result);
  }
}
