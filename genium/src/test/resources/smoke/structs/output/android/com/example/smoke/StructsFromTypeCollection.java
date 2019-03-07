/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import android.support.annotation.NonNull;
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
    @NonNull
    public static native Point createPoint(final double x, final double y);
    @NonNull
    public static native Point swapPointCoordinates(@NonNull final Point input);
    @NonNull
    public static native Line createLine(@NonNull final Point pointA, @NonNull final Point pointB);
    @NonNull
    public static native ColoredLine createColoredLine(@NonNull final Line line, @NonNull final Color color);
    @NonNull
    public static native AllTypesStruct modifyAllTypesStruct(@NonNull final AllTypesStruct input);
}