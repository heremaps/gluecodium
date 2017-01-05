package com.here.ivi.api

import org.eclipse.emf.common.util.URI
import com.google.inject.Inject
import com.google.inject.Injector

import java.io.File

import org.franca.deploymodel.dsl.FDeployPersistenceManager
import org.franca.deploymodel.dsl.FDeployStandaloneSetup
import org.franca.deploymodel.core.FDModelExtender
import org.franca.deploymodel.core.FDeployedProvider;

class Transpiler {

  def static void main(String[] args) {
    Transpiler.execute(args)
  }

  // Dependency injector used to provide the franca instances
  protected static Injector injector

  def static void execute(String[] args) {
    println("...starting up...")
    // setup the dependency injector
    injector = new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration()

    // create the configured instance
    val instance = injector.getInstance(Transpiler)
    instance.tryReadingFidl()
  }

  @Inject
  private FDeployPersistenceManager loader

  def tryReadingFidl() {
    println("...tryReadingFidl...")

    val filename = new File('../fidl/com/here/navigation/Runtime.fdepl').getAbsoluteFile().toString()

    val root = URI.createURI("classpath:/")
    val loc = URI.createFileURI(filename)

    println("Using root: " + root)
    println("Using uri: " + loc)
    println("Using loader: " + loader)

    val fdmodel = loader.loadModel(loc, root)

    println("Loaded fmodel: " + fdmodel)

    val fdmodelExt = new FDModelExtender(fdmodel)

    for (type : fdmodelExt.FDTypesList) {
      println("Found type:  " + type.target.name)
    }

    for (iface : fdmodelExt.FDInterfaces) {
      println("Found interface:  " + iface.target.name)

      var files = LegacyGenerator.generateFiles(iface)
      files.forEach[ file_name, content | println('''Generated «file_name»:

        «content»
      ''')]
    }

    println("Done.")
  }
}
