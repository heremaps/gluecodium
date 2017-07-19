package com.here.android.test;

import android.support.test.runner.AndroidJUnit4;

import org.junit.Test;
import org.junit.runner.RunWith;

import static junit.framework.Assert.assertEquals;

@RunWith(AndroidJUnit4.class)
public class StaticFloatDoubleMethodsIntegrationTest {

    @Test
    public void incrementFloatValue() {
        float output = StaticFloatDoubleMethodsTest.returnIncrementedFloat(1.5f);

        assertEquals(2.5f, output);
    }

    @Test
    public void sumFloatValues() {
        float output = StaticFloatDoubleMethodsTest.sumTwoFloats(1.5f, 3.5f);

        assertEquals(5.0f, output);
    }

    @Test
    public void nanFloatValue() {
        float output = StaticFloatDoubleMethodsTest.returnFloat(Float.NaN);

        assertEquals(Float.NaN, output);
    }

    @Test
    public void maxFloatValue() {
        float output = StaticFloatDoubleMethodsTest.returnFloat(Float.MAX_VALUE);

        assertEquals(Float.MAX_VALUE, output);
    }

    @Test
    public void minFloatValue() {
        float output = StaticFloatDoubleMethodsTest.returnFloat(Float.MIN_VALUE);

        assertEquals(Float.MIN_VALUE, output);
    }

    @Test
    public void incrementDoubleValue() {
        double output = StaticFloatDoubleMethodsTest.returnIncrementedDouble(1.5);

        assertEquals(2.5, output);
    }

    @Test
    public void sumDoubleValues() {
        double output = StaticFloatDoubleMethodsTest.sumTwoDoubles(1.5, 3.5);

        assertEquals(5.0, output);
    }

    @Test
    public void nanDoubleValue() {
        double output = StaticFloatDoubleMethodsTest.returnDouble(Double.NaN);

        assertEquals(Double.NaN, output);
    }

    @Test
    public void maxDoubleValue() {
        double output = StaticFloatDoubleMethodsTest.returnDouble(Double.MAX_VALUE);

        assertEquals(Double.MAX_VALUE, output);
    }

    @Test
    public void minDoubleValue() {
        double output = StaticFloatDoubleMethodsTest.returnDouble(Double.MIN_VALUE);

        assertEquals(Double.MIN_VALUE, output);
    }
}
