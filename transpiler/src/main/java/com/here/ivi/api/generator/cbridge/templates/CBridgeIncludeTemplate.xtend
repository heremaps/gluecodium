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

package com.here.ivi.api.generator.cbridge.templates

import com.here.ivi.api.model.common.Include

class CBridgeIncludeTemplate {

  static def generate(Include incl)
  '''«IF incl.fileName === null»
  // Unknown or unresolved include «incl»«ELSE»«IF incl.isSystem»
  #include <«incl.fileName»>«ELSE»
  #include "«incl.fileName»"«ENDIF»«ENDIF»'''
}
