/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
public class ConstantsInterface extends NativeBase {
    public static final boolean BOOL_CONSTANT = true;
    public static final int INT_CONSTANT = -11;
    public static final long UINT_CONSTANT = 4294967295L;
    public static final float FLOAT_CONSTANT = 2.71f;
    public static final double DOUBLE_CONSTANT = -3.14;
    public static final String STRING_CONSTANT = "Foo bar";
    public static final ConstantsInterface.StateEnum ENUM_CONSTANT = ConstantsInterface.StateEnum.ON;
    public enum StateEnum {
        OFF(0),
        ON(1);
        public final int value;
        StateEnum(final int value) {
            this.value = value;
        }
    }
    /** For internal use only */
    protected ConstantsInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
