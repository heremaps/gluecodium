package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.generator.common.templates.CppMethodTemplate
import com.here.ivi.api.model.cppmodel.CppMethod
import org.franca.core.franca.FBroadcast
import com.here.ivi.api.generator.common.NameHelper

class NotifierTypeTemplate {
  public static def String generateName(FBroadcast b) '''
  «NameHelper.toUpperCamel(b.getName())»«b.getSelector»Notifier'''

  public static def String generateNotifier(FBroadcast b) '''
  m_«NameHelper.toLowerCamel(b.getName())»«b.getSelector»Notifier'''

  public static def String generateType(CppMethod m) '''
  std::function< «CppMethodTemplate.pureSignature(m)» >'''
}