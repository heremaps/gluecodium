/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;
import java.util.List;

public class Attributes extends NativeBase {
    public enum InternalError {
        ERROR_NONE(0),
        ERROR_FATAL(999);

        public final int value;

        InternalError(final int value) {
            this.value = value;
        }
    }
    public static class ExampleStruct {
        public double value;
        public ExampleStruct() {}
        public ExampleStruct(double value) {
            this.value = value;
        }
    }
    /** For internal use only */
    protected Attributes(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);

    public native long getBuiltInTypeAttribute();
    public native void setBuiltInTypeAttribute(final long value);
    public native float getReadonlyAttribute();
    public native Attributes.ExampleStruct getStructAttribute();
    public native void setStructAttribute(final Attributes.ExampleStruct value);
    public native List<String> getArrayAttribute();
    public native void setArrayAttribute(final List<String> value);
    public native Attributes.InternalError getComplexTypeAttribute();
    public native void setComplexTypeAttribute(final Attributes.InternalError value);
    public native byte[] getByteBufferAttribute();
    public native void setByteBufferAttribute(final byte[] value);
    public native AttributesInterface getInstanceAttribute();
    public native void setInstanceAttribute(final AttributesInterface value);
}
