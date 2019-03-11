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

package com.here.genium.model.franca;

import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.FAnnotation;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FAnnotationType;
import org.franca.core.franca.FModelElement;

public final class CommentHelper {

  public static String getDescription(final FModelElement francaElement) {
    return getAnnotations(francaElement, FAnnotationType.DESCRIPTION)
        .flatMap(CommentHelper::splitLines)
        .collect(Collectors.joining(" "));
  }

  private static Stream<String> splitLines(String comment) {
    return Arrays.stream(comment.split("\\n")).filter(line -> !line.isEmpty()).map(String::trim);
  }

  private static Stream<String> getAnnotations(
      final FModelElement francaElement, final FAnnotationType annotationType) {
    FAnnotationBlock annotationBlock = francaElement.getComment();
    return annotationBlock != null
        ? annotationBlock
            .getElements()
            .stream()
            .filter(annotation -> annotation.getType() == annotationType)
            .map(FAnnotation::getComment)
        : Stream.empty();
  }
}
