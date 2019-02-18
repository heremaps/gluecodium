/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.Nullable;
import java.util.List;
import java.util.Map;
public class EquatableNullableStruct {
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
    public NestedEquatableStruct structField;
    @Nullable
    public SomeEnum enumField;
    @Nullable
    public List<String> arrayField;
    @Nullable
    public Map<Integer, String> mapField;
    public EquatableNullableStruct() {
        this((Boolean)null, (Integer)null, (Integer)null, (Float)null, (String)null, (NestedEquatableStruct)null, (SomeEnum)null, (List<String>)null, (Map<Integer, String>)null);
    }
    public EquatableNullableStruct(Boolean boolField, Integer intField, Integer uintField, Float floatField, String stringField, NestedEquatableStruct structField, SomeEnum enumField, List<String> arrayField, Map<Integer, String> mapField) {
        this.boolField = boolField;
        this.intField = intField;
        this.uintField = uintField;
        this.floatField = floatField;
        this.stringField = stringField;
        this.structField = structField;
        this.enumField = enumField;
        this.arrayField = arrayField;
        this.mapField = mapField;
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
    public static class Builder {
        private Boolean boolField = (Boolean)null;
        private Integer intField = (Integer)null;
        private Integer uintField = (Integer)null;
        private Float floatField = (Float)null;
        private String stringField = (String)null;
        private NestedEquatableStruct structField = (NestedEquatableStruct)null;
        private SomeEnum enumField = (SomeEnum)null;
        private List<String> arrayField = (List<String>)null;
        private Map<Integer, String> mapField = (Map<Integer, String>)null;
        public Builder() {
        }
        public Builder setBoolField(Boolean boolField) {
            this.boolField = boolField;
            return this;
        }
        public Builder setIntField(Integer intField) {
            this.intField = intField;
            return this;
        }
        public Builder setUintField(Integer uintField) {
            this.uintField = uintField;
            return this;
        }
        public Builder setFloatField(Float floatField) {
            this.floatField = floatField;
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
        public EquatableNullableStruct build() {
            return new EquatableNullableStruct(boolField, intField, uintField, floatField, stringField, structField, enumField, arrayField, mapField);
        }
    }
}
