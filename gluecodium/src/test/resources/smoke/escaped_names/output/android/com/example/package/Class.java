/*
 *
 */
package com.example.package;
import android.support.annotation.NonNull;
import java.util.List;
public final class Class extends InterfaceImpl {
    public Class() {
        this(constructor());
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Class(final long nativeHandle) {
        super(nativeHandle);
    }
    private native void cacheThisInstance();
    private static native long constructor();
    @NonNull
    public native Struct fun(@NonNull final List<Struct> double) throws ExceptionException;
    @NonNull
    public native Enum getProperty();
    public native void setProperty(@NonNull final Enum value);
}
