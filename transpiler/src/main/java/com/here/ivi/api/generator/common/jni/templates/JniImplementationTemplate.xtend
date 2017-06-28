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

import java.util.List;
import com.here.ivi.api.model.common.Includes
import com.here.ivi.api.generator.common.jni.JniTypeConverter
import com.here.ivi.api.generator.common.java.templates.JavaCopyrightHeaderTemplate
import com.here.ivi.api.model.javamodel.JavaClass

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

      «FOR method : javaClass.methods»
      extern "C" «JniTypeConverter.map(method.returnType).name»
      «JniFunctionSignatureTemplate.generate(javaClass, method)»
      {
          //TODO
      }
      «ENDFOR»
      '''
  }
}
