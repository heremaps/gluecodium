/*
 *
 */
package com.example.smoke;
import com.example.HashMapBuilder;
import com.example.NativeBase;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
public final class CollectionConstants extends NativeBase {
    public static final List<String> LIST_CONSTANT = new ArrayList<>(Arrays.asList("foo", "bar"));
    public static final Set<String> SET_CONSTANT = new HashSet<>(Arrays.asList("foo", "bar"));
    public static final Map<String, String> MAP_CONSTANT = new HashMapBuilder<String, String>().put("foo", "bar").build();
    public static final Map<List<String>, Set<String>> MIXED_CONSTANT = new HashMapBuilder<List<String>, Set<String>>().put(new ArrayList<>(Arrays.asList("foo")), new HashSet<>(Arrays.asList("bar"))).build();
    /**
     * For internal use only.
     * @hidden
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
