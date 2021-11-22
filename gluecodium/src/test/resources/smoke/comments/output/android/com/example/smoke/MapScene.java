/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
/**
 * <p>Referencing some type {@link com.example.smoke.MapScene#loadScene(int, MapScene.LoadSceneCallback)}.</p>
 */
public final class MapScene extends NativeBase {
    /**
     * @hidden
     */
    static class LoadSceneCallbackImpl extends NativeBase implements LoadSceneCallback {
        protected LoadSceneCallbackImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        public native void apply(@Nullable final String p0);
    }
    @FunctionalInterface
    public interface LoadSceneCallback {
        void apply(@Nullable final String p0);
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected MapScene(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void loadScene(final int mapScheme, @Nullable final MapScene.LoadSceneCallback callback);
    public native void loadScene(@NonNull final String configurationFile, @Nullable final MapScene.LoadSceneCallback callback);
}
