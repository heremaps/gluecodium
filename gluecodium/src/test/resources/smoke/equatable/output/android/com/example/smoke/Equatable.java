/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.List;
import java.util.Map;
public final class Equatable {
    public enum SomeEnum {
        FOO(0),
        BAR(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static final class EquatableStruct {
        public boolean boolField;
        public int intField;
        public long longField;
        public float floatField;
        public double doubleField;
        @NonNull
        public String stringField;
        @NonNull
        public Equatable.NestedEquatableStruct structField;
        @NonNull
        public Equatable.SomeEnum enumField;
        @NonNull
        public List<String> arrayField;
        @NonNull
        public Map<Integer, String> mapField;
        public EquatableStruct(final boolean boolField, final int intField, final long longField, final float floatField, final double doubleField, @NonNull final String stringField, @NonNull final Equatable.NestedEquatableStruct structField, @NonNull final Equatable.SomeEnum enumField, @NonNull final List<String> arrayField, @NonNull final Map<Integer, String> mapField) {
            this.boolField = boolField;
            this.intField = intField;
            this.longField = longField;
            this.floatField = floatField;
            this.doubleField = doubleField;
            this.stringField = stringField;
            this.structField = structField;
            this.enumField = enumField;
            this.arrayField = arrayField;
            this.mapField = mapField;
        }
        @Override
        public boolean equals(Object obj) {
            if (obj == this) return true;
            if (!(obj instanceof EquatableStruct)) return false;
            final EquatableStruct other = (EquatableStruct) obj;
            return this.boolField == other.boolField &&
                    this.intField == other.intField &&
                    this.longField == other.longField &&
                    Float.compare(this.floatField, other.floatField) == 0 &&
                    Double.compare(this.doubleField, other.doubleField) == 0 &&
                    java.util.Objects.equals(this.stringField, other.stringField) &&
                    java.util.Objects.equals(this.structField, other.structField) &&
                    java.util.Objects.equals(this.enumField, other.enumField) &&
                    java.util.Objects.equals(this.arrayField, other.arrayField) &&
                    java.util.Objects.equals(this.mapField, other.mapField);
        }
        @Override
        public int hashCode() {
            int hash = 7;
            hash = 31 * hash + (this.boolField ? 79 : 97);
            hash = 31 * hash + this.intField;
            hash = 31 * hash + (int) (this.longField ^ (this.longField >>> 32));
            hash = 31 * hash + Float.floatToIntBits(this.floatField);
            hash = 31 * hash + (int) (Double.doubleToLongBits(this.doubleField) ^ (Double.doubleToLongBits(this.doubleField) >>> 32));
            hash = 31 * hash + (this.stringField != null ? this.stringField.hashCode() : 0);
            hash = 31 * hash + (this.structField != null ? this.structField.hashCode() : 0);
            hash = 31 * hash + (this.enumField != null ? this.enumField.hashCode() : 0);
            hash = 31 * hash + (this.arrayField != null ? this.arrayField.hashCode() : 0);
            hash = 31 * hash + (this.mapField != null ? this.mapField.hashCode() : 0);
            return hash;
        }
    }
    public static final class EquatableNullableStruct {
        @Nullable
        public Boolean boolField;
        @Nullable
        public Integer intField;
        @Nullable
        public Integer uintField;
        @Nullable
        public Float floatField;
        @Nullable
        public String stringField;
        @Nullable
        public Equatable.NestedEquatableStruct structField;
        @Nullable
        public Equatable.SomeEnum enumField;
        @Nullable
        public List<String> arrayField;
        @Nullable
        public Map<Integer, String> mapField;
        public EquatableNullableStruct() {
            this.boolField = null;
            this.intField = null;
            this.uintField = null;
            this.floatField = null;
            this.stringField = null;
            this.structField = null;
            this.enumField = null;
            this.arrayField = null;
            this.mapField = null;
        }
        @Override
        public boolean equals(Object obj) {
            if (obj == this) return true;
            if (!(obj instanceof EquatableNullableStruct)) return false;
            final EquatableNullableStruct other = (EquatableNullableStruct) obj;
            return java.util.Objects.equals(this.boolField, other.boolField) &&
                    java.util.Objects.equals(this.intField, other.intField) &&
                    java.util.Objects.equals(this.uintField, other.uintField) &&
                    java.util.Objects.equals(this.floatField, other.floatField) &&
                    java.util.Objects.equals(this.stringField, other.stringField) &&
                    java.util.Objects.equals(this.structField, other.structField) &&
                    java.util.Objects.equals(this.enumField, other.enumField) &&
                    java.util.Objects.equals(this.arrayField, other.arrayField) &&
                    java.util.Objects.equals(this.mapField, other.mapField);
        }
        @Override
        public int hashCode() {
            int hash = 7;
            hash = 31 * hash + (this.boolField != null ? this.boolField.hashCode() : 0);
            hash = 31 * hash + (this.intField != null ? this.intField.hashCode() : 0);
            hash = 31 * hash + (this.uintField != null ? this.uintField.hashCode() : 0);
            hash = 31 * hash + (this.floatField != null ? this.floatField.hashCode() : 0);
            hash = 31 * hash + (this.stringField != null ? this.stringField.hashCode() : 0);
            hash = 31 * hash + (this.structField != null ? this.structField.hashCode() : 0);
            hash = 31 * hash + (this.enumField != null ? this.enumField.hashCode() : 0);
            hash = 31 * hash + (this.arrayField != null ? this.arrayField.hashCode() : 0);
            hash = 31 * hash + (this.mapField != null ? this.mapField.hashCode() : 0);
            return hash;
        }
    }
    public static final class NestedEquatableStruct {
        @NonNull
        public String fooField;
        public NestedEquatableStruct(@NonNull final String fooField) {
            this.fooField = fooField;
        }
        @Override
        public boolean equals(Object obj) {
            if (obj == this) return true;
            if (!(obj instanceof NestedEquatableStruct)) return false;
            final NestedEquatableStruct other = (NestedEquatableStruct) obj;
            return java.util.Objects.equals(this.fooField, other.fooField);
        }
        @Override
        public int hashCode() {
            int hash = 7;
            hash = 31 * hash + (this.fooField != null ? this.fooField.hashCode() : 0);
            return hash;
        }
    }
}
