/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.fire.Enum1;
import com.example.fire.Enum2;
import com.example.fire.Enum3;
import com.example.fire.Enum4;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
public final class EnumCollectionDefaults {
    @NonNull
    public List<Enum1> listField;
    @NonNull
    public Set<Enum2> setField;
    @NonNull
    public Map<Enum3, Enum4> mapField;
    public EnumCollectionDefaults() {
        this.listField = new ArrayList<>(Arrays.asList(Enum1.DISABLED));
        this.setField = new EnumSet<>(Arrays.asList(Enum2.DISABLED));
        this.mapField = new HashMap<>(Stream.of(new AbstractMap.SimpleEntry<>(Enum3.DISABLED, Enum4.DISABLED)).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
    }
}
