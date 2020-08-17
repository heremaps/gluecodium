/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
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
public final class CollectionConstants extends NativeBase {
    public static final List<String> LIST_CONSTANT = new ArrayList<>(Arrays.asList("foo", "bar"));
    public static final Set<String> SET_CONSTANT = new HashSet<>(Arrays.asList("foo", "bar"));
    public static final Map<String, String> MAP_CONSTANT = new HashMap<>(Stream.of(new AbstractMap.SimpleEntry<>("foo", "bar")).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
    public static final Map<List<String>, Set<String>> MIXED_CONSTANT = new HashMap<>(Stream.of(new AbstractMap.SimpleEntry<>(new ArrayList<>(Arrays.asList("foo")), new HashSet<>(Arrays.asList("bar")))).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
    /**
     * For internal use only.
     * @exclude
     */
    protected CollectionConstants(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
