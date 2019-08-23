/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.package;
import android.support.annotation.NonNull;
import java.util.List;
public final class Class extends InterfaceImpl {
    public Class() {
        this(constructor());
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Class(final long nativeHandle) {
        super(nativeHandle);
    }
    private static native long constructor();
    @NonNull
    public native Struct fun(@NonNull final List<Struct> double) throws EnumException;
    @NonNull
    public native Enum getProperty();
    public native void setProperty(@NonNull final Enum value);
}
