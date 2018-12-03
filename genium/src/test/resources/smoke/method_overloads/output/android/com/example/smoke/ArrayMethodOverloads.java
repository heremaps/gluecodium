/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;

public class ArrayMethodOverloads extends NativeBase {
    /** For internal use only */
    protected ArrayMethodOverloads(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void doStuff();
    public native void doStuff(final int input);
    public native void doStuffIntArrayOverload(@NonNull final List<Integer> input);
    public native void doStuffStringArrayOverload(@NonNull final List<String> input);
    public native void doStuffStringToIdMapOverload(final Map<String, Long> input);
    public native void doStuffIdToStringMapOverload(final Map<Long, String> input);
    public native void doStuff(@NonNull final List<Integer> arrayParam, final int intParam);
    public native void doStuff(final int intParam, @NonNull final List<Integer> arrayParam);
    public native void doOtherStuff(@NonNull final List<Integer> input);
    public native void doMoreStuff(final Map<String, Long> input);
}
