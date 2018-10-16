/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;
import java.util.List;

public class TypeDefs extends NativeBase {
    public static class StructHavingAliasFieldDefinedBelow {
        public double field;
        public StructHavingAliasFieldDefinedBelow() {
            this(0);
        }
        public StructHavingAliasFieldDefinedBelow(double field) {
            this.field = field;
        }
    }
    public static class TestStruct {
        public String something;
        public TestStruct() {
            this((String)null);
        }
        public TestStruct(String something) {
            this.something = something;
        }
    }
    /** For internal use only */
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