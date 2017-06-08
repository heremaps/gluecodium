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

class ObjCMethodParameter {

    new(String interfaceName, ObjCType type) {
        this.interfaceName = interfaceName
        this.type = type
        this.variableName = interfaceName
    }

    new(String interfaceName, ObjCType type, String variableName) {
        this.interfaceName = interfaceName
        this.type = type
        this.variableName = variableName
    }

    public String interfaceName
    public ObjCType type
    public String variableName
}

class ObjCMethod {

    new(String name) {
        this.name = name
        this.returnType = new ObjCType("void")
        this.parameters = #{}
        this.comment = ""
    }

    new(ObjCMethodParameter[] parameters) {
        this.returnType = new ObjCType("void")
        this.parameters = parameters
        this.name = null
        this.comment = ""
    }

    enum Visibility {
        Public,
        Private
    }
    final public String name
    public String comment
    public ObjCType returnType
    final public ObjCMethodParameter[] parameters
    public boolean isStatic
    public boolean isConst
}
