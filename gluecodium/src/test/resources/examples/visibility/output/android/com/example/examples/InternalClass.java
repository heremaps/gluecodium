/*
 *

 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
class InternalClass extends NativeBase {
    final static class InternalStruct {
        @NonNull
        String stringField;
        InternalStruct(@NonNull final String stringField) {
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