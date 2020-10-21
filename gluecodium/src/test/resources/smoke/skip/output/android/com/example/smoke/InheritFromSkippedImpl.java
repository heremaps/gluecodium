/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
class InheritFromSkippedImpl extends NativeBase implements InheritFromSkipped {
    protected InheritFromSkippedImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Override
    public native boolean notInSwift(final boolean input);
    @Override
    public native float notInDart(final float input);
    @Override
    public native boolean isSkippedInSwift();
    @Override
    public native void setSkippedInSwift(final boolean value);
    @Override
    public native float getSkippedInDart();
    @Override
    public native void setSkippedInDart(final float value);
}
