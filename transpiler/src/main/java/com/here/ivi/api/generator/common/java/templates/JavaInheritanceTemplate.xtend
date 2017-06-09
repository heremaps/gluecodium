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

package com.here.ivi.api.generator.common.java.templates

import com.here.ivi.api.model.javamodel.JavaInheritance
import java.util.Set

class JavaInheritanceTemplate {
    /*
    * Generates inheritances for an interface
    * @param inheritances set of interface inheritances
    */
    static def generate(Set<JavaInheritance> inheritances) '''
        «FOR i : inheritances BEFORE 'extends ' SEPARATOR ', ' AFTER ' '»
        «i.type.name»
        «ENDFOR»'''

    /*
    * Generates inheritance for a class
    * @param inheritance the class inheritance object
    */
    static def generate(JavaInheritance inheritance)'''
    «IF inheritance != null»extends «inheritance.type.name» «ENDIF»'''
}
