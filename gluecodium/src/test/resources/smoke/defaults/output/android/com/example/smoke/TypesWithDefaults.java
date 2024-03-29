/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class TypesWithDefaults {
    public static final class StructWithDefaults {
        public int intField;
        public long uintField;
        public float floatField;
        public double doubleField;
        public boolean boolField;
        @NonNull
        public String stringField;
        public StructWithDefaults() {
            this.intField = 42;
            this.uintField = 4294967295L;
            this.floatField = 3.14f;
            this.doubleField = -1.4142;
            this.boolField = true;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
        }
    }
    public static final class ImmutableStructWithDefaults {
        public final int intField;
        public final long uintField;
        public final float floatField;
        public final double doubleField;
        public final boolean boolField;
        @NonNull
        public final String stringField;
        public ImmutableStructWithDefaults(final long uintField, final boolean boolField) {
            this.intField = 42;
            this.uintField = uintField;
            this.floatField = 3.14f;
            this.doubleField = -1.4142;
            this.boolField = boolField;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
        }
        public ImmutableStructWithDefaults(final int intField, final long uintField, final float floatField, final double doubleField, final boolean boolField, @NonNull final String stringField) {
            this.intField = intField;
            this.uintField = uintField;
            this.floatField = floatField;
            this.doubleField = doubleField;
            this.boolField = boolField;
            this.stringField = stringField;
        }
    }
}
