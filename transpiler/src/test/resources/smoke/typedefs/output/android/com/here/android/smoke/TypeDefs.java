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

public class TypeDefs {
    public static class TestStruct {
        public String something;
    }
    public static native double methodWithPrimitiveTypeDef(final double input);
    public static native List<TypeDefs.TestStruct> methodWithComplexTypeDef(final List<TypeDefs.TestStruct> input);
    public static native double returnNestedIntTypeDef(final double input);
    public static native TypeDefs.TestStruct returnTestStructTypeDef(final TypeDefs.TestStruct input);
    public static native TypeDefs.TestStruct returnNestedStructTypeDef(final TypeDefs.TestStruct input);
    public static native Point returnTypeDefPointFromTypeCollection(final Point input);
}