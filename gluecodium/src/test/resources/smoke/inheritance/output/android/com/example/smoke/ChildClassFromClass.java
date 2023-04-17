/*
 *

 */
package com.example.smoke;
public final class ChildClassFromClass extends ParentClass {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected ChildClassFromClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, dummy);
    }
    public native void childClassMethod();
}
