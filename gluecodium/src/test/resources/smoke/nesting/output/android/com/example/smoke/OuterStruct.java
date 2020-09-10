/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class OuterStruct {
    @NonNull
    public String field;
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
        public native void fooBar();
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
        public native void barBaz();
    }
    public static final class InnerStruct {
        @NonNull
        public String otherField;
        public InnerStruct(@NonNull final String otherField) {
            this.otherField = otherField;
        }
        public native void doSomething();
    }
    public interface InnerInterface {
        void barBaz();
    }
    public OuterStruct(@NonNull final String field) {
        this.field = field;
    }
    public native void doNothing();
}
