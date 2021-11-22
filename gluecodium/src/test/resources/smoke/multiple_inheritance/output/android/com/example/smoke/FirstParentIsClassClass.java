/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FirstParentIsClassClass extends ParentClass implements ParentNarrowOne {
    /**
     * For internal use only.
     * @hidden
     */
    protected FirstParentIsClassClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, dummy);
    }
    public native void childFunction();
    @NonNull
    public native String getChildProperty();
    public native void setChildProperty(@NonNull final String value);
    @Override
    public native void parentFunctionOne();
    @NonNull
    @Override
    public native String getParentPropertyOne();
    @Override
    public native void setParentPropertyOne(@NonNull final String value);
}
