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

package com.here.genium.generator.java;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaEnumItem;
import com.here.genium.model.java.JavaEnumType;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.java.JavaTemplateType;
import com.here.genium.model.java.JavaValue;
import java.math.BigInteger;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class JavaValueMapperTest {

  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FQualifiedElementRef francaElementRef;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaEnumerator.eContainer()).thenReturn(francaEnumerationType);
    when(francaEnumerator.getName()).thenReturn("Foo");
    when(francaEnumerationType.getName()).thenReturn("Bar");
  }

  @Test
  public void completePartialEnumeratorValuesEmptyEnumerators() {
    List<JavaEnumItem> javaEnumerators = Collections.emptyList();

    JavaValueMapper.completePartialEnumeratorValues(javaEnumerators);

    assertEquals(0, javaEnumerators.size());
  }

  @Test
  public void completePartialEnumeratorValuesNoValues() {
    List<JavaEnumItem> javaEnumerators = new LinkedList<>();

    javaEnumerators.add(new JavaEnumItem("one"));
    javaEnumerators.add(new JavaEnumItem("two"));
    javaEnumerators.add(new JavaEnumItem("three"));

    JavaValueMapper.completePartialEnumeratorValues(javaEnumerators);

    assertEquals(3, javaEnumerators.size());
    assertEquals("0", javaEnumerators.get(0).value.name);
    assertEquals("1", javaEnumerators.get(1).value.name);
    assertEquals("2", javaEnumerators.get(2).value.name);
  }

  @Test
  public void completePartialEnumeratorValuesPartialValuesStartingNull() {
    List<JavaEnumItem> javaEnumerators = new LinkedList<>();

    javaEnumerators.add(new JavaEnumItem("item1"));
    javaEnumerators.add(new JavaEnumItem("item2", new JavaValue("-2")));
    javaEnumerators.add(new JavaEnumItem("item3"));
    javaEnumerators.add(new JavaEnumItem("item4", new JavaValue("-15")));
    javaEnumerators.add(new JavaEnumItem("item5", new JavaValue("1000")));

    JavaValueMapper.completePartialEnumeratorValues(javaEnumerators);

    assertEquals(5, javaEnumerators.size());
    assertEquals(5, javaEnumerators.size());
    assertEquals("0", javaEnumerators.get(0).value.name);
    assertEquals("-2", javaEnumerators.get(1).value.name);
    assertEquals("-1", javaEnumerators.get(2).value.name);
    assertEquals("-15", javaEnumerators.get(3).value.name);
    assertEquals("1000", javaEnumerators.get(4).value.name);
  }

  @Test
  public void completePartialEnumeratorValuesPartialValuesStartingNonNull() {
    List<JavaEnumItem> javaEnumerators = new LinkedList<>();

    javaEnumerators.add(new JavaEnumItem("item1", new JavaValue("1")));
    javaEnumerators.add(new JavaEnumItem("item2", new JavaValue("-2")));
    javaEnumerators.add(new JavaEnumItem("item3"));
    javaEnumerators.add(new JavaEnumItem("item4", new JavaValue("-1000")));
    javaEnumerators.add(new JavaEnumItem("item5"));

    JavaValueMapper.completePartialEnumeratorValues(javaEnumerators);

    assertEquals(5, javaEnumerators.size());
    assertEquals(5, javaEnumerators.size());
    assertEquals("1", javaEnumerators.get(0).value.name);
    assertEquals("-2", javaEnumerators.get(1).value.name);
    assertEquals("-1", javaEnumerators.get(2).value.name);
    assertEquals("-1000", javaEnumerators.get(3).value.name);
    assertEquals("-999", javaEnumerators.get(4).value.name);
  }

  @Test
  public void mapDefaultValueNoDeploymentValueTemplateType() {
    JavaTemplateType templateType =
        JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST, JavaPrimitiveType.INT);

    JavaValue result = JavaValueMapper.mapDefaultValue(templateType);

    assertNotNull(result);
    assertEquals(templateType.implementationType.imports, result.imports);
    assertTrue(result.isNew);
    assertEquals(templateType.implementationType.name, result.name);
  }

  @Test
  public void mapDefaultValueNoDeploymentValueEnumType() {
    JavaEnumType enumType =
        new JavaEnumType("myEnum", Collections.emptyList(), Collections.emptyList(), null);

    JavaValue result = JavaValueMapper.mapDefaultValue(enumType);

    assertNotNull(result);
    assertEquals("myEnum.values()[0]", result.name);
  }

  @Test
  public void mapDefaultValueNoDeploymentValueNonNullableCustomType() {
    JavaCustomType customType = JavaCustomType.builder("myType").isInterface(false).build();

    JavaValue result = JavaValueMapper.mapDefaultValue(customType);

    assertNotNull(result);
    assertEquals(customType.imports, result.imports);
    assertEquals(customType.name, result.name);
    assertTrue(result.isNew);
  }

  @Test
  public void mapDefaultValueNoDeploymentValueNullableCustomType() {
    JavaCustomType customType = JavaCustomType.builder("myType").isInterface(true).build();

    JavaValue result = JavaValueMapper.mapDefaultValue(customType);

    assertNull(result);
  }

  @Test
  public void mapDefaultValueDeploymentValueStringType() {
    JavaReferenceType stringType = new JavaReferenceType(JavaReferenceType.Type.STRING);
    String defaultValue = "\\ my \"value\" \n";

    JavaValue result = JavaValueMapper.mapDefaultValue(stringType, defaultValue);

    assertEquals("\"\\\\ my \\\"value\\\" \\n\"", result.name);
  }

  @Test
  public void mapDefaultValueDeploymentValueEnumType() {
    JavaEnumType enumType =
        new JavaEnumType("myEnum", Collections.emptyList(), Collections.emptyList(), null);
    String defaultValue = "enumerator";

    JavaValue result = JavaValueMapper.mapDefaultValue(enumType, defaultValue);

    assertEquals("myEnum.ENUMERATOR", result.name);
  }

  @Test
  public void mapDefaultValueDeploymentValueFloatType() {
    String defaultValue = "23.5";

    JavaValue result = JavaValueMapper.mapDefaultValue(JavaPrimitiveType.FLOAT, defaultValue);

    assertEquals("23.5f", result.name);
  }

  @Test
  public void mapDefaultValueDeploymentValueLongType() {
    String defaultValue = "42";

    JavaValue result = JavaValueMapper.mapDefaultValue(JavaPrimitiveType.LONG, defaultValue);

    assertEquals("42L", result.name);
  }

  @Test
  public void mapNonConstantValue() {
    JavaValue mappedValue = JavaValueMapper.map(francaElementRef);

    assertNull(mappedValue);
  }

  @Test
  public void mapEnumValueInTypeCollection() {
    when(francaEnumerationType.eContainer()).thenReturn(mock(FTypeCollection.class));
    when(francaElementRef.getElement()).thenReturn(francaEnumerator);

    JavaValue mappedValue = JavaValueMapper.map(francaElementRef);

    assertNotNull(mappedValue);
    assertEquals("Bar.FOO", mappedValue.name);
  }

  @Test
  public void mapEnumValueInInterface() {
    FInterface francaInterface = mock(FInterface.class);
    when(francaInterface.getName()).thenReturn("Baz");
    when(francaEnumerationType.eContainer()).thenReturn(francaInterface);
    when(francaElementRef.getElement()).thenReturn(francaEnumerator);

    JavaValue mappedValue = JavaValueMapper.map(francaElementRef);

    assertNotNull(mappedValue);
    assertEquals("Baz.Bar.FOO", mappedValue.name);
  }

  @Test
  public void mapFloatConstantValue() {
    FFloatConstant francaFloatConstant = mock(FFloatConstant.class);
    final float tenPi = 31.4f;
    when(francaFloatConstant.getVal()).thenReturn(tenPi);

    JavaValue mappedValue = JavaValueMapper.map(francaFloatConstant);

    assertNotNull(mappedValue);
    assertEquals("31.4f", mappedValue.name);
  }

  @Test
  public void mapLongConstantValue() {
    FIntegerConstant francaIntegerConstant = mock(FIntegerConstant.class);
    when(francaIntegerConstant.getVal()).thenReturn(new BigInteger("FFFFFFFF", 16));

    JavaValue mappedValue = JavaValueMapper.map(francaIntegerConstant);

    assertNotNull(mappedValue);
    assertEquals("4294967295L", mappedValue.name);
  }
}
