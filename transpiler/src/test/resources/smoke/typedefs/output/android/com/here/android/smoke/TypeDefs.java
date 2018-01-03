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

import com.here.android.NativeBase;
import java.util.List;

public class TypeDefs extends NativeBase {
    public static class StructHavingAliasFieldDefinedBelow {
        public double field;
        public StructHavingAliasFieldDefinedBelow() {}
        public StructHavingAliasFieldDefinedBelow(double field) {
            this.field = field;
        }
    }
    public static class TestStruct {
        public String something;
        public TestStruct() {}
        public TestStruct(String something) {
            this.something = something;
        }
    }
    protected TypeDefs(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native double methodWithPrimitiveTypeDef(final double input);
    public static native List<TypeDefs.TestStruct> methodWithComplexTypeDef(final List<TypeDefs.TestStruct> input);
    public static native double returnNestedIntTypeDef(final double input);
    public static native TypeDefs.TestStruct returnTestStructTypeDef(final TypeDefs.TestStruct input);
    public static native TypeDefs.TestStruct returnNestedStructTypeDef(final TypeDefs.TestStruct input);
    public static native Point returnTypeDefPointFromTypeCollection(final Point input);
    public native List<Double> getPrimitiveTypeAttribute();
    public native void setPrimitiveTypeAttribute(final List<Double> value);
}