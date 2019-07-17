/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.List;
import java.util.Map;
public class EquatableStruct {
    public boolean boolField;
    public int intField;
    public long longField;
    public float floatField;
    public double doubleField;
    @NonNull
    public String stringField;
    @NonNull
    public NestedEquatableStruct structField;
    @NonNull
    public SomeEnum enumField;
    @NonNull
    public List<String> arrayField;
    @NonNull
    public Map<Integer, String> mapField;
    public EquatableStruct(final boolean boolField, final int intField, final long longField, final float floatField, final double doubleField, @NonNull final String stringField, @NonNull final NestedEquatableStruct structField, @NonNull final SomeEnum enumField, @NonNull final List<String> arrayField, @NonNull final Map<Integer, String> mapField) {
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