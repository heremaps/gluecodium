/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
public final class StructWithInitializerDefaults {
    @NonNull
    public List<Integer> intsField;
    @NonNull
    public List<Float> floatsField;
    @NonNull
    public StructWithAnEnum structField;
    @NonNull
    public Set<String> setTypeField;
    public StructWithInitializerDefaults() {
        this.intsField = new ArrayList<>(Arrays.asList(4, -2, 42));
        this.floatsField = new ArrayList<>(Arrays.asList(3.14f, Float.NEGATIVE_INFINITY));
        this.structField = new StructWithAnEnum(AnEnum.DISABLED);
        this.setTypeField = new HashSet<>(Arrays.asList("foo", "bar"));
    }
    public StructWithInitializerDefaults(@NonNull final List<Integer> intsField, @NonNull final List<Float> floatsField, @NonNull final StructWithAnEnum structField, @NonNull final Set<String> setTypeField) {
        this.intsField = intsField;
        this.floatsField = floatsField;
        this.structField = structField;
        this.setTypeField = setTypeField;
    }
}
