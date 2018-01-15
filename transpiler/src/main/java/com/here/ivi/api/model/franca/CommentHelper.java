/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.franca;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import org.franca.core.franca.FAnnotation;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FAnnotationType;
import org.franca.core.franca.FModelElement;

public final class CommentHelper {

  public static String getDescription(final FModelElement francaElement) {
    return String.join(" ", getAnnotations(francaElement, FAnnotationType.DESCRIPTION));
  }

  private static List<String> getAnnotations(
      final FModelElement francaElement, final FAnnotationType annotationType) {

    FAnnotationBlock annotationBlock = francaElement.getComment();
    return annotationBlock != null
        ? annotationBlock
            .getElements()
            .stream()
            .filter(annotation -> annotation.getType() == annotationType)
            .map(FAnnotation::getComment)
            .collect(Collectors.toList())
        : Collections.emptyList();
  }
}
