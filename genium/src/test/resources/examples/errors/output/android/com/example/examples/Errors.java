/*
 *

 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class Errors extends NativeBase {
    public enum InternalErrors {
        NONE(0),
        CRASHED(1),
        EXPLODED(2);
        public final int value;
        InternalErrors(final int value) {
            this.value = value;
        }
    }
    public final static class InternalErrorsException extends Exception {
        public InternalErrorsException(final Errors.InternalErrors error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final Errors.InternalErrors error;
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
    public static native void startSomethingOrFail() throws Errors.InternalErrorsException;
    @NonNull
    public static native String getSomethingOrFail() throws Errors.InternalErrorsException;
}