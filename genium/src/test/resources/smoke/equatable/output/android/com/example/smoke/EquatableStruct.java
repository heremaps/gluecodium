/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EquatableStruct {
    public boolean boolField;
    public int intField;
    public long longField;
    public float floatField;
    public double doubleField;
    public String stringField;
    @NonNull
    public NestedEquatableStruct structField;
    @NonNull
    public SomeEnum enumField;
    @NonNull
    public List<String> arrayField;
    @NonNull
    public Map<Integer, String> mapField;

    public EquatableStruct() {
        this(false, 0, 0L, 0f, 0, "", new NestedEquatableStruct(), SomeEnum.values()[0], new ArrayList<>(), new HashMap<>());
    }

    public EquatableStruct(boolean boolField, int intField, long longField, float floatField, double doubleField, String stringField, NestedEquatableStruct structField, SomeEnum enumField, List<String> arrayField, Map<Integer, String> mapField) {
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

    public static class Builder {
        private boolean boolField = false;
        private int intField = 0;
        private long longField = 0L;
        private float floatField = 0f;
        private double doubleField = 0;
        private String stringField = "";
        private NestedEquatableStruct structField = new NestedEquatableStruct();
        private SomeEnum enumField = SomeEnum.values()[0];
        private List<String> arrayField = new ArrayList<>();
        private Map<Integer, String> mapField = new HashMap<>();
        public Builder() {
        }
        public Builder setBoolField(boolean boolField) {
            this.boolField = boolField;
            return this;
        }
        public Builder setIntField(int intField) {
            this.intField = intField;
            return this;
        }
        public Builder setLongField(long longField) {
            this.longField = longField;
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
        public Builder setStructField(NestedEquatableStruct structField) {
            this.structField = structField;
            return this;
        }
        public Builder setEnumField(SomeEnum enumField) {
            this.enumField = enumField;
            return this;
        }
        public Builder setArrayField(List<String> arrayField) {
            this.arrayField = arrayField;
            return this;
        }
        public Builder setMapField(Map<Integer, String> mapField) {
            this.mapField = mapField;
            return this;
        }
        public EquatableStruct build() {
            return new EquatableStruct(boolField, intField, longField, floatField, doubleField, stringField, structField, enumField, arrayField, mapField);
        }
    }
}
