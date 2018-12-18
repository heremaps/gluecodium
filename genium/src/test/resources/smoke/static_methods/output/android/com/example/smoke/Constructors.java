/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
public class Constructors extends NativeBase {
    public Constructors() {
        this(create());
    }
    public Constructors(final Constructors other) {
        this(create(other));
    }
    public Constructors(final String foo, final long bar) {
        this(create(foo, bar));
    }
    /** For internal use only */
    protected Constructors(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private static native long create();
    private static native long create(final Constructors other);
    private static native long create(final String foo, final long bar);
}
