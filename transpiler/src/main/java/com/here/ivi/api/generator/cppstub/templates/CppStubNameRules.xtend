package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.generator.common.templates.CppNameRules
import com.here.ivi.api.generator.common.NameHelper
import com.here.ivi.api.model.FrancaModel
import com.here.navigation.CppStubSpec
import java.io.File

class CppStubNameRules implements CppNameRules {

  override String className(String base)  '''
  «base»'''

  override String methodName(String base) '''
  «NameHelper.toSnakeCase(base)»'''

  override String argumentName(String base) '''
  «NameHelper.toSnakeCase(base)»'''

  override String constantName(String base) '''
  «NameHelper.toSnakeCase(base)»'''

  override String enumName(String base) '''
  «base»'''

  override String fieldName(String base) '''
  «NameHelper.toSnakeCase(base)»'''

  override String structName(String base) '''
  «base»'''

  override String typedefName(String base) '''
  «base»'''

  override String[] packageName(String[] packages) {
    return #["legacy"];
  }
  override String headerFileSuffix() {
    '.h'
  }
  override String typeCollectionTarget(
          String[] packageDesc, FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> tc) {
    String.join(File.separator, packageDesc) + File.separator + tc.getName() + headerFileSuffix();
  }
}