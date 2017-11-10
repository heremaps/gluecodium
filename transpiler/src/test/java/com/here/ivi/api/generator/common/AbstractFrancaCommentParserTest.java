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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.test.ArrayEList;
import org.franca.core.franca.FAnnotation;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FAnnotationType;
import org.franca.core.franca.FModelElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;

@RunWith(JUnit4.class)
public class AbstractFrancaCommentParserTest {

  private static final String ANNOTATION_COMMENT = "Quick brown box";
  private static final String SECOND_ANNOTATION_COMMENT = "jumps over the lazy bog";
  private static final String CONCATENATED_ANNOTATION_COMMENT =
      ANNOTATION_COMMENT + SECOND_ANNOTATION_COMMENT;

  @Mock(answer = Answers.CALLS_REAL_METHODS)
  private TestableFrancaCommentParser commentParser;

  @Mock private CommentFormatter formatter;
  @Mock private FModelElement element;
  @Mock private FAnnotationBlock annotationBlock;
  @Mock private FAnnotation annotation;
  @Mock private FAnnotation secondAnnotation;

  @Spy private final ArrayEList<FAnnotation> annotationList = new ArrayEList<>();

  private abstract static class TestableFrancaCommentParser
      extends AbstractFrancaCommentParser<AbstractFrancaCommentParser.Comments> {

    TestableFrancaCommentParser() {
      super((FModelElement) null, null);
    }
  }

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    commentParser.setCommentFormatter(formatter);
    commentParser.setFrancaElement(element);
    commentParser.setComments(new AbstractFrancaCommentParser.Comments());

    when(formatter.formatComment(anyString()))
        .thenAnswer(invocation -> invocation.getArguments()[0]);

    when(element.getComment()).thenReturn(annotationBlock);
    when(annotationBlock.getElements()).thenReturn(annotationList);

    when(annotation.getComment()).thenReturn(ANNOTATION_COMMENT);
    when(secondAnnotation.getComment()).thenReturn(SECOND_ANNOTATION_COMMENT);
  }

  @Test
  public void parseCommentBlockWithNullComment() {
    when(element.getComment()).thenReturn(null);

    boolean result = commentParser.parseCommentBlock();

    assertFalse(result);
    assertEquals("", commentParser.getComments().mainBodyText);
    assertEquals("", commentParser.getComments().deprecatedText);
    verify(element).getComment();
  }

  @Test
  public void parseCommentBlockWithEmptyComment() {
    boolean result = commentParser.parseCommentBlock();

    assertTrue(result);
    assertEquals("", commentParser.getComments().mainBodyText);
    assertEquals("", commentParser.getComments().deprecatedText);
    verify(element.getComment()).getElements();
  }

  @Test
  public void parseCommentBlockWithOneIrrelevantType() {
    annotationList.add(annotation);
    when(annotation.getType()).thenReturn(FAnnotationType.EXPERIMENTAL);

    boolean result = commentParser.parseCommentBlock();

    assertTrue(result);
    assertEquals("", commentParser.getComments().mainBodyText);
    assertEquals("", commentParser.getComments().deprecatedText);
    verify(annotationList).iterator();
    verify(annotation, never()).getComment();
  }

  @Test
  public void parseCommentBlockWithOneDescription() {
    annotationList.add(annotation);
    when(annotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);

    commentParser.parseCommentBlock();

    assertEquals(ANNOTATION_COMMENT, commentParser.getComments().mainBodyText);
    assertEquals("", commentParser.getComments().deprecatedText);
    verify(annotation).getComment();
  }

  @Test
  public void parseCommentBlockWithOneDeprecated() {
    annotationList.add(annotation);
    when(annotation.getType()).thenReturn(FAnnotationType.DEPRECATED);

    commentParser.parseCommentBlock();

    assertEquals("", commentParser.getComments().mainBodyText);
    assertEquals(ANNOTATION_COMMENT, commentParser.getComments().deprecatedText);
    verify(annotation).getComment();
  }

  @Test
  public void parseCommentBlockWithTwoDescriptions() {
    annotationList.add(annotation);
    annotationList.add(secondAnnotation);
    when(annotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);
    when(secondAnnotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);

    commentParser.parseCommentBlock();

    assertEquals(CONCATENATED_ANNOTATION_COMMENT, commentParser.getComments().mainBodyText);
    assertEquals("", commentParser.getComments().deprecatedText);
  }

  @Test
  public void parseCommentBlockWithTwoDeprecated() {
    annotationList.add(annotation);
    annotationList.add(secondAnnotation);
    when(annotation.getType()).thenReturn(FAnnotationType.DEPRECATED);
    when(secondAnnotation.getType()).thenReturn(FAnnotationType.DEPRECATED);

    commentParser.parseCommentBlock();

    assertEquals("", commentParser.getComments().mainBodyText);
    assertEquals(CONCATENATED_ANNOTATION_COMMENT, commentParser.getComments().deprecatedText);
  }

  @Test
  public void parseCommentBlockWithOneEach() {
    FAnnotation thirdAnnotation = mock(FAnnotation.class);
    annotationList.add(annotation);
    annotationList.add(secondAnnotation);
    annotationList.add(thirdAnnotation);
    when(annotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);
    when(secondAnnotation.getType()).thenReturn(FAnnotationType.DEPRECATED);
    when(thirdAnnotation.getType()).thenReturn(FAnnotationType.EXPERIMENTAL);

    commentParser.parseCommentBlock();

    assertEquals(ANNOTATION_COMMENT, commentParser.getComments().mainBodyText);
    assertEquals(SECOND_ANNOTATION_COMMENT, commentParser.getComments().deprecatedText);
    verify(thirdAnnotation, never()).getComment();
  }
}
