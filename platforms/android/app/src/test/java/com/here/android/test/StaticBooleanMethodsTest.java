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
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class StaticBooleanMethodsTest {
    @Test
    public void returnInvertedBoolean_True() {
        // Arrange, act, assert
        assertFalse(StaticBooleanMethods.returnInvertedBoolean(true));
    }

    @Test
    public void returnInvertedBoolean_booleanAndReturnsFalse() {
        // Arrange, act, assert
        assertFalse(StaticBooleanMethods.returnAndBoolean(true, false));
    }

    @Test
    public void returnInvertedBoolean_booleanAndReturnsTrue() {
        // Arrange, act, assert
        assertTrue(StaticBooleanMethods.returnAndBoolean(true, true));
    }
}
