/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;
import java.util.ArrayList;
import java.util.List;

public class Structs extends NativeBase {
    public enum FooBar {
        FOO(0),
        BAR(1);
        public final int value;
        FooBar(final int value) {
            this.value = value;
        }
    }
    public static class Point {
        public double x;
        public double y;
        public Point() {}
        public Point(double x, double y) {
            this.x = x;
            this.y = y;
        }
    }
    public static class Color {
        public long red;
        public long green;
        public long blue;

        public Color() {}

        public Color(long red, long green, long blue) {
            this.red = red;
            this.green = green;
            this.blue = blue;
        }

        public static class Builder {
            private long red;
            private long green;
            private long blue;

            public Builder() {
            }

            public Builder setRed(long red) {
                this.red = red;
                return this;
            }

            public Builder setGreen(long green) {
                this.green = green;
                return this;
            }

            public Builder setBlue(long blue) {
                this.blue = blue;
                return this;
            }

            public Color build() {
                return new Color(red, green, blue);
            }
        }
    }
    public static class Line {
        public Structs.Point a = new Structs.Point();
        public Structs.Point b = new Structs.Point();
        public Line() {}
        public Line(Structs.Point a, Structs.Point b) {
            this.a = a;
            this.b = b;
        }
    }
    public static class ColoredLine {
        public Structs.Line line = new Structs.Line();
        public Structs.Color color = new Structs.Color();
        public ColoredLine() {}
        public ColoredLine(Structs.Line line, Structs.Color color) {
            this.line = line;
            this.color = color;
        }
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
        public AllTypesStruct() {}
        public AllTypesStruct(byte int8Field, long uint8Field, short int16Field, long uint16Field, int int32Field, long uint32Field, long int64Field, long uint64Field, float floatField, double doubleField, String stringField, boolean booleanField, byte[] bytesField, Structs.Point pointField) {
            this.int8Field = int8Field;
            this.uint8Field = uint8Field;
            this.int16Field = int16Field;
            this.uint16Field = uint16Field;
            this.int32Field = int32Field;
            this.uint32Field = uint32Field;
            this.int64Field = int64Field;
            this.uint64Field = uint64Field;
            this.floatField = floatField;
            this.doubleField = doubleField;
            this.stringField = stringField;
            this.booleanField = booleanField;
            this.bytesField = bytesField;
            this.pointField = pointField;
        }
        public static class Builder {
            private byte int8Field;
            private long uint8Field;
            private short int16Field;
            private long uint16Field;
            private int int32Field;
            private long uint32Field;
            private long int64Field;
            private long uint64Field;
            private float floatField;
            private double doubleField;
            private String stringField;
            private boolean booleanField;
            private byte[] bytesField;
            private Structs.Point pointField = new Structs.Point();
            public Builder() {
            }
            public Builder setInt8Field(byte int8Field) {
                this.int8Field = int8Field;
                return this;
            }
            public Builder setUint8Field(long uint8Field) {
                this.uint8Field = uint8Field;
                return this;
            }
            public Builder setInt16Field(short int16Field) {
                this.int16Field = int16Field;
                return this;
            }
            public Builder setUint16Field(long uint16Field) {
                this.uint16Field = uint16Field;
                return this;
            }
            public Builder setInt32Field(int int32Field) {
                this.int32Field = int32Field;
                return this;
            }
            public Builder setUint32Field(long uint32Field) {
                this.uint32Field = uint32Field;
                return this;
            }
            public Builder setInt64Field(long int64Field) {
                this.int64Field = int64Field;
                return this;
            }
            public Builder setUint64Field(long uint64Field) {
                this.uint64Field = uint64Field;
                return this;
            }
            public Builder setFloatField(float floatField) {
                this.floatField = floatField;
                return this;
            }
            public Builder setDoubleField(double doubleField) {
                this.doubleField = doubleField;
                return this;
            }
            public Builder setStringField(String stringField) {
                this.stringField = stringField;
                return this;
            }
            public Builder setBooleanField(boolean booleanField) {
                this.booleanField = booleanField;
                return this;
            }
            public Builder setBytesField(byte[] bytesField) {
                this.bytesField = bytesField;
                return this;
            }
            public Builder setPointField(Structs.Point pointField) {
                this.pointField = pointField;
                return this;
            }
            public AllTypesStruct build() {
                return new AllTypesStruct(int8Field, uint8Field, int16Field, uint16Field, int32Field, uint32Field, int64Field, uint64Field, floatField, doubleField, stringField, booleanField, bytesField, pointField);
            }
        }
    }

    public static class ExternalStruct {
        public String stringField;
        public String externalStringField;
        public List<Byte> externalArrayField = new ArrayList<>();
        public Structs.AnotherExternalStruct externalStructField = new Structs.AnotherExternalStruct();
        public ExternalStruct() {}
        public ExternalStruct(String stringField, String externalStringField, List<Byte> externalArrayField, Structs.AnotherExternalStruct externalStructField) {
            this.stringField = stringField;
            this.externalStringField = externalStringField;
            this.externalArrayField = externalArrayField;
            this.externalStructField = externalStructField;
        }
        public static class Builder {
            private String stringField;
            private String externalStringField;
            private List<Byte> externalArrayField = new ArrayList<>();
            private Structs.AnotherExternalStruct externalStructField = new Structs.AnotherExternalStruct();
            public Builder() {
            }
            public Builder setStringField(String stringField) {
                this.stringField = stringField;
                return this;
            }
            public Builder setExternalStringField(String externalStringField) {
                this.externalStringField = externalStringField;
                return this;
            }
            public Builder setExternalArrayField(List<Byte> externalArrayField) {
                this.externalArrayField = externalArrayField;
                return this;
            }
            public Builder setExternalStructField(Structs.AnotherExternalStruct externalStructField) {
                this.externalStructField = externalStructField;
                return this;
            }
            public ExternalStruct build() {
                return new ExternalStruct(stringField, externalStringField, externalArrayField, externalStructField);
            }
        }
    }
    public static class AnotherExternalStruct {
        public byte intField;
        public AnotherExternalStruct() {}
        public AnotherExternalStruct(byte intField) {
            this.intField = intField;
        }
    }


    /** For internal use only */
    protected Structs(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native Structs.Point createPoint(final double x, final double y);
    public static native Structs.Point swapPointCoordinates(final Structs.Point input);
    public static native Structs.Line createLine(final Structs.Point pointA, final Structs.Point pointB);
    public static native Structs.ColoredLine createColoredLine(final Structs.Line line, final Structs.Color color);
    public static native Structs.ColoredLine returnColoredLine(final Structs.ColoredLine input);
    public static native Structs.AllTypesStruct returnAllTypesStruct(final Structs.AllTypesStruct input);
    public static native Structs.AllTypesStruct modifyAllTypesStruct(final Structs.AllTypesStruct input);
    public static native Structs.ExternalStruct getExternalStruct();
}
