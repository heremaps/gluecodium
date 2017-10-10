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

import com.here.android.smoke.Enums;

public class Enums {
    public static class ErrorStruct {
        public TODO type = new TODO();
        public String message;
    }
    public static native TODO flipEnumValue(final TODO input);
    public static native TODO extractEnumFromStruct(final Enums.ErrorStruct input);
    public static native Enums.ErrorStruct createStructWithEnumInside(final TODO type, final String message);
}