/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
public final class OuterStruct {
    @NonNull
    public String field;
    public static final class InnerStruct {
        @NonNull
        public List<Date> otherField;
        public InnerStruct(@NonNull final List<Date> otherField) {
            this.otherField = otherField;
        }
        public native void doSomething();
    }
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
        public native Set<Locale> fooBar();
    }
    public static final class Builder extends NativeBase {
        public Builder() {
            this(create(), (Object)null);
            cacheThisInstance();
        }
        /**
         * For internal use only.
         * @exclude
         */
        protected Builder(final long nativeHandle, final Object dummy) {
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
        @NonNull
        public native OuterStruct.Builder field(@NonNull final String value);
        @NonNull
        public native OuterStruct build();
    }
    /**
     * @exclude
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
        public native Map<String, byte[]> barBaz();
    }
    public interface InnerInterface {
        @NonNull
        Map<String, byte[]> barBaz();
    }
    public OuterStruct(@NonNull final String field) {
        this.field = field;
    }
    public native void doNothing();
}
