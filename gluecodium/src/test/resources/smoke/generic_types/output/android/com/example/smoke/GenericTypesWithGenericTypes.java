/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;
import java.util.Set;
public final class GenericTypesWithGenericTypes extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected GenericTypesWithGenericTypes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native List<List<Integer>> methodWithListOfLists(@NonNull final List<List<Integer>> input);
    @NonNull
    public native Map<Map<Integer, Boolean>, Boolean> methodWithMapOfMaps(@NonNull final Map<Integer, Map<Integer, Boolean>> input);
    @NonNull
    public native Set<Set<Integer>> methodWithSetOfSets(@NonNull final Set<Set<Integer>> input);
    @NonNull
    public native Map<Integer, List<Integer>> methodWithListAndMap(@NonNull final List<Map<Integer, Boolean>> input);
    @NonNull
    public native Set<List<Integer>> methodWithListAndSet(@NonNull final List<Set<Integer>> input);
    @NonNull
    public native Set<Map<Integer, Boolean>> methodWithMapAndSet(@NonNull final Map<Integer, Set<Integer>> input);
    @NonNull
    public native Map<List<Integer>, Boolean> methodWithMapGenericKeys(@NonNull final Map<Set<Integer>, Boolean> input);
}
