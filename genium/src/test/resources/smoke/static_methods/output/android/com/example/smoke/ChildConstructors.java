/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.Nullable;
public class ChildConstructors extends Constructors {
    public ChildConstructors() {
        this(createNoArgsChild());
    }
    public ChildConstructors(@Nullable final Constructors other) {
        this(createCopyFromParent(other));
    }
    /** For internal use only */
    protected ChildConstructors(final long nativeHandle) {
        super(nativeHandle);
    }
    private static native long createNoArgsChild();
    private static native long createCopyFromParent(@Nullable final Constructors other);
}
