/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
public final class SimpleEquatableStruct {
    @NonNull
    public NonEquatableClass classField;
    @NonNull
    public NonEquatableInterface interfaceField;
    @Nullable
    public NonEquatableClass nullableClassField;
    @Nullable
    public NonEquatableInterface nullableInterfaceField;
    public SimpleEquatableStruct(@NonNull final NonEquatableClass classField, @NonNull final NonEquatableInterface interfaceField, @Nullable final NonEquatableClass nullableClassField, @Nullable final NonEquatableInterface nullableInterfaceField) {
        this.classField = classField;
        this.interfaceField = interfaceField;
        this.nullableClassField = nullableClassField;
        this.nullableInterfaceField = nullableInterfaceField;
    }
    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof SimpleEquatableStruct)) return false;
        final SimpleEquatableStruct other = (SimpleEquatableStruct) obj;
        return java.util.Objects.equals(this.classField, other.classField) &&
                java.util.Objects.equals(this.interfaceField, other.interfaceField) &&
                java.util.Objects.equals(this.nullableClassField, other.nullableClassField) &&
                java.util.Objects.equals(this.nullableInterfaceField, other.nullableInterfaceField);
    }
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + (this.classField != null ? this.classField.hashCode() : 0);
        hash = 31 * hash + (this.interfaceField != null ? this.interfaceField.hashCode() : 0);
        hash = 31 * hash + (this.nullableClassField != null ? this.nullableClassField.hashCode() : 0);
        hash = 31 * hash + (this.nullableInterfaceField != null ? this.nullableInterfaceField.hashCode() : 0);
        return hash;
    }
}
