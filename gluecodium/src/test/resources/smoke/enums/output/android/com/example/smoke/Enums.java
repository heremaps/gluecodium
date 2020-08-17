/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class Enums extends NativeBase {
    public enum SimpleEnum {
        FIRST(0),
        SECOND(1);
        public final int value;
        SimpleEnum(final int value) {
            this.value = value;
        }
    }
    public enum InternalErrorCode {
        ERROR_NONE(0),
        ERROR_FATAL(999);
        public final int value;
        InternalErrorCode(final int value) {
            this.value = value;
        }
    }
    public static final class ErrorStruct {
        @NonNull
        public Enums.InternalErrorCode type;
        @NonNull
        public String message;
        public ErrorStruct(@NonNull final Enums.InternalErrorCode type, @NonNull final String message) {
            this.type = type;
            this.message = message;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Enums(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native Enums.SimpleEnum methodWithEnumeration(@NonNull final Enums.SimpleEnum input);
    @NonNull
    public static native Enums.InternalErrorCode flipEnumValue(@NonNull final Enums.InternalErrorCode input);
    @NonNull
    public static native Enums.InternalErrorCode extractEnumFromStruct(@NonNull final Enums.ErrorStruct input);
    @NonNull
    public static native Enums.ErrorStruct createStructWithEnumInside(@NonNull final Enums.InternalErrorCode type, @NonNull final String message);
}
