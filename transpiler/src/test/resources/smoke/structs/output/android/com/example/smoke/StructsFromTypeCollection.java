/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

public class StructsFromTypeCollection extends NativeBase {
    /** For internal use only */
    protected StructsFromTypeCollection(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native Point createPoint(final double x, final double y);
    public static native Point swapPointCoordinates(final Point input);
    public static native Line createLine(final Point pointA, final Point pointB);
    public static native ColoredLine createColoredLine(final Line line, final Color color);
    public static native AllTypesStruct modifyAllTypesStruct(final AllTypesStruct input);
}