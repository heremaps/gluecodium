/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;

import com.example.NativeBase;

public class ProfileManager extends NativeBase {
    /** For internal use only */
    protected ProfileManager(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native void createProfile(final String username);
    public native String changeProfile(final String username);
    public native void deleteProfile(final String username);
}