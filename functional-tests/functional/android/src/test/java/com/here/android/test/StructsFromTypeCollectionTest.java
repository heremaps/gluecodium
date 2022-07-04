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

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class StructsFromTypeCollectionTest {

  @Test
  public void returnSimpleDataStructure() {
    TypeCollection.Point point = PlainDataStructuresFromTypeCollection.createPoint(1.0, 2.0);

    assertNotNull(point);
    assertEquals(1.0, point.x);
    assertEquals(2.0, point.y);
  }

  @Test
  public void manipulateSimpleDataStructure() {
    TypeCollection.Point point = new TypeCollection.Point(1.0, 2.0);

    TypeCollection.Point result = PlainDataStructuresFromTypeCollection.swapPointCoordinates(point);

    assertNotNull(point);
    assertEquals(2.0, result.x);
    assertEquals(1.0, result.y);
  }

  @Test
  public void createNestedDataStructureWithMultipleParams() {
    TypeCollection.Point point1 = PlainDataStructuresFromTypeCollection.createPoint(1.0, 2.0);
    TypeCollection.Point point2 = new TypeCollection.Point(3.0, 4.0);

    TypeCollection.Line line = PlainDataStructuresFromTypeCollection.createLine(point1, point2);

    assertNotNull(line);
    assertEquals(1.0, line.a.x);
    assertEquals(2.0, line.a.y);
    assertEquals(3.0, line.b.x);
    assertEquals(4.0, line.b.y);
  }

  @Test
  public void manifoldNestedDataStructure() {
    TypeCollection.Point point1 = PlainDataStructuresFromTypeCollection.createPoint(1.0, 2.0);
    TypeCollection.Point point2 = PlainDataStructuresFromTypeCollection.createPoint(3.0, 4.0);
    TypeCollection.Line line = PlainDataStructuresFromTypeCollection.createLine(point1, point2);
    TypeCollection.Color color = new TypeCollection.Color();
    color.red = 10;
    color.green = 20;
    color.blue = 30;

    TypeCollection.ColoredLine coloredLine = PlainDataStructuresFromTypeCollection.createColoredLine(line, color);

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
    TypeCollection.AllTypesStruct allTypesStruct =
        new TypeCollection.AllTypesStruct(PlainDataStructuresFromTypeCollection.createPoint(11.0, 12.0));
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

    TypeCollection.AllTypesStruct result =
        PlainDataStructuresFromTypeCollection.modifyAllTypesStruct(allTypesStruct);

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
}
