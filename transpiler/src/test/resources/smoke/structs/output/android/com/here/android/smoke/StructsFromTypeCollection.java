/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.here.android.smoke;

import com.here.android.NativeBase;

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