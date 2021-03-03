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
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class PlainDataStructuresTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void returnSimpleDataStructure() {
    PlainDataStructures.Point point = PlainDataStructures.createPoint(1.0, 2.0);

    assertNotNull(point);
    assertEquals(1.0, point.x);
    assertEquals(2.0, point.y);
  }

  @Test
  public void manipulateSimpleDataStructure() {
    PlainDataStructures.Point point = new PlainDataStructures.Point();
    point.x = 1.0;
    point.y = 2.0;

    PlainDataStructures.Point result = PlainDataStructures.swapPointCoordinates(point);

    assertNotNull(point);
    assertEquals(2.0, result.x);
    assertEquals(1.0, result.y);
  }

  @Test
  public void createNestedDataStructureWithMultipleParams() {
    PlainDataStructures.Point point1 = PlainDataStructures.createPoint(1.0, 2.0);
    PlainDataStructures.Point point2 = new PlainDataStructures.Point();
    point2.x = 3.0;
    point2.y = 4.0;

    PlainDataStructures.Line line = PlainDataStructures.createLine(point1, point2);

    assertNotNull(line);
    assertEquals(1.0, line.a.x);
    assertEquals(2.0, line.a.y);
    assertEquals(3.0, line.b.x);
    assertEquals(4.0, line.b.y);
  }

  @Test
  public void manifoldNestedDataStructure() {
    PlainDataStructures.Point point1 = PlainDataStructures.createPoint(1.0, 2.0);
    PlainDataStructures.Point point2 = PlainDataStructures.createPoint(3.0, 4.0);
    PlainDataStructures.Line line = PlainDataStructures.createLine(point1, point2);
    PlainDataStructures.Color color = new PlainDataStructures.Color();
    color.red = 10;
    color.green = 20;
    color.blue = 30;

    PlainDataStructures.ColoredLine coloredLine =
        PlainDataStructures.createColoredLine(line, color);

    assertNotNull(coloredLine);
    assertEquals(1.0, coloredLine.line.a.x);
    assertEquals(2.0, coloredLine.line.a.y);
    assertEquals(3.0, coloredLine.line.b.x);
    assertEquals(4.0, coloredLine.line.b.y);
    assertEquals(10, coloredLine.color.red);
    assertEquals(20, coloredLine.color.green);
    assertEquals(30, coloredLine.color.blue);
  }

  @Test
  public void allTypesZeroesRoundTrip() {
    PlainDataStructures.AllTypesStruct allTypesStruct =
        new PlainDataStructures.AllTypesStruct(PlainDataStructures.createPoint(0.0, 0.0));
    allTypesStruct.booleanField = false;
    allTypesStruct.doubleField = 0.0;
    allTypesStruct.floatField = 0.0f;
    allTypesStruct.int8Field = 0;
    allTypesStruct.int16Field = 0;
    allTypesStruct.int32Field = 0;
    allTypesStruct.int64Field = 0;
    allTypesStruct.uint8Field = 0;
    allTypesStruct.uint16Field = 0;
    allTypesStruct.uint32Field = 0;
    allTypesStruct.uint64Field = 0;
    allTypesStruct.stringField = "";

    PlainDataStructures.AllTypesStruct result =
        PlainDataStructures.returnAllTypesStruct(allTypesStruct);

    assertNotNull(result);
    assertEquals(false, result.booleanField);
    assertEquals(0.0, result.doubleField);
    assertEquals(0.0f, result.floatField);
    assertEquals(0, result.int8Field);
    assertEquals(0, result.int16Field);
    assertEquals(0, result.int32Field);
    assertEquals(0, result.int64Field);
    assertEquals(0, result.uint8Field);
    assertEquals(0, result.uint16Field);
    assertEquals(0, result.uint32Field);
    assertEquals(0, result.uint64Field);
    assertEquals("", result.stringField);
    assertEquals(0.0, result.pointField.x);
    assertEquals(0.0, result.pointField.y);
  }

  @Test
  public void modifyAllBuiltInAndCustomTypesDataStructure() {
    PlainDataStructures.AllTypesStruct allTypesStruct =
        new PlainDataStructures.AllTypesStruct(PlainDataStructures.createPoint(11.0, 12.0));
    allTypesStruct.booleanField = true;
    allTypesStruct.doubleField = 1.0;
    allTypesStruct.floatField = 2.0f;
    allTypesStruct.int8Field = 3;
    allTypesStruct.int16Field = 4;
    allTypesStruct.int32Field = 5;
    allTypesStruct.int64Field = 6;
    allTypesStruct.uint8Field = 7;
    allTypesStruct.uint16Field = 8;
    allTypesStruct.uint32Field = 9;
    allTypesStruct.uint64Field = 10;
    allTypesStruct.stringField = "test string";

    PlainDataStructures.AllTypesStruct result =
        PlainDataStructures.modifyAllTypesStruct(allTypesStruct);

    assertNotNull(result);
    assertEquals(false, result.booleanField);
    assertEquals(allTypesStruct.doubleField + 1.0, result.doubleField);
    assertEquals(allTypesStruct.floatField + 1.0f, result.floatField);
    assertEquals(allTypesStruct.int8Field + 1, result.int8Field);
    assertEquals(allTypesStruct.int16Field + 1, result.int16Field);
    assertEquals(allTypesStruct.int32Field + 1, result.int32Field);
    assertEquals(allTypesStruct.int64Field + 1, result.int64Field);
    assertEquals(allTypesStruct.uint8Field + 1, result.uint8Field);
    assertEquals(allTypesStruct.uint16Field + 1, result.uint16Field);
    assertEquals(allTypesStruct.uint32Field + 1, result.uint32Field);
    assertEquals(allTypesStruct.uint64Field + 1, result.uint64Field);
    assertEquals("Hello test string", result.stringField);
    assertEquals(12.0, result.pointField.x);
    assertEquals(11.0, result.pointField.y);
  }

  @Test
  public void setStringToNull() {
    expectedException.expect(NullPointerException.class);

    PlainDataStructures.AllTypesStruct allTypesStruct =
        new PlainDataStructures.AllTypesStruct(PlainDataStructures.createPoint(11.0, 12.0));
    allTypesStruct.stringField = null;

    PlainDataStructures.AllTypesStruct result =
        PlainDataStructures.returnAllTypesStruct(allTypesStruct);
  }

  @Test
  public void allTypesImmutableStructBuilder() {
    PlainDataStructuresImmutable.AllTypesImmutableStruct allTypesStruct =
        new PlainDataStructuresImmutable.AllTypesImmutableStruct(
            (byte) 3,
            (short) 4,
            (short) 5,
            6,
            7,
            8L,
            9L,
            10L,
            2.0f,
            1.0,
            "test string",
            true,
            new PlainDataStructuresImmutable.Point(11.0, 12.0));

    PlainDataStructuresImmutable.AllTypesImmutableStruct.Builder builder =
        new PlainDataStructuresImmutable.AllTypesImmutableStruct.Builder();

    PlainDataStructuresImmutable.AllTypesImmutableStruct result =
        builder
            .setInt8Field((byte) 3)
            .setUint8Field((short) 4)
            .setInt16Field((short) 5)
            .setUint16Field(6)
            .setInt32Field(7)
            .setUint32Field(8L)
            .setInt64Field(9L)
            .setUint64Field(10L)
            .setFloatField(2.0f)
            .setDoubleField(1.0)
            .setStringField("test string")
            .setBooleanField(true)
            .setPointField(new PlainDataStructuresImmutable.Point(11.0, 12.0))
            .build();

    assertEquals(allTypesStruct.booleanField, result.booleanField);
    assertEquals(allTypesStruct.doubleField, result.doubleField);
    assertEquals(allTypesStruct.floatField, result.floatField);
    assertEquals(allTypesStruct.int8Field, result.int8Field);
    assertEquals(allTypesStruct.int16Field, result.int16Field);
    assertEquals(allTypesStruct.int32Field, result.int32Field);
    assertEquals(allTypesStruct.int64Field, result.int64Field);
    assertEquals(allTypesStruct.uint8Field, result.uint8Field);
    assertEquals(allTypesStruct.uint16Field, result.uint16Field);
    assertEquals(allTypesStruct.uint32Field, result.uint32Field);
    assertEquals(allTypesStruct.uint64Field, result.uint64Field);
    assertEquals(allTypesStruct.stringField, result.stringField);
    assertEquals(allTypesStruct.pointField.x, result.pointField.x);
    assertEquals(allTypesStruct.pointField.y, result.pointField.y);
  }

  @Test
  public void checkAllFieldsAreInitialized() {
    assertTrue(PlainDataStructures.checkAllFieldsAreInitialized());
  }
}
