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

package com.here.ivi.api.generator.java;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaEnumItem;
import com.here.ivi.api.model.javamodel.JavaEnumType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaTemplateType;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.test.ArrayEList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class JavaValueMapperTest {

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
  public void createEnumInitializerValueEmptyList() {

    FEnumerationType fEnumType = mock(FEnumerationType.class);
    when(fEnumType.getEnumerators()).thenReturn(new ArrayEList<>());

    JavaValue result = JavaValueMapper.createEnumInitializerValue("myEnumType", fEnumType);

    assertEquals("null", result.name);
  }

  @Test
  public void createEnumInitializerValueNonEmptyList() {

    FEnumerationType fEnumType = mock(FEnumerationType.class);
    FEnumerator enumOne = mock(FEnumerator.class);
    when(enumOne.getName()).thenReturn("enumItem");
    EList<FEnumerator> enumerators = new ArrayEList<>();
    enumerators.add(enumOne);
    when(fEnumType.getEnumerators()).thenReturn(enumerators);

    JavaValue result = JavaValueMapper.createEnumInitializerValue("myEnumType", fEnumType);

    assertEquals("myEnumType." + JavaNameRules.getConstantName("enumItem"), result.name);
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
    JavaValue initializer = new JavaValue("myEnumValue");
    JavaEnumType enumType =
        new JavaEnumType(
            "myEnum", Collections.emptyList(), Collections.emptyList(), null, initializer);

    JavaValue result = JavaValueMapper.mapDefaultValue(enumType);

    assertEquals(initializer, result);
  }

  @Test
  public void mapDefaultValueNoDeploymentValueNonNullableCustomType() {
    JavaCustomType customType = JavaCustomType.builder("myType").isNullable(false).build();

    JavaValue result = JavaValueMapper.mapDefaultValue(customType);

    assertNotNull(result);
    assertEquals(customType.imports, result.imports);
    assertEquals(customType.name, result.name);
    assertTrue(result.isNew);
  }

  @Test
  public void mapDefaultValueNoDeploymentValueNullableCustomType() {
    JavaCustomType customType = JavaCustomType.builder("myType").isNullable(true).build();

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
        new JavaEnumType("myEnum", Collections.emptyList(), Collections.emptyList(), null, null);
    String defaultValue = "enumerator";

    JavaValue result = JavaValueMapper.mapDefaultValue(enumType, defaultValue);

    assertEquals("myEnum.ENUMERATOR", result.name);
  }
}
