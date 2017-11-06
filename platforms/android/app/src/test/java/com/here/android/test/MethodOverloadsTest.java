package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants =
        BuildConfig.class)
public class MethodOverloadsTest {

    @Test
    public void isBooleanWithBoolean() {
        boolean value = false;

        boolean result = MethodOverloads.isBoolean(value);

        assertTrue(result);
    }

    @Test
    public void isBooleanWithByte() {
        byte value = 42;

        boolean result = MethodOverloads.isBoolean(value);

        assertFalse(result);
    }

    @Test
    public void isBooleanWithString() {
        String value = "nonsense";

        boolean result = MethodOverloads.isBoolean(value);

        assertFalse(result);
    }

    @Test
    public void isBooleanWithStruct() {
        MethodOverloads.Point value = new MethodOverloads.Point();

        boolean result = MethodOverloads.isBoolean(value);

        assertFalse(result);
    }

    @Test
    public void isBooleanWithEverything() {
        boolean value1 = false;
        byte value2 = 42;
        String value3 = "nonsense";
        MethodOverloads.Point value4 = new MethodOverloads.Point();

        boolean result = MethodOverloads.isBoolean(value1, value2, value3, value4);

        assertFalse(result);
    }
}
