/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
public class CommentsInstantiable extends NativeBase {
    /**
     * This is some very useful constructor.
     * @param input Very useful input parameter
     */
    public CommentsInstantiable(final String input) {
        this(create(input));
    }
    /** For internal use only */
    protected CommentsInstantiable(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private static native long create(final String input);
}
