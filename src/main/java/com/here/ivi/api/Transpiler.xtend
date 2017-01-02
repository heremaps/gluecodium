package com.here.ivi.api

import org.eclipse.emf.common.util.URI
import com.google.inject.Inject
import com.google.inject.Injector

import java.io.File

import org.franca.core.dsl.FrancaPersistenceManager
import org.franca.core.dsl.FrancaIDLStandaloneSetup

class Transpiler {

  def static void main(String[] args) {
    Transpiler.execute(args)
  }

  // Dependency injector used to provide the franca instances
  protected static Injector injector

  def static void execute(String[] args) {
    println("...starting up...")
    // setup the dependency injector
    injector = new FrancaIDLStandaloneSetup().createInjectorAndDoEMFRegistration()

    // create the configured instance
    val instance = injector.getInstance(Transpiler)
    instance.tryReadingFidl()
  }

  @Inject
  private FrancaPersistenceManager loader

  def tryReadingFidl() {
    println("...tryReadingFidl...")

    val filename = new File('fidl/com/here/navigation/Runtime.fidl').getAbsoluteFile().toString()

    val root = URI.createURI("classpath:/")
    val loc = URI.createFileURI(filename)

    println("Using root: " + root)
    println("Using uri: " + loc)
    println("Using loader: " + loader)

    val fmodel = loader.loadModel(loc, root)

    println("Loaded fmodel: " + fmodel)

    for (iface : fmodel.interfaces) {
      println("Found interface:  " + iface.name)
      println("Generated: \n" + LegacyGenerator.generateInterface(iface))
    }

    println("Done.")
  }
}
