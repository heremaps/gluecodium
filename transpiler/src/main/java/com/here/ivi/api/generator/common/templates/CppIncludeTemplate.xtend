package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppIncludeTemplate {

  // TODO group includes
  static def generate(CppElements.Include incl) '''
    «
    switch (incl) {
      CppElements.SystemInclude : '''#include <«incl.file»>'''
      CppElements.InternalPublicInclude : '''#include <«incl.file»>'''
      default: '''// Unknown or unresolved include «incl» of «incl.class»'''
    }
    »'''
}