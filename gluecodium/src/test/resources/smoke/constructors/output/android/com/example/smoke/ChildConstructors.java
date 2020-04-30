/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class ChildConstructors extends Constructors {
    public ChildConstructors() {
        this(createNoArgsChild());
        cacheThisInstance();
    }
    public ChildConstructors(@NonNull final Constructors other) {
        this(createCopyFromParent(other));
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected ChildConstructors(final long nativeHandle) {
        super(nativeHandle);
    }
    private native void cacheThisInstance();
    private static native long createNoArgsChild();
    private static native long createCopyFromParent(@NonNull final Constructors other);
}
