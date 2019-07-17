/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class Errors extends NativeBase {
    public enum InternalError {
        ERROR_NONE(0),
        ERROR_FATAL(1);
        public final int value;
        InternalError(final int value) {
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
    public static class InternalErrorException extends Exception {
        public InternalErrorException(final Errors.InternalError error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final Errors.InternalError error;
    }
    public static class ExternalErrorsException extends Exception {
        public ExternalErrorsException(final Errors.ExternalErrors error) {
            super(Integer.toString(error.value));
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
    public static native void methodWithErrors() throws Errors.InternalErrorException;
    public static native void methodWithExternalErrors() throws Errors.ExternalErrorsException;
    @NonNull
    public static native String methodWithErrorsAndReturnValue() throws Errors.InternalErrorException;
}