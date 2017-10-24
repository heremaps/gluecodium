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

public interface MethodOverloads {
    public static class Point {
        public double x;
        public double y;
    }
    boolean isBoolean(final boolean input);
    boolean isBoolean(final byte input);
    boolean isBoolean(final String input);
    boolean isBoolean(final MethodOverloads.Point input);
    boolean isBoolean(final boolean input1, final byte input2, final String input3, final MethodOverloads.Point input4);
}
