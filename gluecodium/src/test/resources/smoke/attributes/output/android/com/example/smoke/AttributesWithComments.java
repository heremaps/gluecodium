/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>Class comment</p>
 */
@OnClass
public final class AttributesWithComments extends NativeBase {
    /**
     * <p>Const comment</p>
     */
    @OnConstInClass
    public static final boolean PI = false;
    public static final class SomeStruct {
        /**
         * <p>Field comment</p>
         */
        @OnField
        @NonNull
        public String field;
        public SomeStruct(@NonNull final String field) {
            this.field = field;
        }
    }
    /**
     * For internal use only.
     * @exclude
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
     * <p>Function comment</p>
     */
    @OnFunctionInClass
    public native void veryFun();
    /**
     * <p>Getter comment</p>
     */
    @OnPropertyInClass
    @NonNull
    public native String getProp();
    /**
     * <p>Setter comment</p>
     * @param value <p>Property comment</p>
     */
    @OnPropertyInClass
    public native void setProp(@NonNull final String value);
}
