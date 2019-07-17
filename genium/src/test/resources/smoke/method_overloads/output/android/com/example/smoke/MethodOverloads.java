/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public class MethodOverloads extends NativeBase {
    public static class Point {
        public double x;
        public double y;
        public Point(final double x, final double y) {
            this.x = x;
            this.y = y;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected MethodOverloads(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native boolean isBoolean(final boolean input);
    public native boolean isBoolean(final byte input);
    public native boolean isBoolean(@NonNull final String input);
    public native boolean isBoolean(@NonNull final MethodOverloads.Point input);
    public native boolean isBoolean(final boolean input1, final byte input2, @NonNull final String input3, @NonNull final MethodOverloads.Point input4);
    public native boolean isBooleanStringArrayOverload(@NonNull final List<String> input);
    public native boolean isBooleanIntArrayOverload(@NonNull final List<Byte> input);
    public native boolean isBoolean();
    public native boolean isFloat(@NonNull final String input);
    public native boolean isFloat(@NonNull final List<Byte> input);
}