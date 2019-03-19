/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class ProfileManagerFactory extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected ProfileManagerFactory(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native ProfileManager createProfileManager();
    @NonNull
    public static native ProfileManagerInterface createProfileManagerInterface();
}
