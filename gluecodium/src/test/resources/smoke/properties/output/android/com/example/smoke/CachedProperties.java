/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class CachedProperties extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected CachedProperties(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private List<String> cache_getCachedProperty;
    private boolean is_cached_getCachedProperty = false;
    @NonNull
    public List<String> getCachedProperty() {
        if (!is_cached_getCachedProperty) {
            cache_getCachedProperty = getCachedProperty_private();
            is_cached_getCachedProperty = true;
        }
        return cache_getCachedProperty;
    }
    private native List<String> getCachedProperty_private();
    private static byte[] cache_getStaticCachedProperty;
    private static boolean is_cached_getStaticCachedProperty = false;
    @NonNull
    public static byte[] getStaticCachedProperty() {
        if (!is_cached_getStaticCachedProperty) {
            cache_getStaticCachedProperty = getStaticCachedProperty_private();
            is_cached_getStaticCachedProperty = true;
        }
        return cache_getStaticCachedProperty;
    }
    private static native byte[] getStaticCachedProperty_private();
}
