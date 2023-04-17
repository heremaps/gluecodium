/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class ChildConstructors extends Constructors {
    public ChildConstructors() {
        this(createNoArgsChild(), (Object)null);
        cacheThisInstance();
    }
    public ChildConstructors(@NonNull final Constructors other) {
        this(createCopyFromParent(other), (Object)null);
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected ChildConstructors(final long nativeHandle, final Object dummy) {
        super(nativeHandle, dummy);
    }
    private native void cacheThisInstance();
    private static native long createNoArgsChild();
    private static native long createCopyFromParent(@NonNull final Constructors other);
}
