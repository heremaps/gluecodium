package com.here.tools;

import com.google.inject.Inject
import com.google.inject.Provider
import java.io.File
import java.util.List
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.xtext.diagnostics.Severity
import org.eclipse.xtext.generator.JavaIoFileSystemAccess
import org.eclipse.xtext.resource.XtextResource
import org.eclipse.xtext.util.CancelIndicator
import org.eclipse.xtext.validation.CheckMode
import org.eclipse.xtext.validation.Issue
import org.franca.deploymodel.dsl.FDeployStandaloneSetup
import org.franca.deploymodel.dsl.generator.FDeployGenerator

public class FrancaDeploymodelGenerator {

  @Inject
  private Provider<ResourceSet> resourceSetProvider

  @Inject
  private FDeployGenerator generator

  @Inject
  private JavaIoFileSystemAccess fileSystemAccess

  def void init(File outputDirectory) {
    // Create the output directory if required.
    if (!outputDirectory.exists()) {
      println("Creating output directory " + outputDirectory.getAbsolutePath());
      outputDirectory.mkdirs();
    }

    new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration().injectMembers(this);
  }

  def void generate(List<File> fdeplFiles, File outputDirectory) {
    println("Generating Franca deployment accessors for " + fdeplFiles.size() + " files.");
    for (File fdepl: fdeplFiles) {
      generate(fdepl, outputDirectory);
    }
  }

  def void generate(File fdepl, File outputDirectory) {

    if (!fdepl.exists()) {
      throw new Exception('''Input file not found: «fdepl»''');
    }

    if (!outputDirectory.exists()) {
      throw new Exception('''Output folder not found: «outputDirectory»''');
    }

    println("Generating Franca deployment accessors for " + fdepl + ".");

    // Load the Franca deployment model
    val resourceSet = resourceSetProvider.get();
    val fdeplResource = resourceSet.getResource(URI.createFileURI(fdepl.getAbsolutePath()), true);

    // Validate the Franca deployment model
    val fModelValidator = (fdeplResource as XtextResource).getResourceServiceProvider().getResourceValidator()

    val issues = fModelValidator.validate(fdeplResource, CheckMode.ALL, CancelIndicator.NullImpl)

    var hasErrors = false;
    var errorString = new StringBuilder();
    for (Issue issue : issues) {
      if (issue.getSeverity() == Severity.ERROR) {
        errorString.append(issue.toString());
        hasErrors = true;
      }
      println(issue.toString());
    }

    // Abort the build on validation errors.
    if (hasErrors) {
      throw new Exception(errorString.toString());
    }

    // Generate the Franca deployment accessor classes.
    println("Generating deployment accessors for " + fdepl.getAbsolutePath());
    fileSystemAccess.setOutputPath(outputDirectory.getAbsolutePath());
    generator.doGenerate(fdeplResource, fileSystemAccess);
  }


  def static void main(String[] args) {
    val fdg = new FrancaDeploymodelGenerator()
    fdg.init(new File(args.get(1)))
    fdg.generate(new File(args.get(0)), new File(args.get(1)))
  }
}
