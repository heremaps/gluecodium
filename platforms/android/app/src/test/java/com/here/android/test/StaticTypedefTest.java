package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class StaticTypedefTest {
    private static final String EXAMPLE_STRING = "exampleString";
    private static final String HELLO_PREFIX = "Hello ";
    private static final double VALUE_X = 10.0;
    private static final double VALUE_Y = 20.0;

    @Test
    public void returnIntTypedef() {
        int testValue = 10;

        int result = StaticTypedef.returnIntTypedef(testValue);

        assertEquals(testValue + 1, result);
    }

    @Test
    public void returnStringTypedef() {
        String testValue = EXAMPLE_STRING;

        String result = StaticTypedef.returnStringTypedef(testValue);

        assertEquals(HELLO_PREFIX + testValue, result);
    }

    @Test
    public void returnByteBufferTypedef() {
        byte[] testValue = "byteArray".getBytes();

        byte[] result = StaticTypedef.returnByteBufferTypedef(testValue);

        assertTrue(Arrays.equals("yarrAetyb".getBytes(), result));
    }

    @Test
    public void returnExampleStructTypedef() {
        StaticTypedef.ExampleStruct exampleStruct = new StaticTypedef.ExampleStruct();
        exampleStruct.exampleString = EXAMPLE_STRING;

        StaticTypedef.ExampleStruct result =
                StaticTypedef.returnExampleStructTypedef(exampleStruct);

        assertEquals(HELLO_PREFIX + EXAMPLE_STRING, result.exampleString);
    }

    @Test
    public void returnTypedefPointFromTypeCollection() {
        Point point = new Point();
        point.x = VALUE_X;
        point.y = VALUE_Y;

        Point result = StaticTypedef.returnTypedefPointFromTypeCollection(point);

        assertEquals(VALUE_X, result.x);
        assertEquals(VALUE_Y, result.y);
    }

    @Test
    public void returnNestedIntTypedef() {
        int testValue = 20;

        int result = StaticTypedef.returnNestedIntTypedef(testValue);

        assertEquals(testValue + 1, result);
    }

    @Test
    public void returnNestedStructTypedef() {
        StaticTypedef.ExampleStruct exampleStruct = new StaticTypedef.ExampleStruct();
        exampleStruct.exampleString = EXAMPLE_STRING;

        StaticTypedef.ExampleStruct result =
                StaticTypedef.returnNestedStructTypedef(exampleStruct);

        assertEquals(HELLO_PREFIX + EXAMPLE_STRING, result.exampleString);
    }
}
