/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
class InternalClass extends NativeBase {
    static class InternalStruct {
        String stringField;
        InternalStruct(final String stringField) {
            this.stringField = stringField;
        }
    }
    protected InternalClass(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    native void internalMethod(@NonNull final InternalClass.InternalStruct input);
}