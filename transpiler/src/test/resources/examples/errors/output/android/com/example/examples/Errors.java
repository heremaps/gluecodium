/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;

import com.example.NativeBase;

public class Errors extends NativeBase {
    public enum InternalErrors {
        NONE(0),
        CRASHED(1),
        EXPLODED(2);

        public final int value;

        InternalErrors(final int value) {
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
    public static native void startSomethingOrFail() throws InternalErrorsException;
    public static native String getSomethingOrFail() throws InternalErrorsException;
}
