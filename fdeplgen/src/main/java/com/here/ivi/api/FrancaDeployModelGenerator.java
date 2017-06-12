/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api;

import com.google.inject.Inject;
import com.google.inject.Provider;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.xtext.diagnostics.Severity;
import org.eclipse.xtext.generator.JavaIoFileSystemAccess;
import org.eclipse.xtext.resource.XtextResource;
import org.eclipse.xtext.util.CancelIndicator;
import org.eclipse.xtext.validation.CheckMode;
import org.eclipse.xtext.validation.IResourceValidator;
import org.eclipse.xtext.validation.Issue;
import org.franca.deploymodel.dsl.FDeployStandaloneSetup;
import org.franca.deploymodel.dsl.generator.FDeployGenerator;

public final class FrancaDeployModelGenerator {
  @Inject private Provider<ResourceSet> resourceSetProvider;

  @Inject private FDeployGenerator generator;

  @Inject private JavaIoFileSystemAccess fileSystemAccess;

  private FrancaDeployModelGenerator(final File outputDir) {
    new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration().injectMembers(this);

    // Create the output directory if required.
    if (!outputDir.exists()) {
      System.out.println("Creating output directory " + outputDir.getAbsolutePath());
      //noinspection ResultOfMethodCallIgnored
      outputDir.mkdirs();
    } else if (!outputDir.isDirectory()) {
      throw new IllegalArgumentException("Output directory already exists as a file!");
    }

    fileSystemAccess.setOutputPath(outputDir.getAbsolutePath());
  }

  private void generate(final File fdeplFile) {
    // Sanity checks
    if (!fdeplFile.exists()) {
      throw new IllegalArgumentException("Input file not found: " + fdeplFile);
    }

    System.out.println("Generating Franca deployment accessors for " + fdeplFile + ".");

    // Load the Franca deployment model
    ResourceSet resourceSet = resourceSetProvider.get();
    Resource fdeplResource =
        resourceSet.getResource(URI.createFileURI(fdeplFile.getAbsolutePath()), true);

    // Validate the Franca deployment model
    IResourceValidator fModelValidator =
        ((XtextResource) fdeplResource).getResourceServiceProvider().getResourceValidator();

    List<Issue> issues =
        fModelValidator.validate(fdeplResource, CheckMode.ALL, CancelIndicator.NullImpl);

    boolean hasErrors = false;
    StringBuilder errorString = new StringBuilder();
    for (Issue issue : issues) {
      if (issue.getSeverity() == Severity.ERROR) {
        errorString.append(issue.toString());
        hasErrors = true;
      }
      System.out.print(issue.toString());
    }

    // Abort the build on validation errors.
    if (hasErrors) {
      System.out.println("Has errors: " + errorString.toString());
      return;
    }

    // Generate the Franca deployment accessor classes.
    System.out.println("Generating deployment accessors for " + fdeplFile.getAbsolutePath());
    generator.doGenerate(fdeplResource, fileSystemAccess);
  }

  public static void main(final String[] args) {
    List<File> files = new ArrayList<>();
    for (String arg : args) {
      files.add(new File(arg));
    }
    File outputDir = files.remove(0);

    FrancaDeployModelGenerator generator = new FrancaDeployModelGenerator(outputDir);
    for (File fdeplFile : files) {
      generator.generate(fdeplFile);
    }
  }
}
