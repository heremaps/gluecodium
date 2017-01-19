package com.here.ivi.api.generator.common.templates

import java.time.Year

import org.eclipse.xtend2.lib.StringConcatenation

class CppFileTemplate {
  static def generate(Object generatorNotice, Object content) '''
    // -------------------------------------------------------------------------------------------------
    //
    // Copyright (C) «Year.now().getValue()» HERE Global B.V. and/or its affiliated companies. All rights reserved.
    //
    // This software, including documentation, is protected by copyright controlled by
    // HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
    // adapting or translating, any or all of this material requires the prior written
    // consent of HERE Global B.V. This material also contains confidential information,
    // which may not be disclosed to others without prior written consent of HERE Global B.V.
    //
    // -------------------------------------------------------------------------------------------------

    «generatorNotice»

    «content»
  '''
}