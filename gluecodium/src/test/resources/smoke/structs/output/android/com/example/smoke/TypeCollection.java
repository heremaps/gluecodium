/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class TypeCollection {
    public static final class Point {
        public double x;
        public double y;
        public Point(final double x, final double y) {
            this.x = x;
            this.y = y;
        }
    }
    public static final class Line {
        @NonNull
        public TypeCollection.Point a;
        @NonNull
        public TypeCollection.Point b;
        public Line(@NonNull final TypeCollection.Point a, @NonNull final TypeCollection.Point b) {
            this.a = a;
            this.b = b;
        }
    }
    public static final class AllTypesStruct {
        public byte int8Field;
        public short uint8Field;
        public short int16Field;
        public int uint16Field;
        public int int32Field;
        public long uint32Field;
        public long int64Field;
        public long uint64Field;
        public float floatField;
        public double doubleField;
        @NonNull
        public String stringField;
        public boolean booleanField;
        @NonNull
        public byte[] bytesField;
        @NonNull
        public TypeCollection.Point pointField;
        public AllTypesStruct(final byte int8Field, final short uint8Field, final short int16Field, final int uint16Field, final int int32Field, final long uint32Field, final long int64Field, final long uint64Field, final float floatField, final double doubleField, @NonNull final String stringField, final boolean booleanField, @NonNull final byte[] bytesField, @NonNull final TypeCollection.Point pointField) {
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
    }
}
