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
         * @param nativeHandle The SDK nativeHandle instance.
         * @param dummy The SDK dummy instance.
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

    /**
     * <p>This class has just one constructor with one argument {@link com.example.smoke.CtorLinks.SingleCtorWithOneArgument#SingleCtorWithOneArgument(int)}.
     */
    public static final class SingleCtorWithOneArgument extends NativeBase {
        public SingleCtorWithOneArgument(final int arg) {
            this(create(arg), (Object)null);
            cacheThisInstance();
        }

        /**
         * For internal use only.
         * @hidden
         * @param nativeHandle The SDK nativeHandle instance.
         * @param dummy The SDK dummy instance.
         */
        protected SingleCtorWithOneArgument(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }

        private static native void disposeNativeHandle(long nativeHandle);
        private native void cacheThisInstance();
        private static native long create(final int arg);
    }

    /**
     * <p>This class has just one constructor with two argument {@link com.example.smoke.CtorLinks.SingleCtorWithTwoArgument#SingleCtorWithTwoArgument(int, String)}.
     */
    public static final class SingleCtorWithTwoArgument extends NativeBase {
        public SingleCtorWithTwoArgument(final int arg, @NonNull final String arg2) {
            this(create(arg, arg2), (Object)null);
            cacheThisInstance();
        }

        /**
         * For internal use only.
         * @hidden
         * @param nativeHandle The SDK nativeHandle instance.
         * @param dummy The SDK dummy instance.
         */
        protected SingleCtorWithTwoArgument(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }

        private static native void disposeNativeHandle(long nativeHandle);
        private native void cacheThisInstance();
        private static native long create(final int arg, @NonNull final String arg2);
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
         * @param nativeHandle The SDK nativeHandle instance.
         * @param dummy The SDK dummy instance.
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
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
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
