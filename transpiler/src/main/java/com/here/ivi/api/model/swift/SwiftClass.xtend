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

final class SwiftClass {

    static final private String BASE_CLASS = "NSObject"

    new(String name, String parentClass) {
        this.name = name
        this.parentClass = parentClass
        this.implementsProtocols = #{}
        this.properties = #{}
        this.includes = #{}
        this.methods = #{}
        this.comment = ""
    }

    new(String name) {
        this(name, BASE_CLASS)
    }

    final public String name
    public String comment
    public String prefix
    final public String parentClass
    public String[] implementsProtocols
    public SwiftProperty[] properties
    public SwiftIncludes[] includes
    public SwiftMethod[] methods
}
