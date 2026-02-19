/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.NativeBase;

class InternalInterfaceImpl extends NativeBase implements InternalInterface {
    protected InternalInterfaceImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);



    public native void fooBar();


    @NonNull
    public static native String getSomeInternalProperty();


    public static native void setSomeInternalProperty(@NonNull final String value);


}

