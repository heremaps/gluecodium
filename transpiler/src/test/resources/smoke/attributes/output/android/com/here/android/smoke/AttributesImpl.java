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
import java.util.List;

class AttributesImpl extends NativeBase implements Attributes {
    protected AttributesImpl(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native long getBuiltInTypeAttribute();
    public native void setBuiltInTypeAttribute(final long value);
    public native float getReadonlyAttribute();
    public native Attributes.ExampleStruct getStructAttribute();
    public native void setStructAttribute(final Attributes.ExampleStruct value);
    public native List<String> getArrayAttribute();
    public native void setArrayAttribute(final List<String> value);
    public native Attributes.InternalError getComplexTypeAttribute();
    public native void setComplexTypeAttribute(final Attributes.InternalError value);
}