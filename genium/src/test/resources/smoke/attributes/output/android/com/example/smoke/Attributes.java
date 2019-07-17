/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
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
        public ExampleStruct(final double value) {
            this.value = value;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
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
    @NonNull
    public native Attributes.ExampleStruct getStructAttribute();
    public native void setStructAttribute(@NonNull final Attributes.ExampleStruct value);
    @NonNull
    public native List<String> getArrayAttribute();
    public native void setArrayAttribute(@NonNull final List<String> value);
    @NonNull
    public native Attributes.InternalError getComplexTypeAttribute();
    public native void setComplexTypeAttribute(@NonNull final Attributes.InternalError value);
    @NonNull
    public native byte[] getByteBufferAttribute();
    public native void setByteBufferAttribute(@NonNull final byte[] value);
    @NonNull
    public native AttributesInterface getInstanceAttribute();
    public native void setInstanceAttribute(@NonNull final AttributesInterface value);
    public native boolean isBooleanAttribute();
    public native void setBooleanAttribute(final boolean value);
    @NonNull
    public static native String getStaticAttribute();
    public static native void setStaticAttribute(@NonNull final String value);
    @NonNull
    public static native Attributes.ExampleStruct getStaticReadonlyAttribute();
}