/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class CtorLinks extends NativeBase {
    /**
     * <p>This class has just one constructor {@link com.example.smoke.CtorLinks.SingleCtor#SingleCtor()}.
     */
    public static final class SingleCtor extends NativeBase {
        public SingleCtor() {
            this(create(), (Object)null);
            cacheThisInstance();
        }
        /**
         * For internal use only.
         * @hidden
         */
        protected SingleCtor(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        private native void cacheThisInstance();
        private static native long create();
    }
    public static final class OverloadedCtors extends NativeBase {
        public OverloadedCtors(@NonNull final String input) {
            this(create(input), (Object)null);
            cacheThisInstance();
        }
        /**
         *
         * @deprecated <p>Use {@link com.example.smoke.CtorLinks.OverloadedCtors#OverloadedCtors(String)} instead.
         * @param input
         * @param flag
         */
        @Deprecated
        public OverloadedCtors(@NonNull final String input, final boolean flag) {
            this(create(input, flag), (Object)null);
            cacheThisInstance();
        }
        /**
         * For internal use only.
         * @hidden
         */
        protected OverloadedCtors(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        private native void cacheThisInstance();
        private static native long create(@NonNull final String input);
        private static native long create(@NonNull final String input, final boolean flag);
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected CtorLinks(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
