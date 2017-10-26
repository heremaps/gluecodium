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
public final class MethodOverloadsTest {
    @Test
    public void isBooleanWithBoolean() {
        boolean result = MethodOverloads.isBoolean(false);

        assertTrue(result);
    }

    @Test
    public void isBooleanWithByte() {
        boolean result = MethodOverloads.isBoolean((byte) 42);

        assertFalse(result);
    }

    @Test
    public void isBooleanWithString() {
        boolean result = MethodOverloads.isBoolean("nonsense");

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
        MethodOverloads.Point value4 = new MethodOverloads.Point();

        boolean result = MethodOverloads.isBoolean(false, (byte) 42, "nonsense", value4);

        assertFalse(result);
    }
}
