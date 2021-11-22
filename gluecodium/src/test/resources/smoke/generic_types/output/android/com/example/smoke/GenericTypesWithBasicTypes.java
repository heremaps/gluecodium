/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;
import java.util.Set;
public final class GenericTypesWithBasicTypes extends NativeBase {
    public static final class StructWithGenerics {
        @NonNull
        public List<Short> numbersList;
        @NonNull
        public Map<Short, String> numbersMap;
        @NonNull
        public Set<Short> numbersSet;
        public StructWithGenerics(@NonNull final List<Short> numbersList, @NonNull final Map<Short, String> numbersMap, @NonNull final Set<Short> numbersSet) {
            this.numbersList = numbersList;
            this.numbersMap = numbersMap;
            this.numbersSet = numbersSet;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected GenericTypesWithBasicTypes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native List<Integer> methodWithList(@NonNull final List<Integer> input);
    @NonNull
    public native Map<Integer, Boolean> methodWithMap(@NonNull final Map<Integer, Boolean> input);
    @NonNull
    public native Set<Integer> methodWithSet(@NonNull final Set<Integer> input);
    @NonNull
    public native List<String> methodWithListTypeAlias(@NonNull final List<String> input);
    @NonNull
    public native Map<String, String> methodWithMapTypeAlias(@NonNull final Map<String, String> input);
    @NonNull
    public native Set<String> methodWithSetTypeAlias(@NonNull final Set<String> input);
    @NonNull
    public native List<Float> getListProperty();
    public native void setListProperty(@NonNull final List<Float> value);
    @NonNull
    public native Map<Float, Double> getMapProperty();
    public native void setMapProperty(@NonNull final Map<Float, Double> value);
    @NonNull
    public native Set<Float> getSetProperty();
    public native void setSetProperty(@NonNull final Set<Float> value);
}
