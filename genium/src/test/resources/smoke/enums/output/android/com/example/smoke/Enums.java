/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class Enums extends NativeBase {
    public enum SimpleEnum {
        FIRST(0),
        SECOND(1);
        public final int value;
        SimpleEnum(final int value) {
            this.value = value;
        }
    }
    public enum InternalError {
        ERROR_NONE(0),
        ERROR_FATAL(999);
        public final int value;
        InternalError(final int value) {
            this.value = value;
        }
    }
    public enum ExternalEnum {
        FOO_VALUE(0),
        BAR_VALUE(1);
        public final int value;
        ExternalEnum(final int value) {
            this.value = value;
        }
    }
    public enum VeryExternalEnum {
        FOO(0),
        BAR(1);
        public final int value;
        VeryExternalEnum(final int value) {
            this.value = value;
        }
    }
    public static class ErrorStruct {
        @NonNull
        public Enums.InternalError type;
        public String message;
        public ErrorStruct(Enums.InternalError type, String message) {
            this.type = type;
            this.message = message;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Enums(final long nativeHandle) {
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
    public static native Enums.InternalError flipEnumValue(@NonNull final Enums.InternalError input);
    @NonNull
    public static native Enums.InternalError extractEnumFromStruct(@NonNull final Enums.ErrorStruct input);
    @NonNull
    public static native Enums.ErrorStruct createStructWithEnumInside(@NonNull final Enums.InternalError type, final String message);
    public static native void methodWithExternalEnum(@NonNull final Enums.ExternalEnum input);
}
