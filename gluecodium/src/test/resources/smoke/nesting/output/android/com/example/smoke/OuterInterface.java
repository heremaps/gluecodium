/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public interface OuterInterface {
    public static final class InnerClass extends NativeBase {
        /**
         * For internal use only.
         * @exclude
         */
        protected InnerClass(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @NonNull
        public native String foo(@NonNull final String input);
    }
    static class InnerInterfaceImpl extends NativeBase implements InnerInterface {
        protected InnerInterfaceImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @NonNull
        public native String foo(@NonNull final String input);
    }
    public interface InnerInterface {
        @NonNull
        String foo(@NonNull final String input);
    }
    @NonNull
    String foo(@NonNull final String input);
}
