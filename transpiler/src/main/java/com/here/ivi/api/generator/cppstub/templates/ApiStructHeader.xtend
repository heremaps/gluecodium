package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.generator.common.templates.CppMethodTemplate
import com.here.ivi.api.generator.common.templates.CppIncludeTemplate
import com.here.ivi.api.model.cppmodel.CppClass
import com.here.ivi.api.model.cppmodel.CppElements


public class ApiStructHeader {
    def static generate(CppClass cppClass) '''
    #pragma once

    #include <legacy/common/defines.h>

    «FOR include : CppElements.collectIncludes(cppClass)»
      «CppIncludeTemplate.generate(include)»
    «ENDFOR»

    namespace legacy {

    «IF cppClass.comment !== null && !cppClass.comment.isEmpty()»
    /**
     * «cppClass.comment»
     */
    «ENDIF»
    struct «cppClass.name»{

        «cppClass.name»( ) = default;

        «FOR m : cppClass.methods»
        «CppMethodTemplate.signature(m)»
        «m.generateBody()»
        «ENDFOR»

        «FOR f : cppClass.fields»
        «IF f.initializer != null && f.initializer.isValid()»
            «f.type.name» «f.name» = «f.initializer.name»;
        «ELSE»
            «f.type.name» «f.name»;
        «ENDIF»
        «ENDFOR»

    };

    } // namespace legacy
    '''
}
