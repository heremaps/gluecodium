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

package com.example.smoke;
import com.example.NativeBase;
import java.util.ArrayList;
import java.util.List;
public class Arrays extends NativeBase {
    public static class BasicStruct {
        public double value;
        public BasicStruct() {}
        public BasicStruct(double value) {
            this.value = value;
        }
    }
    public static class FancyStruct {
        public List<String> messages = new ArrayList<>();
        public List<Long> numbers = new ArrayList<>();
        public FancyStruct() {}
        public FancyStruct(List<String> messages, List<Long> numbers) {
            this.messages = messages;
            this.numbers = numbers;
        }
    }
    /** For internal use only */
    protected Arrays(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native List<String> methodWithArray(final List<String> input);
    public static native List<Long> methodWithArrayInline(final List<Long> input);
    public static native List<Arrays.BasicStruct> methodWithStructArray(final List<Arrays.BasicStruct> input);
    public static native List<List<Long>> methodWithArrayOfArrays(final List<List<Long>> input);
    public static native List<Arrays.FancyStruct> mergeArraysOfStructsWithArrays(final List<Arrays.FancyStruct> inlineFancyArray, final List<Arrays.FancyStruct> fancyArray);
    public static native List<String> methodWithArrayOfAliases(final List<String> input);
}
