/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>Class comment
 */
@OnClass
public final class AttributesWithComments extends NativeBase {
    /**
     * <p>Const comment
     */
    @OnConstInClass
    public static final boolean PI = false;
    public static final class SomeStruct {
        /**
         * <p>Field comment
         */
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
    protected AttributesWithComments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>Function comment
     */
    @OnFunctionInClass
    public native void veryFun();
    /**
     * <p>Getter comment
     * @return <p>Property comment
     */
    @OnPropertyInClass
    @NonNull
    public native String getProp();
    /**
     * <p>Setter comment
     * @param value <p>Property comment
     */
    @OnPropertyInClass
    public native void setProp(@NonNull final String value);
}
