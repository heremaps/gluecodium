/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;

import android.support.annotation.NonNull;

public class EquatableStruct {

    public int intField;
    public String stringField;
    @NonNull
    public NestedEquatableStruct structField;

    public EquatableStruct() {
        this(0, (String)null, new NestedEquatableStruct());
    }

    public EquatableStruct(int intField, String stringField, NestedEquatableStruct structField) {
        this.intField = intField;
        this.stringField = stringField;
        this.structField = structField;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof EquatableStruct)) return false;
        final EquatableStruct other = (EquatableStruct) obj;
        return this.intField == other.intField &&
                java.util.Objects.equals(this.stringField, other.stringField) &&
                java.util.Objects.equals(this.structField, other.structField);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + this.intField;
        hash = 31 * hash + (this.stringField != null ? this.stringField.hashCode() : 0);
        hash = 31 * hash + (this.structField != null ? this.structField.hashCode() : 0);
        return hash;
    }

    public static class Builder {
        private int intField = 0;
        private String stringField = (String)null;
        private NestedEquatableStruct structField = new NestedEquatableStruct();
        public Builder() {
        }
        public Builder setIntField(int intField) {
            this.intField = intField;
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
        public EquatableStruct build() {
            return new EquatableStruct(intField, stringField, structField);
        }
    }
}