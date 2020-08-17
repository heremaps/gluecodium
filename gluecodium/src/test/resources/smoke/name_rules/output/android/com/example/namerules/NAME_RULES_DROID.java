/*
 *
 */
package com.example.namerules;
import com.example.NativeBase;
import java.util.List;
public final class NAME_RULES_DROID extends NativeBase {
    public enum EXAMPLE_ERROR_CODE_DROID {
        NONE(0),
        FATAL(1);
        public final int value;
        EXAMPLE_ERROR_CODE_DROID(final int value) {
            this.value = value;
        }
    }
    public static final class example_x extends Exception {
        public example_x(final NAME_RULES_DROID.EXAMPLE_ERROR_CODE_DROID error) {
            super(error.toString());
            this.error = error;
        }
        public final NAME_RULES_DROID.EXAMPLE_ERROR_CODE_DROID error;
    }
    public static final class EXAMPLE_STRUCT_DROID {
        public double j_value;
        public List<Long> j_int_value;
        public EXAMPLE_STRUCT_DROID(final double j_value, final List<Long> j_int_value) {
            this.j_value = j_value;
            this.j_int_value = j_int_value;
        }
    }
    public NAME_RULES_DROID() {
        this(create(), (Object)null);
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected NAME_RULES_DROID(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private native void cacheThisInstance();
    private static native long create();
    public native double some_method(final NAME_RULES_DROID.EXAMPLE_STRUCT_DROID some_argument) throws NAME_RULES_DROID.example_x;
    public native long loadIntProperty();
    public native void STORE_INT_PROPERTY(final long value);
    public native boolean loadBooleanProperty();
    public native void STORE_BOOLEAN_PROPERTY(final boolean value);
    public native NAME_RULES_DROID.EXAMPLE_STRUCT_DROID loadStructProperty();
    public native void STORE_STRUCT_PROPERTY(final NAME_RULES_DROID.EXAMPLE_STRUCT_DROID value);
}
