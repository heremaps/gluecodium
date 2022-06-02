/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import com.example.fire.Enum1;
import com.example.fire.Enum2;
import com.example.fire.Enum3;
import com.example.fire.Enum4;
public final class EnumDefaults extends NativeBase {
    public static final class SimpleEnum {
        @NonNull
        public Enum1 enumField;
        public SimpleEnum() {
            this.enumField = Enum1.DISABLED;
        }
    }
    public static final class NullableEnum {
        @Nullable
        public Enum2 enumField1;
        @Nullable
        public Enum2 enumField1;
        public NullableEnum() {
            this.enumField1 = null;
            this.enumField1 = Enum2.DISABLED;
        }
    }
    public static final class AliasEnum {
        @NonNull
        public Enum3 enumField;
        public AliasEnum() {
            this.enumField = Enum3.DISABLED;
        }
    }
    public static final class WrappedEnum {
        @NonNull
        public EnumWrapper structField;
        public WrappedEnum() {
            this.structField = new EnumWrapper(Enum4.DISABLED);
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected EnumDefaults(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
