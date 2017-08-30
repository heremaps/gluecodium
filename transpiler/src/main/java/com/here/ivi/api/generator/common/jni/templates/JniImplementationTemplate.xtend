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

package com.here.ivi.api.generator.common.jni.templates

import com.here.ivi.api.generator.common.java.templates.JavaCopyrightHeaderTemplate
import com.here.ivi.api.generator.common.jni.JniTypeNameMapper
import com.here.ivi.api.generator.common.TemplateEngine
import static com.here.ivi.api.generator.common.jni.JniNameRules.getParameterName
import com.here.ivi.api.generator.common.jni.CppToJniConversionTemplateDelegator
import com.here.ivi.api.generator.common.jni.JniToCppTypeConversionTemplateDelegator
import com.here.ivi.api.generator.common.jni.JniNameRules
import com.here.ivi.api.model.javamodel.JavaCustomType
import com.here.ivi.api.model.jni.JniParameter
import com.here.ivi.api.model.jni.JniContainer

public class JniImplementationTemplate {

  //TODO: this needs to be removed just a temporary fix!!!
  def static boolean isStructType(JniParameter jniParameter){
    //at the moment, custom is only used for structs ...
    return jniParameter.javaType instanceof JavaCustomType
  }

  def static generate(JniContainer jniContainer) {
    if (jniContainer === null || jniContainer.includes.isEmpty()) {
      return ""
    }
    return
     '''
      «JavaCopyrightHeaderTemplate.generate()»
      «FOR include : jniContainer.includes»
      #include "«include.fileName»"
      «ENDFOR»
      #include "«JniNameRules.getConversionHeaderFileName()»"

      extern "C" {

      «FOR jniMethod : jniContainer.methods»
      «JniTypeNameMapper.map(jniMethod.javaReturnType)»
      «JniFunctionSignatureTemplate.generate(jniMethod)»
      {
        «FOR parameter : jniMethod.parameters»
          «parameter.cppType.name» «parameter.name»;
          «JniToCppTypeConversionTemplateDelegator.generate(parameter.javaType,getParameterName(parameter.name), parameter.name)»;
        «ENDFOR»
        «IF jniMethod.hasVoidReturnType»
        «TemplateEngine.render("jni/CppMethodCall", jniMethod)»
        «ELSE»
        auto result = «TemplateEngine.render("jni/CppMethodCall", jniMethod)»
        return «CppToJniConversionTemplateDelegator.generate("result", jniMethod.cppReturnType).toString()»;
        «ENDIF»
      }

      «ENDFOR»
      }
      '''
  }
}
