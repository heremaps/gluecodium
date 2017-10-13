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

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import org.franca.core.franca.FAnnotation;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FAnnotationType;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;

public abstract class AbstractFrancaCommentParser<T extends AbstractFrancaCommentParser.Comments> {

  // Everything below needs to be accessible by any class extending this one
  private final FTypeCollectionParser parser;

  @SuppressWarnings({"PMD.ImmutableField"})
  @Getter(AccessLevel.PROTECTED)
  @Setter(AccessLevel.PROTECTED)
  private FModelElement francaElement;

  @Getter(AccessLevel.PROTECTED)
  @Setter(AccessLevel.PROTECTED)
  private T comments;

  @SuppressWarnings({"PMD.ImmutableField"})
  @Getter(AccessLevel.PROTECTED)
  @Setter(AccessLevel.PROTECTED)
  private CommentFormatter commentFormatter;

  public static class Comments {

    public String mainBodyText = "";
    public String deprecatedText = "";

    public String getMainBodyText() {
      return mainBodyText;
    }
  }

  public AbstractFrancaCommentParser(final FMethod method, CommentFormatter formatter) {
    this.francaElement = method;
    this.parser = this::parseMethodDocumentation;
    this.commentFormatter = formatter;
  }

  public AbstractFrancaCommentParser(final FBroadcast broadcast, CommentFormatter formatter) {
    this.francaElement = broadcast;
    this.parser = this::parseBroadcastDocumentation;
    this.commentFormatter = formatter;
  }

  public AbstractFrancaCommentParser(final FAttribute attribute, CommentFormatter formatter) {
    this.francaElement = attribute;
    this.parser = this::parseAttributeDocumentation;
    this.commentFormatter = formatter;
  }

  public AbstractFrancaCommentParser(final FModelElement elem, CommentFormatter formatter) {
    this.francaElement = elem;
    this.parser = this::parseInterfaceDocumentation;
    this.commentFormatter = formatter;
  }

  @FunctionalInterface
  private interface FTypeCollectionParser {
    void parse();
  }

  /* TODO: This needs to inform the caller in the case there is no annotationBlock.
   * An exception is probably a better idea.
   */
  protected boolean parseCommentBlock() {
    // This returns the annotation block (all fidl @<tag>: fields ) for the broadcast.
    FAnnotationBlock annotationBlock = francaElement.getComment();
    if (annotationBlock == null) {
      return false;
    }

    /* There are 14 tags in Franca. From them only two are relevant for the doxygen
     * documentation: @description: and @deprecated: */
    StringBuilder descriptionBuilder = new StringBuilder();
    StringBuilder deprecatedBuilder = new StringBuilder();
    for (FAnnotation annotation : annotationBlock.getElements()) {
      switch (annotation.getType().getValue()) {
        case FAnnotationType.DESCRIPTION_VALUE:
          descriptionBuilder.append(annotation.getComment());
          break;
        case FAnnotationType.DEPRECATED_VALUE:
          deprecatedBuilder.append(annotation.getComment());
          break;
        default:
          break;
      }
    }

    comments.mainBodyText = descriptionBuilder.toString();
    comments.deprecatedText = deprecatedBuilder.toString();

    return true;
  }

  /* Call the "strategy" relevant to which FModelElement this is processing and
   * T will be the comment structure that is relevant to every generator implementing classes
   * that extend this.
   */
  public T parse() {
    parser.parse();
    return comments;
  }

  // generator specific methods. Every extending class needs to implement them
  protected abstract void parseMethodDocumentation();

  protected abstract void parseAttributeDocumentation();

  protected abstract void parseBroadcastDocumentation();

  protected abstract void parseInterfaceDocumentation();
}
