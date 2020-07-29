/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class ExternalClass extends NativeBase {
    public enum SomeEnum {
        SOME_VALUE(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static final class SomeStruct {
        @NonNull
        public String someField;
        public SomeStruct(@NonNull final String someField) {
            this.someField = someField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected ExternalClass(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void someMethod(final byte someParameter);
    @NonNull
    public native String getSomeProperty();
}
