/*
 *
 */
package com.example.smoke;
final class InternalChild extends InternalParent {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected InternalChild(final long nativeHandle, final Object dummy) {
        super(nativeHandle, dummy);
    }
}
