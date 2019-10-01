/*
 *

 */
package com.example.smoke;
class ChildInterfaceImpl extends ParentInterfaceImpl implements ChildInterface {
    protected ChildInterfaceImpl(final long nativeHandle) {
        super(nativeHandle);
    }
    public native void childMethod();
}
