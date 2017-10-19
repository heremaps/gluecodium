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
import java.util.HashMap;
import java.util.Map;
public class Maps {
    public static class SomeStruct {
        public String value;
    }
    public static class StructWithMap {
        public Map<Integer, String> errorMapping = new HashMap<>();
    }
    public static native Map<Integer, String> methodWithMap(final Map<Integer, String> input);
    public static native Map<Long, Maps.SomeStruct> methodWithMapToStruct(final Map<Long, Maps.SomeStruct> input);
    public static native Map<Maps.SomeStruct, Long> methodWithStructAsMapKeys(final Map<Maps.SomeStruct, Long> input);
    public static native Map<Long, Map<Long, Maps.SomeStruct>> methodWithNestedMap(final Map<Long, Map<Long, Maps.SomeStruct>> input);
    public static native Maps.StructWithMap methodWithStructWithMap(final Maps.StructWithMap input);
}
