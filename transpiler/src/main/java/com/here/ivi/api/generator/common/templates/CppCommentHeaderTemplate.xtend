package com.here.ivi.api.generator.common.templates

class CppCommentHeaderTemplate {
  static def generate(Object generatorNotice, Object content) '''
    // -------------------------------------------------------------------------------------------------
    //
    «FOR line : CopyrightNotice.generate.toString.split(System.lineSeparator())»
    // «line»
    «ENDFOR»
    //
    // -------------------------------------------------------------------------------------------------
    //
    «FOR line : generatorNotice.toString().split(System.lineSeparator())»
    // «line»
    «ENDFOR»
    //
    // -------------------------------------------------------------------------------------------------

    «content»
  '''
}
