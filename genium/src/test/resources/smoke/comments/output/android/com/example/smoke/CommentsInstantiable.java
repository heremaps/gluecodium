/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class CommentsInstantiable extends NativeBase {
    /**
     * <p>This is some very useful constructor.</p>
     * @param input Very useful input parameter
     */
    public CommentsInstantiable(@NonNull final String input) {
        this(create(input));
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected CommentsInstantiable(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private static native long create(@NonNull final String input);
}