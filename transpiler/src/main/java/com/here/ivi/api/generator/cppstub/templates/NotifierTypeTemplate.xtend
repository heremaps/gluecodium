package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.generator.common.templates.CppMethodTemplate
import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.generator.common.NameHelper

class NotifierTypeTemplate {
  public static def String generateName(String name) '''
  «NameHelper.toUpperCamel(name)»Notifier'''

  public static def String generateNotifier(String name) '''
  m_«NameHelper.toLowerCamel(name)»Notifier'''

  public static def String generateType(CppMethod m) '''
  std::function< «CppMethodTemplate.pureSignature(m)» >'''
}