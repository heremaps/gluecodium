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
import com.here.ivi.api.generator.common.jni.JniParameter
import com.here.ivi.api.model.javamodel.JavaPrimitiveType
import com.here.ivi.api.model.javamodel.JavaReferenceType
import com.here.ivi.api.model.javamodel.JavaCustomType
import com.here.ivi.api.generator.common.jni.JniNameRules

public class JniImplementationTemplate {

  //TODO: this needs to be removed just a temporary fix!!!
  def static boolean isStructType(JniParameter jniParameter){
    //at the moment, custom is only used for structs ...
    return jniParameter.javaType instanceof JavaCustomType
  }

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
      #include "«JniNameRules.getConversionHeaderFileName()»"

      extern "C" {

      «FOR jniMethod : jniModel.methods»
      «JniTypeNameMapper.map(jniMethod.javaReturnType)»
      «JniFunctionSignatureTemplate.generate(jniMethod)»
      {
        «FOR parameter : jniMethod.parameters»
          «IF isStructType(parameter)»
          «TemplateEngine.render("jni/FullyQualifiedCppName", jniMethod)»::«parameter.cppType.name» «parameter.name»;
          «ELSE»
          «parameter.cppType.name» «parameter.name»;
          «ENDIF»
          «JniToCppTypeConversionTemplateDelegator.generate(parameter.javaType,getParameterName(parameter.name), parameter.name)»;
        «ENDFOR»
        auto result = «TemplateEngine.render("jni/CppMethodCall", jniMethod)»
        return «CppToJniConversionTemplateDelegator.generate("result", jniMethod.cppReturnType).toString()»;
      }

      «ENDFOR»
      }
      '''
  }
}
