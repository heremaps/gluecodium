/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Random;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class StaticByteArrayMethodsTestTest {
    private static final int LARGE_BYTE_ARRAY_SIZE = 100000;

    @Test
    public void reverseSmallByteArray() {
        byte[] input = "InputBytes".getBytes();

        byte[] output = StaticByteArrayMethodsTest.returnReverseByteBuffer(input);

        assertEquals("setyBtupnI", new String(output));
    }

    @Test
    public void emptyByteArray() {
        byte[] input = {};

        byte[] output = StaticByteArrayMethodsTest.returnInputByteBuffer(input);

        assertTrue(Arrays.equals(input, output));
    }

    @Test
    public void concatenateByteArrays() {
        byte[] input1 = "byte".getBytes();
        byte[] input2 = "array".getBytes();

        byte[] output = StaticByteArrayMethodsTest.concatenateByteBuffers(input1, input2);

        assertEquals("bytearray", new String(output));
    }


    @Test
    public void largeByteArray() {
        byte[] input = new byte[LARGE_BYTE_ARRAY_SIZE];
        new Random().nextBytes(input);

        byte[] output = StaticByteArrayMethodsTest.returnInputByteBuffer(input);

        assertTrue(Arrays.equals(input, output));
    }
}
