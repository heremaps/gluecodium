/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
public final class SpecialAttributes extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected SpecialAttributes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Deprecated("foo\nbar")
    public native void withEscaping();
    @HackMerm -rf *
    public native void withLineBreak();
}
