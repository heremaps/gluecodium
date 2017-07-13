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
public final class StaticFloatDoubleMethodsTestTest {
    @Test
    public void incrementFloatValue() {
        assertEquals(2.5f, StaticFloatDoubleMethodsTest.returnIncrementedFloat(1.5f));
    }

    @Test
    public void sumFloatValues() {
        assertEquals(5.0f, StaticFloatDoubleMethodsTest.sumTwoFloats(1.5f, 3.5f));
    }

    @Test
    public void nanFloatValue() {
        assertEquals(Float.NaN, StaticFloatDoubleMethodsTest.returnFloat(Float.NaN));
    }

    @Test
    public void maxFloatValue() {
        assertEquals(Float.MAX_VALUE, StaticFloatDoubleMethodsTest.returnFloat(Float.MAX_VALUE));
    }

    @Test
    public void minFloatValue() {
        assertEquals(Float.MIN_VALUE, StaticFloatDoubleMethodsTest.returnFloat(Float.MIN_VALUE));
    }

    @Test
    public void incrementDoubleValue() {
        assertEquals(2.5, StaticFloatDoubleMethodsTest.returnIncrementedDouble(1.5));
    }

    @Test
    public void sumDoubleValues() {
        assertEquals(5.0, StaticFloatDoubleMethodsTest.sumTwoDoubles(1.5, 3.5));
    }

    @Test
    public void nanDoubleValue() {
        assertEquals(Double.NaN, StaticFloatDoubleMethodsTest.returnDouble(Double.NaN));
    }

    @Test
    public void maxDoubleValue() {
        assertEquals(Double.MAX_VALUE, StaticFloatDoubleMethodsTest.returnDouble(Double.MAX_VALUE));
    }

    @Test
    public void minDoubleValue() {
        assertEquals(Double.MIN_VALUE, StaticFloatDoubleMethodsTest.returnDouble(Double.MIN_VALUE));
    }
}
