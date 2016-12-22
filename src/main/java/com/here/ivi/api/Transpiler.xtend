package com.here.ivi.api

import org.eclipse.emf.common.util.URI
import com.google.inject.Inject
import com.google.inject.Injector

import org.franca.core.dsl.FrancaPersistenceManager
import org.franca.core.dsl.FrancaIDLStandaloneSetup

class Transpiler {

  protected static Injector injector

  def protected static void execute(String[] args) {
    injector = new FrancaIDLStandaloneSetup().createInjectorAndDoEMFRegistration()
    val instance = injector.getInstance(Transpiler)
    instance.doStuff()
  }

  @Inject
  private FrancaPersistenceManager loader

  def doStuff() {
    println("Hello Burn")

    val filename = '/Users/hhinrich/Work/api-transpiler/externals/franca/tests/org.franca.connectors.idl.tests/testcases/model/TestInterface.fidl'
    val root = URI.createURI("classpath:/")
    val loc = URI.createFileURI(filename)

    println("Hello Burn2")

    val fmodel = loader.loadModel(loc, root)

    println("Hello Burn2")

    val api = fmodel.interfaces.get(0)
    println("hello " + api.name)
    println("Hello Burn")
  }

  def static void main(String[] args) {
    Transpiler.execute(args)
  }
}
