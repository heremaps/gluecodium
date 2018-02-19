/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

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
    /** For internal use only */
    protected Errors(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public static native void methodWithErrors() throws InternalErrorException;
}
