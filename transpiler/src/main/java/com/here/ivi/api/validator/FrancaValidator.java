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

package com.here.ivi.api.validator;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.xtext.resource.XtextResource;
import org.eclipse.xtext.util.CancelIndicator;
import org.eclipse.xtext.validation.CheckMode;
import org.eclipse.xtext.validation.IResourceValidator;
import org.eclipse.xtext.validation.Issue;

/** Use Francas builtin Xtext validation module to validate all input fidl and fdepl files. */
public final class FrancaValidator {

  private static final Logger LOGGER = Logger.getLogger(FrancaValidator.class.getName());

  private FrancaValidator() {}

  public static boolean validate(final ResourceSet resourceSet, final Collection<File> files) {
    if (files.isEmpty()) {
      LOGGER.severe("No input to generate from found. Aborting.");
      return false;
    }

    boolean result = true;

    for (File file : files) {
      Resource resource = resourceSet.getResource(URI.createFileURI(file.getAbsolutePath()), true);

      if (!resource.getErrors().isEmpty()) {
        LOGGER.severe("Parsing " + resource.getURI() + " failed");
        for (Resource.Diagnostic e : resource.getErrors()) {
          LOGGER.severe(resource.getURI() + ":" + e.getLine() + " " + e.getMessage());
        }
        result = false;
        continue;
      }

      // Validate the Franca deployment model
      IResourceValidator fModelValidator =
          ((XtextResource) resource).getResourceServiceProvider().getResourceValidator();
      List<Issue> issues =
          fModelValidator.validate(resource, CheckMode.ALL, CancelIndicator.NullImpl);

      if (!issues.isEmpty()) {
        LOGGER.severe("Validating " + resource.getURI() + " failed");
        for (Issue i : issues) {
          LOGGER.severe(
              i.getUriToProblem().toString()
                  + ":"
                  + i.getLineNumber()
                  + " "
                  + i.getSeverity().toString()
                  + " "
                  + i.getMessage());
        }
        result = false;
      }
    }

    return result;
  }
}
