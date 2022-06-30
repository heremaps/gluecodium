/*
 *
 */
package com.example.smoke;
public final class TypeCollection {
    public static final long INVALID_STORAGE_ID = 0L;
    public static final class Point {
        public double x;
        public double y;
        public Point(final double x, final double y) {
            this.x = x;
            this.y = y;
        }
    }
    public static final class StructHavingAliasFieldDefinedBelow {
        public long field;
        public StructHavingAliasFieldDefinedBelow(final long field) {
            this.field = field;
        }
    }
}
