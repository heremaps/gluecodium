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

package com.here.ivi.api.generator.baseapi;

import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.generator.common.CommentFormatter;
import com.here.ivi.api.generator.common.DoxygenFormatter;
import java.util.Collection;
import org.franca.core.franca.*;

public class CppCommentParser
    extends AbstractFrancaCommentParser<AbstractFrancaCommentParser.Comments> {
  private static final String GENERATOR_NAME = "cpp";
  public static final DoxygenFormatter FORMATTER = new DoxygenFormatter(GENERATOR_NAME);

  public static AbstractFrancaCommentParser.Comments parse(FModelElement elem) {
    CppCommentParser parser = new CppCommentParser(elem);
    return parser.parse();
  }

  public static AbstractFrancaCommentParser.Comments parse(FAttribute attribute) {
    CppCommentParser parser = new CppCommentParser(attribute);
    return parser.parse();
  }

  public static AbstractFrancaCommentParser.Comments parse(FBroadcast broadcast) {
    CppCommentParser parser = new CppCommentParser(broadcast);
    return parser.parse();
  }

  public static AbstractFrancaCommentParser.Comments parse(FMethod method) {
    CppCommentParser parser = new CppCommentParser(method);
    return parser.parse();
  }

  public CppCommentParser(FMethod method) {
    super(method, FORMATTER);
    this.setComments(new AbstractFrancaCommentParser.Comments());
  }

  public CppCommentParser(FBroadcast broadcast) {
    super(broadcast, FORMATTER);
    this.setComments(new AbstractFrancaCommentParser.Comments());
  }

  public CppCommentParser(FAttribute attribute) {
    super(attribute, FORMATTER);
    this.setComments(new AbstractFrancaCommentParser.Comments());
  }

  public CppCommentParser(FModelElement elem) {
    super(elem, FORMATTER);
    this.setComments(new AbstractFrancaCommentParser.Comments());
  }

  @Override
  protected void parseMethodDocumentation() {
    if (!parseCommentBlock()) {
      // even though we have no main comment, still add arguments
      getComments().mainBodyText = "";
    }

    FMethod method = (FMethod) getFrancaElement();
    StringBuilder sb =
        generateParamDocumentation(
            getCommentFormatter(), method.getInArgs(), CommentFormatter.ParameterType.Input);
    getComments().mainBodyText += sb.toString();
  }

  public static StringBuilder generateParamDocumentation(
      CommentFormatter formatter,
      Collection<? extends FModelElement> args,
      CommentFormatter.ParameterType input) {
    StringBuilder sb = new StringBuilder();

    for (FModelElement parameter : args) {
      sb.append(
          formatter.formatParam(
              parameter.getComment(),
              parameter.getName(), // TODO apply namerules
              input));
    }
    return sb;
  }

  @Override
  protected void parseAttributeDocumentation() {
    parseCommentBlock();
  }

  @Override
  protected void parseBroadcastDocumentation() {
    parseCommentBlock();
  }

  @Override
  protected void parseInterfaceDocumentation() {
    parseCommentBlock();
  }
}
