/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.here.android.smoke;

import com.here.android.smoke.Arrays;
import java.util.List;

public class Arrays {
    public static class BasicStruct {
        public double value;
    }
    public static class FancyStruct {
        public java.util.List<String> messages = new java.util.List<String>();
        public java.util.List<long> numbers = new java.util.List<long>();
    }
    public static native java.util.List<String> methodWithArray(final java.util.List<String> input);
    public static native java.util.List<long> methodWithArrayInline(final java.util.List<long> input);
    public static native java.util.List<Arrays.BasicStruct> methodWithStructArray(final java.util.List<Arrays.BasicStruct> input);
    public static native java.util.List<java.util.List<Long>> methodWithArrayOfArrys(final java.util.List<java.util.List<Long>> input);
    public static native java.util.List<Arrays.FancyStruct> mergeArraysOfStructsWithArrays(final java.util.List<Arrays.FancyStruct> inlineFancyArray, final java.util.List<Arrays.FancyStruct> fancyArray);
}