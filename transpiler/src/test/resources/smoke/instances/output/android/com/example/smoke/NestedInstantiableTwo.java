/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

public class NestedInstantiableTwo extends NativeBase {
    /** For internal use only */
    protected NestedInstantiableTwo(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native void setMultipleTypeInstances(final SimpleInstantiableOne instanceOne, final SimpleInstantiableTwo instanceTwo, final NestedInstantiableOne nestedInstantiable);
    public native SimpleInstantiableOne getInstantiableOne();
    public native SimpleInstantiableTwo getInstantiableTwo();
    public native NestedInstantiableOne getNestedInstantiable();
    public native void setSelfInstantiable(final NestedInstantiableTwo selfInstance);
    public native NestedInstantiableTwo getSelfInstantiable();
}
