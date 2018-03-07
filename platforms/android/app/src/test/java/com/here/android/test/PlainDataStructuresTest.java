/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import com.here.android.hello.HelloWorldBuiltinTypes;
import java.util.Arrays;
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
public final class PlainDataStructuresTest {
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
  public void modifyAllBuiltInAndCustomTypesDataStructure() {
    PlainDataStructures.AllTypesStruct allTypesStruct = new PlainDataStructures.AllTypesStruct();
    allTypesStruct.booleanField = true;
    allTypesStruct.bytesField = "hello".getBytes();
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
    allTypesStruct.pointField = PlainDataStructures.createPoint(11.0, 12.0);

    PlainDataStructures.AllTypesStruct result =
        PlainDataStructures.modifyAllTypesStruct(allTypesStruct);

    assertNotNull(result);
    assertEquals(false, result.booleanField);
    assertTrue(Arrays.equals("olleh".getBytes(), result.bytesField));
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
  public void setStringAndByteArrayToNull() {
    PlainDataStructures.AllTypesStruct allTypesStruct = new PlainDataStructures.AllTypesStruct();
    allTypesStruct.pointField = PlainDataStructures.createPoint(11.0, 12.0);
    allTypesStruct.stringField = null;
    allTypesStruct.bytesField = null;

    PlainDataStructures.AllTypesStruct result =
        PlainDataStructures.returnAllTypesStruct(allTypesStruct);

    assertEquals(
        "Strings set to null are converted and returned as empty strings", "", result.stringField);
    assertTrue(
        "Byte arrays set to null are converted and returned as empty byte arrays",
        Arrays.equals(new byte[] {}, result.bytesField));
  }

  @Test
  public void useUninitializedAllTypesStructure() {
    PlainDataStructures.AllTypesStruct allTypesStruct = new PlainDataStructures.AllTypesStruct();

    PlainDataStructures.AllTypesStruct result =
        PlainDataStructures.returnAllTypesStruct(allTypesStruct);

    assertNotNull(allTypesStruct.pointField);
    assertNotNull(result.pointField);
  }

  @Test
  public void useUninitializedNestedStructure() {
    PlainDataStructures.ColoredLine coloredLine = new PlainDataStructures.ColoredLine();

    PlainDataStructures.ColoredLine result = PlainDataStructures.returnColoredLine(coloredLine);

    assertNotNull(coloredLine.line.a);
    assertNotNull(coloredLine.line.b);
    assertNotNull(coloredLine.color);
    assertNotNull(result.line.a);
    assertNotNull(result.line.b);
    assertNotNull(result.color);
  }

  @Test
  public void executeVoidMethod() {
    final int testValue = 10;

    HelloWorldBuiltinTypes.voidMethod(testValue);

    assertEquals(testValue, HelloWorldBuiltinTypes.getVoidMethodParameter());
  }

  @Test
  public void createInheritedDataStructure() {
    PlainDataStructures.Point point1 = PlainDataStructures.createPoint(1.0, 2.0);
    PlainDataStructures.Point point2 = PlainDataStructures.createPoint(3.0, 4.0);
    PlainDataStructures.Line line = PlainDataStructures.createLine(point1, point2);
    PlainDataStructures.Color color = new PlainDataStructures.Color();
    color.red = 10;
    color.green = 20;
    color.blue = 30;

    PlainDataStructures.ColoredLineInherited coloredLine =
        PlainDataStructures.createColoredLineInherited(line, color);

    assertNotNull(coloredLine);
    assertEquals(1.0, coloredLine.a.x);
    assertEquals(2.0, coloredLine.a.y);
    assertEquals(3.0, coloredLine.b.x);
    assertEquals(4.0, coloredLine.b.y);
    assertEquals(10, coloredLine.color.red);
    assertEquals(20, coloredLine.color.green);
    assertEquals(30, coloredLine.color.blue);
  }

  @Test
  public void useUninitializedInheritedStructure() {
    PlainDataStructures.ColoredLineInherited coloredLine =
        new PlainDataStructures.ColoredLineInherited();

    PlainDataStructures.ColoredLineInherited result =
        PlainDataStructures.returnColoredLineInherited(coloredLine);

    assertNotNull(coloredLine.a);
    assertNotNull(coloredLine.b);
    assertNotNull(coloredLine.color);
    assertNotNull(result.a);
    assertNotNull(result.b);
    assertNotNull(result.color);
  }
}
