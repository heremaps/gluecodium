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
import java.util.List;

public interface Attributes {
    public enum InternalError {
        ERROR_NONE(0),
        ERROR_FATAL(999);
        public final int value;
        InternalError(final int value) {
            this.value = value;
        }
    }

    public static class ExampleStruct {
        public double value;
    }

    long getBuiltInTypeAttribute();
    void setBuiltInTypeAttribute(final long value);
    float getReadonlyAttribute();
    Attributes.ExampleStruct getStructAttribute();
    void setStructAttribute(final Attributes.ExampleStruct value);
    List<String> getArrayAttribute();
    void setArrayAttribute(final List<String> value);
    Attributes.InternalError getComplexTypeAttribute();
    void setComplexTypeAttribute(final Attributes.InternalError value);
}
