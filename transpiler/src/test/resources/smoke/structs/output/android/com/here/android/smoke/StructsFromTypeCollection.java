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

public class StructsFromTypeCollection {
    public static native com.here.android.smoke.Point createPoint(final double x, final double y);
    public static native com.here.android.smoke.Point swapPointCoordinates(final com.here.android.smoke.Point input);
    public static native com.here.android.smoke.Line createLine(final com.here.android.smoke.Point pointA, final com.here.android.smoke.Point pointB);
    public static native com.here.android.smoke.ColoredLine createColoredLine(final com.here.android.smoke.Line line, final com.here.android.smoke.Color color);
    public static native com.here.android.smoke.AllTypesStruct modifyAllTypesStruct(final com.here.android.smoke.AllTypesStruct input);
}