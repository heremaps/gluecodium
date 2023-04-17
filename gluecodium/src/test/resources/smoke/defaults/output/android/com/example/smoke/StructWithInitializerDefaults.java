/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.HashMapBuilder;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
public final class StructWithInitializerDefaults {
    @NonNull
    public List<Integer> intsField;
    @NonNull
    public List<Float> floatsField;
    @NonNull
    public Set<String> setTypeField;
    @NonNull
    public Map<Long, String> mapField;
    public StructWithInitializerDefaults() {
        this.intsField = new ArrayList<>(Arrays.asList(4, -2, 42));
        this.floatsField = new ArrayList<>(Arrays.asList(3.14f, Float.NEGATIVE_INFINITY));
        this.setTypeField = new HashSet<>(Arrays.asList("foo", "bar"));
        this.mapField = new HashMapBuilder<Long, String>().put(1L, "foo").put(42L, "bar").build();
    }
}
