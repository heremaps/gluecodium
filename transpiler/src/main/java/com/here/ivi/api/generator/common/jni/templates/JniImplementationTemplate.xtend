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
import com.here.ivi.api.model.common.Includes
import com.here.ivi.api.model.javamodel.JavaClass
import java.util.List

public class JniImplementationTemplate {
  def static generate(JavaClass javaClass, List<Includes.InternalPublicInclude> includes) {
    if (javaClass === null || includes === null || includes.isEmpty()) {
      return ""
    }

    return
      '''
      «JavaCopyrightHeaderTemplate.generate()»

      «FOR include : includes»
      #include "«include.file»"
      «ENDFOR»

      extern "C" {

      «FOR method : javaClass.methods»
      «JniTypeNameMapper.map(method.returnType)»
      «JniFunctionSignatureTemplate.generate(javaClass, method)»
      {
          «IF !javaClass.name.contains("Test")»
          const std::string cpp_string(here::internal::convert_jstring_to_std_string(env, jinputString));
          return here::internal::convert_std_string_to_jstring(env, hello::HelloWorldStub::helloWorldMethod(cpp_string));
          «ENDIF»
      }

      «ENDFOR»
      }
      '''
  }
}
