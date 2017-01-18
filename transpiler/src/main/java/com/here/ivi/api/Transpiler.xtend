package com.here.ivi.api

import org.eclipse.emf.common.util.URI
import com.google.inject.Inject
import com.google.inject.Injector

import java.io.File
import java.util.List

import org.franca.core.dsl.FrancaIDLStandaloneSetup;
import org.franca.deploymodel.dsl.FDeployStandaloneSetup


class Transpiler {

  def static void main(String[] args) {
    Transpiler.execute(args)
  }

  def static void execute(String[] args) {
    println("...starting up...")

    // setup the dependency injector
    val fdeplInjector = new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration()
    val fidlInjector = new FrancaIDLStandaloneSetup().createInjectorAndDoEMFRegistration()

    val fml = new FrancaModelLoader()
    fdeplInjector.injectMembers(fml)
    fidlInjector.injectMembers(fml)

    val models = fml.load("../fidl/");

    // create the configured instance
    val transpiler = new Transpiler()
    transpiler.generate(models)
  }

  def generate(List<FrancaModel> models) {

    for (model : models) {
      for(iface : model.interfaces) {
        println("Found interface:  " + iface.fInterface.name)

        var files = LegacyGenerator.generateFiles(iface)
        files.forEach[ file_name, content | println('''Generated «file_name»:

        «content»
      ''')]
      }
    }

    println("Done.")
  }
}
