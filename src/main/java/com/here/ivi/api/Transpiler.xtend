package com.here.ivi.api

import org.eclipse.emf.common.util.URI
import javax.inject.Inject
import org.franca.core.dsl.FrancaPersistenceManager

class Transpiler {

  @Inject
  FrancaPersistenceManager loader

  def doStuff() {
    println("Hello Burn")

    val filename = '/Users/hhinrich/Work/api-transpiler/externals/franca/tests/org.franca.connectors.idl.tests/testcases/model/TestInterface.fidl'
    val root = URI.createURI("classpath:/")
    val loc = URI.createFileURI(filename)
    val fmodel = loader.loadModel(loc, root)


  }

  def static void main(String[] args) {

    val tp = new Transpiler()
    tp.doStuff()
  }
}
