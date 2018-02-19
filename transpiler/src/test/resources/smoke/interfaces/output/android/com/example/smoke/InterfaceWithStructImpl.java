/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

class InterfaceWithStructImpl extends NativeBase implements InterfaceWithStruct {
    protected InterfaceWithStructImpl(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native InterfaceWithStruct.InnerStruct innerStructMethod(final InterfaceWithStruct.InnerStruct inputStruct);
}
