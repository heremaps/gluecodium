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

package com.here.ivi.api.generator.common;

import com.google.common.base.Strings;
import java.util.regex.Pattern;
import org.franca.core.franca.*;

public final class DoxygenFormatter implements CommentFormatter {
  public DoxygenFormatter(String generator) {
    doxygenTagsToKeep =
        Pattern.compile(
            "\\$\\{(?<tag>\\w*)(:" + generator + ")*?}(?<comment>.+?)\\$\\{/\\w*}", Pattern.DOTALL);
  }

  @Override
  public String formatParam(FAnnotationBlock parameterComment, String name, ParameterType type) {
    if (parameterComment == null) {
      return "";
    }

    String direction = "in";
    if (type == ParameterType.Output) {
      direction = "out";
    }
    // TODO handle ParameterType.Return

    return formatWithTag("@param[" + direction + "] " + name, parameterComment);
  }

  @Override
  public String formatTag(String tag, String text) {
    String[] lines = text.split("\n");

    StringBuilder formatted = new StringBuilder();
    formatted.append("\n* ").append(tag).append(' ').append(lines[0]);

    String indent = Strings.padEnd("", tag.length() + 1, ' ');
    for (int i = 1; i < lines.length; i++) {
      String content = lines[i].trim();
      formatted.append("\n* ").append(indent).append(content);
    }
    return formatted.toString();
  }

  @Override
  public String formatComment(String commentBody) {
    // Drop Franca spaces and create proper C++/Doxygen comment alignment
    String res = commentBody.replaceAll("\n\\s+", "\n* ").replaceAll("\n\n", "\n*\n");
    res += "\n*";
    return cleanUpFrancaComment(res);
  }

  public String formatWithTag(String tag, FModelElement element) {
    FAnnotationBlock comment = element.getComment();
    if (comment == null) {
      // TODO warn about missing documentation
      return "";
    }

    return formatWithTag(tag, comment);
  }

  private String formatWithTag(String tag, FAnnotationBlock comment) {
    return formatTag(tag, cleanUpFrancaComment(readDescription(comment)));
  }

  // TODO move to cppstubcommentparsethingie
  public String readCleanedErrorComment(FMethod method) {
    FAnnotationBlock errorComment = method.getErrorComment();
    if (errorComment != null) {
      return cleanUpFrancaComment(readDescription(errorComment));
    }

    // TODO warn about missing documentation
    return "";
  }

  // TODO move to cppstubcommentparsethingie
  public String readCleanedComment(FModelElement element) {
    FAnnotationBlock comment = element.getComment();
    if (comment == null) {
      // TODO warn about missing documentation
      return "";
    }

    return cleanUpFrancaComment(readDescription(comment));
  }

  private String cleanUpFrancaComment(String comment) {
    // keep all remaining ${doxygenTag}Text${/doxygenTag} and ${doxygenTag:<generator>} with @doxygenTag Text
    String result = doxygenTagsToKeep.matcher(comment).replaceAll("@${tag}${comment}");
    // and drop all ${doxygenTag:<other_generators>} tags
    result = doxygenTagsToRemove.matcher(result).replaceAll(" ");

    // remove also trailing whitespaces and return
    return result.replaceAll("\\s+\n", "\n").trim();
  }

  public String readDescription(FAnnotationBlock comment) {

    for (FAnnotation annotation : comment.getElements()) {
      // skip all types but description
      if (annotation.getType() == FAnnotationType.DESCRIPTION) {
        return annotation.getComment();
      }
    }

    // TODO warn about missing documentation
    return "";
  }

  /**
   * This needs to be overwritten by each generator if they need to keep some doxygen Comments: for
   * example it needs to be set to:
   * Pattern.compile("\\$\\{(?<tag>\\w*)(:legacy)*?\\}(?<comment>.+?)\\$\\{/\\w*\\}",
   * Pattern.DOTALL); in the legacy generator in order to keep any tags meant only for the legacy
   * generator
   */
  private final Pattern doxygenTagsToKeep;

  /**
   * Match any {fullword}Doxygen comment{/fullword} from the fidl @description tags. This matches
   * both ${tag} and ${tag:<generator_specific>}.
   */
  private static final Pattern doxygenTagsToRemove =
      Pattern.compile(" *\\$\\{\\w*:\\w*}.*\\$\\{/\\w*} *", Pattern.DOTALL);
}
