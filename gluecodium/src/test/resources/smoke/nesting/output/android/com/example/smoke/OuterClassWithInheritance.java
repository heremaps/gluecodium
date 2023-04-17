/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class OuterClassWithInheritance extends ParentClass {
    public static final class InnerClass extends NativeBase {
        /**
         * For internal use only.
         * @hidden
         * @param nativeHandle The SDK nativeHandle instance.
         * @param dummy The SDK dummy instance.
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
        public native String bar(@NonNull final String input);
    }
    /**
     * @hidden
     */
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
        public native String baz(@NonNull final String input);
    }
    public interface InnerInterface {
        @NonNull
        String baz(@NonNull final String input);
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected OuterClassWithInheritance(final long nativeHandle, final Object dummy) {
        super(nativeHandle, dummy);
    }
    @NonNull
    public native String foo(@NonNull final String input);
}
