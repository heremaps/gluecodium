/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * @deprecated
 */
@Deprecated
@OnClass
public final class AttributesWithDeprecated extends NativeBase {
    /**
     * @deprecated
     */
    @Deprecated
    @OnConstInClass
    public static final boolean PI = false;
    public static final class SomeStruct {
        /**
         * @deprecated
         */
        @Deprecated
        @OnField
        @NonNull
        public String field;
        public SomeStruct(@Deprecated @NonNull final String field) {
            this.field = field;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected AttributesWithDeprecated(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     *
     * @deprecated
     */
    @Deprecated
    @OnFunctionInClass
    public native void veryFun();
    @OnPropertyInClass
    @NonNull
    public native String getProp();
    @OnPropertyInClass
    public native void setProp(@NonNull final String value);
}
