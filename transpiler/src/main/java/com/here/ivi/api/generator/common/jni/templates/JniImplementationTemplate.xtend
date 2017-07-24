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
import com.here.ivi.api.generator.common.jni.JniToCppTypeConversionTemplateDelegator
import com.here.ivi.api.generator.common.jni.CppToJniConversionTemplateDelegator
import com.here.ivi.api.generator.common.jni.JniModel
import com.here.ivi.api.model.cppmodel.CppPrimitiveType

public class JniImplementationTemplate {
  def static generate(JniModel jniModel) {
    if (jniModel === null || jniModel.includes.isEmpty()) {
      return ""
    }
    return
     '''
      «JavaCopyrightHeaderTemplate.generate()»

      «FOR include : jniModel.includes»
      #include "«include.fileName»"
      «ENDFOR»

      extern "C" {

      «FOR jniMethod : jniModel.methods»
      «JniTypeNameMapper.map(jniMethod.javaReturnType)»
      «JniFunctionSignatureTemplate.generate(jniMethod)»
      {
        «FOR parameter : jniMethod.parameters»
          «parameter.cppType.name» «parameter.name»;
          «JniToCppTypeConversionTemplateDelegator.generate(parameter.javaType,getParameterName(parameter.name), parameter.name)»;
        «ENDFOR»
        «jniMethod.cppReturnType.name» result = «TemplateEngine.render("jni/CppMethodCall", jniMethod)»
        return «CppToJniConversionTemplateDelegator.generate("result", jniMethod.cppReturnType).toString()»;
      }

      «ENDFOR»
      }
      '''
  }
}
