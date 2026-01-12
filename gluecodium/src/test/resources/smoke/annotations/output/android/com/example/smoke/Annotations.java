/*

 *
 */

package com.example.smoke;

import com.example.NativeBase;
import my.custom.annotations.NeverBeNull;
import my.other.annotations.Optional;

final class Annotations extends NativeBase {

    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected Annotations(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);



    @Optional
    public native Boolean testOptional(@NeverBeNull final Annotations self);



}

