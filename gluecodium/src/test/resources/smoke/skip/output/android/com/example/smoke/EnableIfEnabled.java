/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
public final class EnableIfEnabled extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected EnableIfEnabled(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native void enableIfUnquoted();
    public static native void enableIfUnquotedList();
    public static native void enableIfQuoted();
    public static native void enableIfQuotedList();
    public static native void enableIfTagged();
    public static native void enableIfTaggedList();
    public static native void enableIfMixedList();
}
