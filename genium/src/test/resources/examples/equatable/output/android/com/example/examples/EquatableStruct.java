/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import android.support.annotation.NonNull;
public final class EquatableStruct {
    public int intField;
    @NonNull
    public String stringField;
    @NonNull
    public NestedEquatableStruct structField;
    public EquatableStruct(final int intField, @NonNull final String stringField, @NonNull final NestedEquatableStruct structField) {
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
}