/*
 *
 */
package com.example.smoke;
final class InternalChild extends InternalParent {
    /**
     * For internal use only.
     * @hidden
     */
    protected InternalChild(final long nativeHandle, final Object dummy) {
        super(nativeHandle, dummy);
    }
}
