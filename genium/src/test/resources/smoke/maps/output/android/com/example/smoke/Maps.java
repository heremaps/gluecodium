/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;
public class Maps extends NativeBase {
    public static class SomeStruct {
        @NonNull
        public String value;
        public SomeStruct(@NonNull final String value) {
            this.value = value;
        }
        @Override
        public boolean equals(Object obj) {
            if (obj == this) return true;
            if (!(obj instanceof SomeStruct)) return false;
            final SomeStruct other = (SomeStruct) obj;
            return java.util.Objects.equals(this.value, other.value);
        }
        @Override
        public int hashCode() {
            int hash = 7;
            hash = 31 * hash + (this.value != null ? this.value.hashCode() : 0);
            return hash;
        }
    }
    public static class StructWithMap {
        @NonNull
        public Map<Integer, String> errorMapping;
        public StructWithMap(@NonNull final Map<Integer, String> errorMapping) {
            this.errorMapping = errorMapping;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Maps(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native Map<Integer, String> methodWithMap(@NonNull final Map<Integer, String> input);
    @NonNull
    public static native Map<Short, Maps.SomeStruct> methodWithMapToStruct(@NonNull final Map<Short, Maps.SomeStruct> input);
    @NonNull
    public static native Map<Short, Map<Short, Maps.SomeStruct>> methodWithNestedMap(@NonNull final Map<Short, Map<Short, Maps.SomeStruct>> input);
    @NonNull
    public static native Maps.StructWithMap methodWithStructWithMap(@NonNull final Maps.StructWithMap input);
    @NonNull
    public static native Map<String, List<Integer>> methodWithMapOfArrays(@NonNull final Map<String, List<Integer>> input);
    @NonNull
    public static native Map<Short, MapsInstance> methodWithMapOfInstances(@NonNull final Map<Short, MapsInstance> input);
    @NonNull
    public static native Map<Maps.SomeStruct, String> methodWithStructToStringMap(@NonNull final Map<Maps.SomeStruct, String> input);
    @NonNull
    public static native Map<MapsInstance, String> methodWithEquatableClassToStringMap(@NonNull final Map<MapsInstance, String> input);
    @NonNull
    public static native Map<PointerEquatableInstance, String> methodWithPointerEquatableClassToString(@NonNull final Map<PointerEquatableInstance, String> input);
}