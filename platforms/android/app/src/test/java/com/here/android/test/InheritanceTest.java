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

        String result = instance.getName();

        assertEquals("Johnny", result);
    }

    @Test
    public void castChildClassInstanceToParent() {
        ParentInterface instance = ChildClass.createChildClass().castToParent();

        String result = instance.getName();

        assertEquals("Johnny", result);
    }

    @Test
    public void createGrandchildClassInstance() {
        GrandchildClass instance = GrandchildClass.createGrandchildClass();

        String result = instance.getName();

        assertEquals("John F. Kimberly", result);
    }

    @Test
    public void castGrandchildClassInstanceToParent() {
        ParentInterface instance = GrandchildClass.createGrandchildClass().castToParent();

        String result = instance.getName();

        assertEquals("John F. Kimberly", result);
    }
}
