/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.validator;

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

/** Use Franca's built-in Xtext validation module to validate all input fidl and fdepl files. */
public final class FrancaResourcesValidator {

  private static final Logger LOGGER = Logger.getLogger(FrancaResourcesValidator.class.getName());

  private FrancaResourcesValidator() {}

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
