package com.here.android.hello;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public class HelloWorldInstancesTest {

    private static final String TEST_STRING = "TestString";

    @Test
    public void simpleInstantiable_setAndGet() {
        SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();

        simpleInstantiable.setStringValue(TEST_STRING);

        assertEquals(TEST_STRING, simpleInstantiable.getStringValue());
    }

    @Test
    public void nestedInstantiable_create() {
        SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();

        NestedInstantiable nestedInstantiable = HelloWorldFactory.createNested(simpleInstantiable);

        assertNotNull(nestedInstantiable);
    }

    @Test
    public void nestedInstantiable_get() {
        NestedInstantiable nestedInstantiable = HelloWorldFactory.createNested(
                HelloWorldFactory.createSimple());

        nestedInstantiable.getInstantiable().setStringValue(TEST_STRING);

        assertEquals(TEST_STRING, nestedInstantiable.getInstantiable().getStringValue());
    }


    @Test
    public void nestedInstantiable_set() {
        NestedInstantiable nestedInstantiable = HelloWorldFactory.createNested(
                HelloWorldFactory.createSimple());
        SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();
        simpleInstantiable.setStringValue(TEST_STRING);

        nestedInstantiable.setInstantiable(simpleInstantiable);

        assertEquals(TEST_STRING, nestedInstantiable.getInstantiable().getStringValue());
    }
}
