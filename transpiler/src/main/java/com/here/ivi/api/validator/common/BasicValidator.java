package com.here.ivi.api.validator.common;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.xtext.resource.XtextResource;
import org.eclipse.xtext.util.CancelIndicator;
import org.eclipse.xtext.validation.CheckMode;
import org.eclipse.xtext.validation.IResourceValidator;
import org.eclipse.xtext.validation.Issue;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BasicValidator {

    static Logger logger = Logger.getLogger(BasicValidator.class.getName());

    public static boolean validate(ResourceSet resourceSet, Collection<File> currentFiles) {
        boolean result = true;
        for (File file : currentFiles) {
            Resource resource = resourceSet.getResource(URI.createFileURI(file.getAbsolutePath()), true);
            // Validate the Franca deployment model
            IResourceValidator fModelValidator = ((XtextResource) resource).getResourceServiceProvider().getResourceValidator();
            List<Issue> issues = fModelValidator.validate(resource, CheckMode.ALL, CancelIndicator.NullImpl);

            if (!issues.isEmpty()) {
                logger.log(Level.SEVERE, "Validation Failed");
                for (Issue i : issues ){
                    logger.log(Level.SEVERE, i.getUriToProblem().toString()+ ":" + String.valueOf(i.getLineNumber()
                        + " " + i.getSeverity().toString() +" " + i.getMessage()));
                }
                result = false;
            }
        }
        return result;
    }
}
