/*
 *
 */
package com.example.smoke;
class ChildInterfaceImpl extends ParentInterfaceImpl implements ChildInterface {
    protected ChildInterfaceImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, dummy);
    }
    public native void childMethod();
}
