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
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import com.here.gluecodium.test.functional.BuildConfig;
import java.util.AbstractMap;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public final class DefaultsTest {

  private static final Defaults.StructWithDefaults STRUCT_WITH_DEFAULTS =
      new Defaults.StructWithDefaults();

  private static boolean checkIfStructEqualsDefault(final Defaults.StructWithDefaults struct) {

    return struct.intField == 42
        && struct.uintField == 4294967295L
        && struct.floatField == 3.14F
        && struct.boolField == true
        && struct.stringField.equals("some string")
        && struct.enumField == Defaults.SomeEnum.BAR_VALUE;
  }

  @Test
  public void checkJavaDefaults() {

    // act
    Defaults.StructWithDefaults myStruct = new Defaults.StructWithDefaults();

    // assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }

  @Test
  public void checkCppDefaults() {

    // act
    Defaults.StructWithDefaults myStruct = Defaults.getDefault();

    // assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }

  @Test
  public void checkCppDefaultsImmutable() {

    Defaults.ImmutableStructWithDefaults myStruct = Defaults.getImmutableDefault();

    assertEquals(42, myStruct.intField);
    assertEquals(0, myStruct.uintField);
    assertEquals(3.14F, myStruct.floatField);
    assertEquals(false, myStruct.boolField);
    assertEquals("some string", myStruct.stringField);
    assertEquals(Defaults.SomeEnum.BAR_VALUE, myStruct.enumField);
  }

  @Test
  public void checkJavaDefaultsImmutable() {
    long uintValue = 77L;
    boolean boolValue = true;
    Defaults.ImmutableStructWithDefaults myStruct =
        new Defaults.ImmutableStructWithDefaults(uintValue, boolValue);

    assertEquals(42, myStruct.intField);
    assertEquals(uintValue, myStruct.uintField);
    assertEquals(3.14F, myStruct.floatField);
    assertEquals(boolValue, myStruct.boolField);
    assertEquals("some string", myStruct.stringField);
    assertEquals(Defaults.SomeEnum.BAR_VALUE, myStruct.enumField);
  }

  @Test
  public void checkJavaSpecialDefaults() {
    Defaults.StructWithSpecialDefaults special = new Defaults.StructWithSpecialDefaults();

    assertTrue(Defaults.isNan(special.floatNanField));
    assertTrue(Defaults.isInfinity(special.floatInfinityField));
    assertTrue(Defaults.isInfinity(special.floatNegativeInfinityField));
    assertTrue(Defaults.isNan(special.doubleNanField));
    assertTrue(Defaults.isInfinity(special.doubleInfinityField));
    assertTrue(Defaults.isInfinity(special.doubleNegativeInfinityField));
  }

  @Test
  public void checkCppSpecialDefaults() {
    Defaults.StructWithSpecialDefaults special = Defaults.createSpecial();

    assertTrue(Float.isNaN(special.floatNanField));
    assertTrue(Float.isInfinite(special.floatInfinityField));
    assertTrue(Float.isInfinite(special.floatNegativeInfinityField));
    assertTrue(special.floatNegativeInfinityField < 0);
    assertTrue(Double.isNaN(special.doubleNanField));
    assertTrue(Double.isInfinite(special.doubleInfinityField));
    assertTrue(Double.isInfinite(special.doubleNegativeInfinityField));
    assertTrue(special.doubleNegativeInfinityField < 0);
  }

  @Test
  public void checkJavaEmptyDefaults() {
    Defaults.StructWithEmptyDefaults result = new Defaults.StructWithEmptyDefaults();

    assertTrue(result.intsField.isEmpty());
    assertTrue(result.floatsField.isEmpty());
    assertTrue(result.mapField.isEmpty());
    assertEquals(new Defaults.StructWithDefaults(), result.structField);
    assertTrue(result.setTypeField.isEmpty());
  }

  @Test
  public void checkCppEmptyDefaults() {
    Defaults.StructWithEmptyDefaults result = Defaults.getEmptyDefaults();

    assertTrue(result.intsField.isEmpty());
    assertTrue(result.floatsField.isEmpty());
    assertTrue(result.mapField.isEmpty());
    assertEquals(new Defaults.StructWithDefaults(), result.structField);
    assertTrue(result.setTypeField.isEmpty());
  }

  @Test
  public void checkJavaInitializerDefaults() {
    Defaults.StructWithInitializerDefaults result = new Defaults.StructWithInitializerDefaults();

    assertEquals(java.util.Arrays.asList(4, -2, 42), result.intsField);
    assertEquals(java.util.Arrays.asList(3.14f, Float.NEGATIVE_INFINITY), result.floatsField);
    assertEquals(Defaults.ExternalEnum.ONE_VALUE, result.structField.enumField);
    assertEquals(new HashSet<String>(java.util.Arrays.asList("foo", "bar")), result.setTypeField);

    AbstractMap.SimpleEntry<Long, String> entry1 = new AbstractMap.SimpleEntry<>(1L, "foo");
    AbstractMap.SimpleEntry<Long, String> entry2 = new AbstractMap.SimpleEntry<>(42L, "bar");
    Map<Long, String> exampleMap =
        new HashMap<>(
            Stream.of(entry1, entry2)
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
    assertEquals(exampleMap, result.mapField);
  }

  @Test
  public void checkCppInitializerDefaults() {
    Defaults.StructWithInitializerDefaults result = Defaults.getInitializerDefaults();

    assertEquals(java.util.Arrays.asList(4, -2, 42), result.intsField);
    assertEquals(java.util.Arrays.asList(3.14f, Float.NEGATIVE_INFINITY), result.floatsField);
    assertEquals(Defaults.ExternalEnum.ONE_VALUE, result.structField.enumField);
    assertEquals(new HashSet<String>(java.util.Arrays.asList("foo", "bar")), result.setTypeField);

    AbstractMap.SimpleEntry<Long, String> entry1 = new AbstractMap.SimpleEntry<>(1L, "foo");
    AbstractMap.SimpleEntry<Long, String> entry2 = new AbstractMap.SimpleEntry<>(42L, "bar");
    Map<Long, String> exampleMap =
        new HashMap<>(
            Stream.of(entry1, entry2)
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
    assertEquals(exampleMap, result.mapField);
  }

  @Test
  public void checkPositionalEnumeratorDefaults() {
    StructWithEnums result = new StructWithEnums();

    assertEquals(SomethingEnum.REALLY_FIRST, result.firstField);
    assertEquals(SomethingEnum.EXPLICIT, result.explicitField);
    assertEquals(SomethingEnum.LAST, result.lastField);
    assertEquals(SomethingEnum.REALLY_FIRST, StructWithEnums.FIRST_CONSTANT);
  }

  @Test
  public void testPositionalDefaultsFreeArgsCtor() {
    StructWithJavaPositionalDefaults result = new StructWithJavaPositionalDefaults("Foo", true);

    assertEquals(42, result.firstInitField);
    assertEquals("Foo", result.firstFreeField);
    assertEquals(7.2f, result.secondInitField);
    assertEquals(true, result.secondFreeField);
    assertEquals("\\Jonny \"Magic\" Smith\n", result.thirdInitField);
  }

  @Test
  public void testPositionalDefaultsOneInitArgCtor() {
    StructWithJavaPositionalDefaults result =
        new StructWithJavaPositionalDefaults("Foo", true, -17);

    assertEquals(-17, result.firstInitField);
    assertEquals("Foo", result.firstFreeField);
    assertEquals(7.2f, result.secondInitField);
    assertEquals(true, result.secondFreeField);
    assertEquals("\\Jonny \"Magic\" Smith\n", result.thirdInitField);
  }

  @Test
  public void testPositionalDefaultsTwoInitArgsCtor() {
    StructWithJavaPositionalDefaults result =
        new StructWithJavaPositionalDefaults("Foo", true, -17, 3.14f);

    assertEquals(-17, result.firstInitField);
    assertEquals("Foo", result.firstFreeField);
    assertEquals(3.14f, result.secondInitField);
    assertEquals(true, result.secondFreeField);
    assertEquals("\\Jonny \"Magic\" Smith\n", result.thirdInitField);
  }

  @Test
  public void testPositionalDefaultsThreeInitArgsCtor() {
    StructWithJavaPositionalDefaults result =
        new StructWithJavaPositionalDefaults("Foo", true, -17, 3.14f, "bar");

    assertEquals(-17, result.firstInitField);
    assertEquals("Foo", result.firstFreeField);
    assertEquals(3.14f, result.secondInitField);
    assertEquals(true, result.secondFreeField);
    assertEquals("bar", result.thirdInitField);
  }
}
