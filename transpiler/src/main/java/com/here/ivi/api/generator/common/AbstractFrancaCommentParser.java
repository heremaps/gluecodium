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

import java.util.regex.Matcher;
import java.util.regex.Pattern;
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

  protected FModelElement francaElement;

  protected T comments;
  protected CommentFormatter commentFormatter;

  /* Try to match comment encapsulated between {tag} and {/tag} blocks in the fidl @description
   * annotation blocks.
   *
   * Input strings for pattern matching include '\n' characters, ignored by default when '.' is
   * used in a regex. In order to be able to replace multi-line fidl tag blocks with
   * their equivalent doxygen tag (for example {see}Multi-line comment{/see} with @see Multi-line
   * comment) we need to add Pattern.DOTALL in the pattern.
   */
  protected static final Pattern FIDL_COMMENTS_TO_REMOVE =
      Pattern.compile("\\$\\{generator:\\w*}(.*)\\$\\{/generator}", Pattern.DOTALL);

  /* fidlCommentsToKeep should be a pattern similar to:
   * "\\$\\{generator:<concrete_generator>\\}(.*)\\$\\{/generator}"
   * where concrete_generator is the name of in the fidl file of comments that target a specific
   * target.
   *
   * For example in the fidl file there can be:
   * ${generator:legacy}Legacy specific comment${/generator}
   * ${generator:android}Android specific comment${/generator}
   * In this case if concrete_generator was "legacy" the generator file would keep the
   * "Legacy specific comment" and remove the "Android specific comment"
   *
   * As a result the actual pattern for this needs to be defined in the implementing class.
   */
  protected static Pattern fidlCommentsToKeep;

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
          String francaComment = annotation.getComment();

          if (fidlCommentsToKeep != null) {
            // Keep generator-specific comments
            Matcher matcher = fidlCommentsToKeep.matcher(francaComment);
            if (matcher.find()) {
              francaComment = matcher.replaceAll("$1");
            }
          }

          /* Remove comments specific to non-matching generators (anything between
           * ${generator:word} and ${/generator} where word is different than the actual
           * generator running.
           */
          Matcher matcher = FIDL_COMMENTS_TO_REMOVE.matcher(francaComment);
          francaComment = matcher.replaceAll("");

          descriptionBuilder.append(francaComment);
          break;
          //noinspection deprecation
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
