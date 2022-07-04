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
import com.here.android.RobolectricApplication;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class ConstantsTest {

  @Test
  public void intConstantFromTypeCollection() {
    int result = UseTypeCollectionConstants.getIntConstant();

    assertEquals(Constants.INT_CONSTANT, result);
  }

  @Test
  public void uintConstantFromTypeCollection() {
    long result = UseTypeCollectionConstants.getUintConstant();

    assertEquals(Constants.UINT_CONSTANT, result);
  }

  @Test
  public void floatConstantFromTypeCollection() {
    float result = UseTypeCollectionConstants.getFloatConstant();

    assertEquals(Constants.FLOAT_CONSTANT, result);
  }

  @Test
  public void doubleConstantFromTypeCollection() {
    double result = UseTypeCollectionConstants.getDoubleConstant();

    assertEquals(Constants.DOUBLE_CONSTANT, result);
  }

  @Test
  public void stringConstantFromTypeCollection() {
    String result = UseTypeCollectionConstants.getStringConstant();

    assertEquals(Constants.STRING_CONSTANT, result);
  }

  @Test
  public void enumConstantFromTypeCollection() {
    Constants.StateEnum result = UseTypeCollectionConstants.getEnumConstant();

    assertEquals(Constants.ENUM_CONSTANT, result);
  }

  @Test
  public void intConstantFromInterface() {
    int result = UseInterfaceConstants.getIntConstant();

    assertEquals(ConstantsInterface.INT_CONSTANT, result);
  }

  @Test
  public void uintConstantFromInterface() {
    long result = UseInterfaceConstants.getUintConstant();

    assertEquals(ConstantsInterface.UINT_CONSTANT, result);
  }

  @Test
  public void floatConstantFromInterface() {
    float result = UseInterfaceConstants.getFloatConstant();

    assertEquals(ConstantsInterface.FLOAT_CONSTANT, result);
  }

  @Test
  public void doubleConstantFromInterface() {
    double result = UseInterfaceConstants.getDoubleConstant();

    assertEquals(ConstantsInterface.DOUBLE_CONSTANT, result);
  }

  @Test
  public void stringConstantFromInterface() {
    String result = UseInterfaceConstants.getStringConstant();

    assertEquals(ConstantsInterface.STRING_CONSTANT, result);
  }

  @Test
  public void enumConstantFromInterface() {
    ConstantsInterface.StateEnum result = UseInterfaceConstants.getEnumConstant();

    assertEquals(ConstantsInterface.ENUM_CONSTANT, result);
  }

  @Test
  public void compareStructConstants() {
    StructConstants.SomeStruct result = UseStructConstants.getStructConstant();

    assertEquals(StructConstants.STRUCT_CONSTANT, result);
  }

  @Test
  public void compareNestingStructConstants() {
    StructConstants.NestingStruct result = UseStructConstants.getNestingStructConstant();

    assertEquals(StructConstants.NESTING_STRUCT_CONSTANT, result);
  }

  @Test
  public void checkListConstant() {
    List<String> result = CollectionConstants.LIST_CONSTANT;

    assertEquals(java.util.Arrays.asList("foo", "bar"), result);
  }

  @Test
  public void checkSetConstant() {
    Set<String> result = CollectionConstants.SET_CONSTANT;

    assertEquals(new HashSet(java.util.Arrays.asList("foo", "bar")), result);
  }

  @Test
  public void checkMapConstant() {
    Map<String, String> result = CollectionConstants.MAP_CONSTANT;

    assertEquals(Collections.singletonMap("foo", "bar"), result);
  }

  @Test
  public void checkMixedConstant() {
    Map<List<String>, Set<String>> result = CollectionConstants.MIXED_CONSTANT;

    assertEquals(
        Collections.singletonMap(Collections.singletonList("foo"), Collections.singleton("bar")),
        result);
  }
}
