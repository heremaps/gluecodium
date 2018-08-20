/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

class NestedInterfaceImpl extends NativeBase implements NestedInterface {
    protected NestedInterfaceImpl(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native void setSameTypeInstances(final SimpleInterface interfaceOne, final SimpleInterface interfaceTwo);
    public native SimpleInterface getInstanceOne();
    public native SimpleInterface getInstanceTwo();
    public native VeryExternalInterface makeMoreExternal(final ExternalInterface input);
    public native VeryExternalInterface.SomeStruct makeMoreExternal(final ExternalInterface.SomeStruct input);
    public native VeryExternalInterface.SomeEnum makeMoreExternal(final ExternalInterface.SomeEnum input);
}
