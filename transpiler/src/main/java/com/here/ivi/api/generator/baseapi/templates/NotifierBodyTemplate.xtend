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

package com.here.ivi.api.generator.baseapi.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.model.cppmodel.CppElements
import com.here.ivi.api.model.cppmodel.CppParameter
import com.here.ivi.api.generator.common.cpp.templates.CppMethodBodyTemplate
import org.eclipse.xtend2.lib.StringConcatenation

class NotifierBodyTemplate implements CppMethodBodyTemplate {
    private String listenerName
    private String callbackName

    public new (String listenerName, String callbackName) {
        this.listenerName = listenerName
        this.callbackName = callbackName
    }

    def static generate(CppParameter p) {
        if( p.mode == CppParameter.Mode.Input ) {
            '''«CppElements.CONST_QUALIFIER» «p.type.name»«IF p.type.info == CppElements.TypeInfo.Complex || p.type.info == CppElements.TypeInfo.InterfaceInstance»«CppElements.REF_QUALIFIER»«ENDIF»'''
        } else if(p.mode == CppParameter.Mode.Output) {
            '''«p.type.name»«CppElements.REF_QUALIFIER»'''
        } else {
            '''«p.type.name»«CppElements.POINTER»'''
        }
    }

    override StringConcatenation generate(CppMethod m) '''
    {
        «IF m.hasParameters»
            here::internal::ListenerVector< «listenerName» >::call_all< «(m.inParameters + m.outParameters).map[ p | p.generate ].join(', ')» >(
                &«listenerName»::«callbackName»,
                «(m.inParameters + m.outParameters).map[ p | p.name ].join(', ')» );
        «ELSE»
            here::internal::ListenerVector< «listenerName» >::call_all( &«listenerName»::«callbackName» );
        «ENDIF»
    }
    '''
}
