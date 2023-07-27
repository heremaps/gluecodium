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
        public SomeStruct() {
            this.field = "";
        }
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
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
    /**
     *
     * @deprecated
     * @return
     */
    @Deprecated
    @OnPropertyInClass
    @NonNull
    public native String getProp();
    /**
     *
     * @deprecated
     * @param value
     */
    @Deprecated
    @OnPropertyInClass
    public native void setProp(@NonNull final String value);
}
