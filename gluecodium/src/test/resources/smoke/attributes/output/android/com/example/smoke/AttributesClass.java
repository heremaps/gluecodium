/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
@OnClass
public final class AttributesClass extends NativeBase {
    @OnConstInClass
    public static final boolean PI = false;
    /**
     * For internal use only.
     * @hidden
     */
    protected AttributesClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @OnFunctionInClass
    public native void veryFun(@OnParameterInClass @NonNull final String param);
    @OnPropertyInClass
    @NonNull
    public native String getProp();
    @OnPropertyInClass
    public native void setProp(@NonNull final String value);
}
