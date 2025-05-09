/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;

public final class EnumDefaultsExternal extends NativeBase {
    public static final class SimpleEnum {
        @NonNull
        public foo.AlienEnum1 enumField;

        public SimpleEnum() {
            this.enumField = foo.AlienEnum1.DISABLED;
        }


    }

    public static final class NullableEnum {
        @Nullable
        public foo.AlienEnum2 enumField1;
        @Nullable
        public foo.AlienEnum2 enumField2;

        public NullableEnum() {
            this.enumField1 = null;
            this.enumField2 = foo.AlienEnum2.DISABLED;
        }


    }

    public static final class AliasEnum {
        @NonNull
        public foo.AlienEnum3 enumField;

        public AliasEnum() {
            this.enumField = foo.AlienEnum3.DISABLED;
        }


    }

    public static final class WrappedEnum {
        @NonNull
        public EnumWrapper structField;

        public WrappedEnum() {
            this.structField = new EnumWrapper(foo.AlienEnum4.DISABLED);
        }


    }


    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected EnumDefaultsExternal(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);




}

