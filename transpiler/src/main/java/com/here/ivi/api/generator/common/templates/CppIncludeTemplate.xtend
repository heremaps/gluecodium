package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.Includes

class CppIncludeTemplate {

  // TODO group includes
  static def generate(Includes.Include incl) '''
    «
    switch (incl) {
      Includes.SystemInclude : '''#include <«incl.file»>'''
      Includes.InternalPublicInclude : '''#include <«incl.file»>'''
      default: '''// Unknown or unresolved include «incl» of «incl.class»'''
    }
    »'''
}