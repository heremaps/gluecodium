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

package com.here.ivi.api.generator.converter.cpp.templates

import com.here.ivi.api.generator.common.cpp.templates.CppMethodBodyTemplate
import com.here.ivi.api.model.cppmodel.CppAssignments
import com.here.ivi.api.model.cppmodel.CppMethod
import java.util.logging.Level
import java.util.logging.Logger

class EnumConvertBodyTemplate implements CppMethodBodyTemplate{

    private static Logger logger = Logger.getLogger(typeof(EnumConvertBodyTemplate).getName())

    private final CppAssignments.CppAssignment assignment

    public new (CppAssignments.CppAssignment assignment) {
        this.assignment = assignment
    }

    override generate(CppMethod m) '''
    {
        «IF m.inParameters.size != 1 || m.outParameters.size != 1»
            «logger.log(Level.WARNING, "Invalid method signature, generated code won't compile")»
        «ENDIF»
        «IF !(assignment instanceof CppAssignments.PlainAssignment)»
            «logger.log(Level.WARNING, "Invalid cpp assignment, generated code won't compile")»
        «ENDIF»
        «IF assignment instanceof CppAssignments.PlainAssignment»
            «assignment.leftHandSide.name»=«assignment.rightHandSide.name»;
        «ENDIF»
        }
    }
    '''
}
