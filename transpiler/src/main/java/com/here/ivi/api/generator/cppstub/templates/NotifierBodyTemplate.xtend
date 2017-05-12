package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.model.cppmodel.CppElements
import com.here.ivi.api.model.cppmodel.CppParameter
import com.here.ivi.api.generator.common.templates.MethodBodyTemplate
import org.eclipse.xtend2.lib.StringConcatenation

class NotifierBodyTemplate implements MethodBodyTemplate {
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
