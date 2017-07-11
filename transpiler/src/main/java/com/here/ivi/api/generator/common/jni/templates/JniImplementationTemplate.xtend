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
import com.here.ivi.api.generator.common.jni.JniModelBuilder
import com.here.ivi.api.generator.common.jni.JniTypeNameMapper
import com.here.ivi.api.model.common.Includes
import com.here.ivi.api.model.cppmodel.CppClass
import com.here.ivi.api.model.javamodel.JavaClass
import com.here.ivi.api.model.javamodel.JavaMethod
import java.util.List

public class JniImplementationTemplate {
  def static generate(JavaClass javaClass, CppClass cppClass, List<JniModelBuilder.ElementPair> methodPairs, List<Includes.InternalPublicInclude> includes) {
    if (javaClass === null || cppClass === null || includes === null || includes.isEmpty() ) {
      return ""
    }
    return
      '''
      «JavaCopyrightHeaderTemplate.generate()»

      «FOR include : includes»
      #include "«include.file»"
      «ENDFOR»

      extern "C" {

      «FOR methodPair : methodPairs»
      «val method = methodPair.javaElement as JavaMethod»
      «JniTypeNameMapper.map(method.returnType)»
      «JniFunctionSignatureTemplate.generate(javaClass, method)»
      {
          «IF javaClass.name.equals("HelloWorld")»
          const std::string cpp_string(here::internal::convert_jstring_to_std_string(env, jinputString));
          return here::internal::convert_std_string_to_jstring(env, hello::HelloWorldStub::helloWorldMethod(cpp_string));
          «ELSEIF !javaClass.name.contains("Test")»
          return 0;
          «ENDIF»
      }

      «ENDFOR»
      }
      '''
  }
}
