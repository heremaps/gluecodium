/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.franca;

import java.util.stream.Collectors;
import org.franca.core.franca.FAnnotation;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FAnnotationType;
import org.franca.core.franca.FModelElement;

public final class CommentHelper {

  public static String getDescription(final FModelElement francaElement) {
    FAnnotationBlock annotationBlock = francaElement.getComment();
    if (annotationBlock == null) {
      return "";
    }

    return annotationBlock
        .getElements()
        .stream()
        .filter(annotation -> annotation.getType() == FAnnotationType.DESCRIPTION)
        .map(FAnnotation::getComment)
        .collect(Collectors.joining("\\n"));
  }
}
