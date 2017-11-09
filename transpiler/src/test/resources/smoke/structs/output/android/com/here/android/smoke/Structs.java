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

public class Structs {
    public static class Point {
        public double x;
        public double y;
    }
    public static class Color {
        public long red;
        public long green;
        public long blue;
    }
    public static class Line {
        public Structs.Point a = new Structs.Point();
        public Structs.Point b = new Structs.Point();
    }
    public static class ColoredLine {
        public Structs.Line line = new Structs.Line();
        public Structs.Color color = new Structs.Color();
    }
    public static class AllTypesStruct {
        public byte int8Field;
        public long uint8Field;
        public short int16Field;
        public long uint16Field;
        public int int32Field;
        public long uint32Field;
        public long int64Field;
        public long uint64Field;
        public float floatField;
        public double doubleField;
        public String stringField;
        public boolean booleanField;
        public byte[] bytesField;
        public Structs.Point pointField = new Structs.Point();
    }
    public static class ColoredLineInherited extends Structs.Line {
        public Structs.Color color = new Structs.Color();
    }
    public static native Structs.Point createPoint(final double x, final double y);
    public static native Structs.Point swapPointCoordinates(final Structs.Point input);
    public static native Structs.Line createLine(final Structs.Point pointA, final Structs.Point pointB);
    public static native Structs.ColoredLine createColoredLine(final Structs.Line line, final Structs.Color color);
    public static native Structs.ColoredLine returnColoredLine(final Structs.ColoredLine input);
    public static native Structs.AllTypesStruct returnAllTypesStruct(final Structs.AllTypesStruct input);
    public static native Structs.AllTypesStruct modifyAllTypesStruct(final Structs.AllTypesStruct input);
    public static native Structs.ColoredLineInherited methodWithInheritedType(final Structs.ColoredLineInherited input);
}