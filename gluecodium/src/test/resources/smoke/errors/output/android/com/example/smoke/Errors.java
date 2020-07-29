/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class Errors extends NativeBase {
    public enum InternalErrorCode {
        ERROR_NONE(0),
        ERROR_FATAL(1);
        public final int value;
        InternalErrorCode(final int value) {
            this.value = value;
        }
    }
    public enum ExternalErrors {
        NONE(0),
        BOOM(1),
        BUST(2);
        public final int value;
        ExternalErrors(final int value) {
            this.value = value;
        }
    }
    public static final class InternalException extends Exception {
        public InternalException(final Errors.InternalErrorCode error) {
            super(error.toString());
            this.error = error;
        }
        public final Errors.InternalErrorCode error;
    }
    public static final class ExternalException extends Exception {
        public ExternalException(final Errors.ExternalErrors error) {
            super(error.toString());
            this.error = error;
        }
        public final Errors.ExternalErrors error;
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Errors(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native void methodWithErrors() throws Errors.InternalException;
    public static native void methodWithExternalErrors() throws Errors.ExternalException;
    @NonNull
    public static native String methodWithErrorsAndReturnValue() throws Errors.InternalException;
    public static native void methodWithPayloadError() throws WithPayloadException;
    @NonNull
    public static native String methodWithPayloadErrorAndReturnValue() throws WithPayloadException;
}
