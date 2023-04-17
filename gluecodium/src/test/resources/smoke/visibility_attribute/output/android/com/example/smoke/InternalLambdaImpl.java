/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
class InternalLambdaImpl extends NativeBase implements InternalLambda {
    protected InternalLambdaImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void apply();
}
