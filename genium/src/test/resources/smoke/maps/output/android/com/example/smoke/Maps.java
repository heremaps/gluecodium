/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Maps extends NativeBase {
    public static class SomeStruct {
        public String value;
        public SomeStruct() {
            this((String)null);
        }
        public SomeStruct(String value) {
            this.value = value;
        }
    }
    public static class StructWithMap {
        public Map<Integer, String> errorMapping;
        public StructWithMap() {
            this(new HashMap<>());
        }
        public StructWithMap(Map<Integer, String> errorMapping) {
            this.errorMapping = errorMapping;
        }
    }
    /** For internal use only */
    protected Maps(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native Map<Integer, String> methodWithMap(final Map<Integer, String> input);
    public static native Map<Long, Maps.SomeStruct> methodWithMapToStruct(final Map<Long, Maps.SomeStruct> input);
    public static native Map<Long, Map<Long, Maps.SomeStruct>> methodWithNestedMap(final Map<Long, Map<Long, Maps.SomeStruct>> input);
    public static native Maps.StructWithMap methodWithStructWithMap(final Maps.StructWithMap input);
    public static native Map<String, List<Integer>> methodWithMapOfArrays(final Map<String, List<Integer>> input);
}
