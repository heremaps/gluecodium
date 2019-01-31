/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
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
    public native void setSameTypeInstances(@NonNull final SimpleInterface interfaceOne, @NonNull final SimpleInterface interfaceTwo);
    @NonNull
    public native SimpleInterface getInstanceOne();
    @NonNull
    public native SimpleInterface getInstanceTwo();
    @NonNull
    public native VeryExternalInterface makeMoreExternal(@NonNull final ExternalInterface input);
    @NonNull
    public native VeryExternalInterface.SomeStruct makeMoreExternal(@NonNull final ExternalInterface.SomeStruct input);
    @NonNull
    public native VeryExternalInterface.SomeEnum makeMoreExternal(@NonNull final ExternalInterface.SomeEnum input);
}
