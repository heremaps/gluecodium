/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
public final class StructWithInitializerDefaults {
    @NonNull
    public List<Integer> intsField;
    @NonNull
    public List<Float> floatsField;
    @NonNull
    public StructWithAnEnum structField;
    @NonNull
    public Set<String> setTypeField;
    @NonNull
    public Map<Long, String> mapField;
    public StructWithInitializerDefaults() {
        this.intsField = new ArrayList<>(Arrays.asList(4, -2, 42));
        this.floatsField = new ArrayList<>(Arrays.asList(3.14f, Float.NEGATIVE_INFINITY));
        this.structField = new StructWithAnEnum(AnEnum.DISABLED);
        this.setTypeField = new HashSet<>(Arrays.asList("foo", "bar"));
        this.mapField = new HashMap<>(Stream.of(new AbstractMap.SimpleEntry<>(1L, "foo"), new AbstractMap.SimpleEntry<>(42L, "bar")).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
    }
    public StructWithInitializerDefaults(@NonNull final List<Integer> intsField, @NonNull final List<Float> floatsField, @NonNull final StructWithAnEnum structField, @NonNull final Set<String> setTypeField, @NonNull final Map<Long, String> mapField) {
        this.intsField = intsField;
        this.floatsField = floatsField;
        this.structField = structField;
        this.setTypeField = setTypeField;
        this.mapField = mapField;
    }
}
