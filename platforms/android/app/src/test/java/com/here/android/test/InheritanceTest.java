package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public class InheritanceTest {

    @Test
    public void createChildClassInstance() {
        ChildClass instance = ChildClass.createChildClass();

        assertEquals("Johnny", instance.getName());
        assertEquals(7, instance.getLuckyNumber());
    }

    @Test
    public void castChildClassInstanceToParent() {
        ParentInterface instance = ChildClass.createChildClass().castToParent();

        assertEquals("Johnny", instance.getName());
        assertEquals(7, instance.getLuckyNumber());
    }

    @Test
    public void createGrandchildClassInstance() {
        GrandchildClass instance = GrandchildClass.createGrandchildClass();

        assertEquals("John F. Kimberly", instance.getName());
        assertEquals(42, instance.getLuckyNumber());
    }

    @Test
    public void castGrandchildClassInstanceToParent() {
        ParentInterface instance = GrandchildClass.createGrandchildClass().castToParent();

        assertEquals("John F. Kimberly", instance.getName());
        assertEquals(42, instance.getLuckyNumber());
    }
}
