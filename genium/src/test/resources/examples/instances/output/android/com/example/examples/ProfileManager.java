/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class ProfileManager extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected ProfileManager(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void createProfile(@NonNull final String username);
    @NonNull
    public native String changeProfile(@NonNull final String username);
    public native void deleteProfile(@NonNull final String username);
}