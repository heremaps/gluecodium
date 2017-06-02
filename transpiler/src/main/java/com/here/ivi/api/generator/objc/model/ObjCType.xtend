/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.objc.model

class ObjCType {

    new(String name) {
        this.name = name
    }

    new(String name, Subtype subType) {
        this.name = name
        this.subtype = subType
    }

    enum Subtype {
        PRIMITIVE,
        POINTER,
        REFERENCE,
        BLOCK
    }
    enum Nullability {
        NONNULL,
        NULLABLE
    }
    public Subtype subtype
    final public String name
    public String templatedTypeName
    public String documentation
    public ObjCType blockReturnType
    public ObjCType[] blockParameters
    public Boolean isConst
}
