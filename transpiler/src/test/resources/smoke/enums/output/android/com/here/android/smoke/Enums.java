/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.here.android.smoke;

import com.here.android.NativeBase;

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

    public static class ErrorStruct {
        public Enums.InternalError type = Enums.InternalError.values()[0];
        public String message;
    }

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
}
