/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

public class Enums extends NativeBase {

    public enum SimpleEnum {
        FIRST(0),
        SECOND(1);

        public final int value;

        SimpleEnum(final int value) {
            this.value = value;
        }
    }

    public enum InternalError {
        ERROR_NONE(0),
        ERROR_FATAL(999);

        public final int value;

        InternalError(final int value) {
            this.value = value;
        }
    }

    public enum ExternalEnum {
        FOO(0),
        BAR(1);
        public final int value;
        ExternalEnum(final int value) {
            this.value = value;
        }
    }

    public static class ErrorStruct {
        public Enums.InternalError type = Enums.InternalError.values()[0];
        public String message;
        public ErrorStruct() {}
        public ErrorStruct(Enums.InternalError type, String message) {
            this.type = type;
            this.message = message;
        }
    }

    /** For internal use only */
    protected Enums(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);

    public static native Enums.SimpleEnum methodWithEnumeration(final Enums.SimpleEnum input);
    public static native Enums.InternalError flipEnumValue(final Enums.InternalError input);
    public static native Enums.InternalError extractEnumFromStruct(final Enums.ErrorStruct input);
    public static native Enums.ErrorStruct createStructWithEnumInside(final Enums.InternalError type, final String message);
    public static native void methodWithExternalEnum(final Enums.ExternalEnum input);
}
