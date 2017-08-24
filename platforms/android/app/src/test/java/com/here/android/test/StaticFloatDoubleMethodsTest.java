package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertEquals;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class StaticFloatDoubleMethodsTest {
    @Test
    public void returnIncrementedFloat_simpleCase() {
        assertEquals(2.5f, StaticFloatDoubleMethods.returnIncrementedFloat(1.5f));
    }

    @Test
    public void sumTwoFloats_simpleCase() {
        assertEquals(5.0f, StaticFloatDoubleMethods.sumTwoFloats(1.5f, 3.5f));
    }

    @Test
    public void returnFloat_notANumber() {
        assertEquals(Float.NaN, StaticFloatDoubleMethods.returnFloat(Float.NaN));
    }

    @Test
    public void returnFloat_maxValue() {
        assertEquals(Float.MAX_VALUE, StaticFloatDoubleMethods.returnFloat(Float.MAX_VALUE));
    }

    @Test
    public void returnFloat_minValue() {
        assertEquals(Float.MIN_VALUE, StaticFloatDoubleMethods.returnFloat(Float.MIN_VALUE));
    }

    @Test
    public void returnIncrementedDouble_simpleCase() {
        assertEquals(2.5, StaticFloatDoubleMethods.returnIncrementedDouble(1.5));
    }

    @Test
    public void sumTwoDoubles() {
        assertEquals(5.0, StaticFloatDoubleMethods.sumTwoDoubles(1.5, 3.5));
    }

    @Test
    public void nanDoubleValue() {
        assertEquals(Double.NaN, StaticFloatDoubleMethods.returnDouble(Double.NaN));
    }

    @Test
    public void maxDoubleValue() {
        assertEquals(Double.MAX_VALUE, StaticFloatDoubleMethods.returnDouble(Double.MAX_VALUE));
    }

    @Test
    public void minDoubleValue() {
        assertEquals(Double.MIN_VALUE, StaticFloatDoubleMethods.returnDouble(Double.MIN_VALUE));
    }
}
