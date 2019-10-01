/*
 *

 */
package com.example.smoke;
public final class ChildClassFromClass extends ParentClass {
    /**
     * For internal use only.
     * @exclude
     */
    protected ChildClassFromClass(final long nativeHandle) {
        super(nativeHandle);
    }
    public native void childClassMethod();
}
