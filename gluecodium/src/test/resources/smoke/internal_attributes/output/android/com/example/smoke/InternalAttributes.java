/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class InternalAttributes extends NativeBase {
    enum InternalEnum {
        FOO(0);
        public final int value;
        InternalEnum(final int value) {
            this.value = value;
        }
    }
    static final class InternalException extends Exception {
        public InternalException(final String error) {
            super(error.toString());
            this.error = error;
        }
        public final String error;
    }
    static final class InternalStruct {
        @NonNull
        public String stringField;
        public InternalStruct(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    static final class InternalClass extends NativeBase {
        /**
         * For internal use only.
         * @hidden
         */
        protected InternalClass(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
    }
    /**
     * @hidden
     */
    static class InternalInterfaceImpl extends NativeBase implements InternalInterface {
        protected InternalInterfaceImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
    }
    /**
     * @hidden
     */
    static class InternalLambdaImpl extends NativeBase implements InternalLambda {
        protected InternalLambdaImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        public native void apply();
    }
    interface InternalInterface {
    }
    @FunctionalInterface
    interface InternalLambda {
        void apply();
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected InternalAttributes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
