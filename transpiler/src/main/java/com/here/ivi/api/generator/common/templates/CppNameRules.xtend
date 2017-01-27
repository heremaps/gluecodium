package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.FrancaModel
import com.here.navigation.CppStubSpec

interface CppNameRules {
  def String className(String base)
  def String methodName(String base)
  def String argumentName(String base)
  def String constantName(String base)
  def String enumName(String base)
  def String fieldName(String base)
  def String structName(String base)
  def String typedefName(String base)
  def String[] packageName(String[] packages)
  def String headerFileSuffix()
  def String typeCollectionTarget(String[] packageDesc,
        FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> tc)
}