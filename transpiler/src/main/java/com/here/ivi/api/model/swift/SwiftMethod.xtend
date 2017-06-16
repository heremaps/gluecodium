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

package com.here.ivi.api.model.swift

class SwiftMethodParameter {

    new(String interfaceName, SwiftType type) {
        this(interfaceName, type, null)
    }

    new(String interfaceName, SwiftType type, String variableName) {
        this.interfaceName = interfaceName
        this.type = type
        this.variableName = variableName
    }

    def getVariableName() {
        if (variableName === null) interfaceName else variableName
    }

    def hasDifferentVariableName() {
        variableName != null
    }

    public String interfaceName
    public SwiftType type
    final private String variableName
}

class SwiftMethod {

    new(String name) {
        this(name, #[])
    }

    new(String name, SwiftMethodParameter[] parameters) {
        this.returnType = SwiftType.VOID
        this.parameters = parameters
        this.name = name
        this.comment = ""
    }

    enum Visibility {
        Public,
        Private
    }
    final public String name
    public String comment
    public SwiftType returnType
    final public SwiftMethodParameter[] parameters
    public boolean isStatic
    public boolean isConst
}
