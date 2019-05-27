/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import java.util.Set;
public class SetType extends NativeBase {
    public enum SomeEnum {
        OFF(0),
        ON(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected SetType(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native Set<String> stringSetRoundTrip(@NonNull final Set<String> input);
    @NonNull
    public static native Set<SetType.SomeEnum> enumSetRoundTrip(@NonNull final Set<SetType.SomeEnum> input);
    @Nullable
    public static native Set<Integer> nullableIntSetRoundTrip(@Nullable final Set<Integer> input);
}
