package com.here.android.test;

import android.support.test.filters.SmallTest;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Test;
import org.junit.runner.RunWith;

import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

@RunWith(AndroidJUnit4.class)
@SmallTest
public final class StaticBooleanIntegrationTest {
    @Test
    public void invertBoolean() {
        boolean result = StaticBooleanMethodsTest.returnInvertedBoolean(true);

        assertFalse(result);
    }

    @Test
    public void booleanAndReturnsFalse() {
        boolean result = StaticBooleanMethodsTest.returnAndBoolean(true, false);

        assertFalse(result);
    }

    @Test
    public void booleanAndReturnsTrue() {
        boolean result = StaticBooleanMethodsTest.returnAndBoolean(true, true);

        assertTrue(result);
    }
}
