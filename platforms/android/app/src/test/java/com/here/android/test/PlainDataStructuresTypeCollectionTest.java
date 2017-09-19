package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;
import com.here.android.test.AllTypesStruct;
import com.here.android.test.Color;
import com.here.android.test.ColoredLine;
import com.here.android.test.Line;
import com.here.android.test.Point;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public class PlainDataStructuresTypeCollectionTest {

    @Test
    public void returnSimpleDataStructure() {
        Point point = PlainDataStructuresFromTypeCollection.createPoint(1.0, 2.0);

        assertNotNull(point);
        assertEquals(1.0, point.x);
        assertEquals(2.0, point.y);
    }

    @Test
    public void manipulateSimpleDataStructure() {
        Point point = new Point();
        point.x = 1.0;
        point.y = 2.0;

        Point result = PlainDataStructuresFromTypeCollection.swapPointCoordinates(point);

        assertNotNull(point);
        assertEquals(2.0, result.x);
        assertEquals(1.0, result.y);
    }

    @Test
    public void createNestedDataStructureWithMultipleParams() {
        Point point1 = PlainDataStructuresFromTypeCollection.createPoint(1.0, 2.0);
        Point point2 = new Point();
        point2.x = 3.0;
        point2.y = 4.0;

        Line line = PlainDataStructuresFromTypeCollection.createLine(point1, point2);

        assertNotNull(line);
        assertEquals(1.0, line.a.x);
        assertEquals(2.0, line.a.y);
        assertEquals(3.0, line.b.x);
        assertEquals(4.0, line.b.y);
    }

    @Test
    public void manifoldNestedDataStructure() {
        Point point1 = PlainDataStructuresFromTypeCollection.createPoint(1.0, 2.0);
        Point point2 = PlainDataStructuresFromTypeCollection.createPoint(3.0, 4.0);
        Line line = PlainDataStructuresFromTypeCollection.createLine(point1, point2);
        Color color = new Color();
        color.red = 10;
        color.green = 20;
        color.blue = 30;

        ColoredLine coloredLine =
                PlainDataStructuresFromTypeCollection.createColoredLine(line, color);

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
        AllTypesStruct allTypesStruct = new AllTypesStruct();
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
        allTypesStruct.pointField = PlainDataStructuresFromTypeCollection.createPoint(11.0, 12.0);

        AllTypesStruct result =
                PlainDataStructuresFromTypeCollection.modifyAllTypesStruct(allTypesStruct);

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
}
