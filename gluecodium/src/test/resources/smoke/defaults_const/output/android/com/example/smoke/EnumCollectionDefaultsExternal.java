/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
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
public final class EnumCollectionDefaultsExternal {
    @NonNull
    public List<foo.AlienEnum1> listField;
    @NonNull
    public Set<foo.AlienEnum2> setField;
    @NonNull
    public Map<foo.AlienEnum3, foo.AlienEnum4> mapField;
    public EnumCollectionDefaultsExternal() {
        this.listField = new ArrayList<>(Arrays.asList(foo.AlienEnum1.DISABLED));
        this.setField = new EnumSet<>(Arrays.asList(foo.AlienEnum2.DISABLED));
        this.mapField = new HashMap<>(Stream.of(new AbstractMap.SimpleEntry<>(foo.AlienEnum3.DISABLED, foo.AlienEnum4.DISABLED)).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
    }
}
