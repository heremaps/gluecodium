/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class Properties extends NativeBase {
    public enum InternalErrorCode {
        ERROR_NONE(0),
        ERROR_FATAL(999);
        public final int value;
        InternalErrorCode(final int value) {
            this.value = value;
        }
    }
    public final static class ExampleStruct {
        public double value;
        public ExampleStruct(final double value) {
            this.value = value;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Properties(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native long getBuiltInTypeProperty();
    public native void setBuiltInTypeProperty(final long value);
    public native float getReadonlyProperty();
    @NonNull
    public native Properties.ExampleStruct getStructProperty();
    public native void setStructProperty(@NonNull final Properties.ExampleStruct value);
    @NonNull
    public native List<String> getArrayProperty();
    public native void setArrayProperty(@NonNull final List<String> value);
    @NonNull
    public native Properties.InternalErrorCode getComplexTypeProperty();
    public native void setComplexTypeProperty(@NonNull final Properties.InternalErrorCode value);
    @NonNull
    public native byte[] getByteBufferProperty();
    public native void setByteBufferProperty(@NonNull final byte[] value);
    @NonNull
    public native PropertiesInterface getInstanceProperty();
    public native void setInstanceProperty(@NonNull final PropertiesInterface value);
    public native boolean isBooleanProperty();
    public native void setBooleanProperty(final boolean value);
    @NonNull
    public static native String getStaticProperty();
    public static native void setStaticProperty(@NonNull final String value);
    @NonNull
    public static native Properties.ExampleStruct getStaticReadonlyProperty();
}
