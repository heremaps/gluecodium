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

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

import java.util.Arrays;
import java.util.Collections;
import java.util.regex.Pattern;
import org.eclipse.emf.common.util.EList;
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

@RunWith(JUnit4.class)
public class AbstractFrancaCommentParserTest {

  private abstract static class TestableFrancaCommentParser
      extends AbstractFrancaCommentParser<AbstractFrancaCommentParser.Comments> {

    public TestableFrancaCommentParser() {
      super((FModelElement) null, null);
    }
  }

  private static final String ANNOTATION_COMMENT = "Quick brown box";
  private static final String SECOND_ANNOTATION_COMMENT = "jumps over the lazy bog";
  private static final String CONCATENATED_ANNOTATION_COMMENT =
      ANNOTATION_COMMENT + SECOND_ANNOTATION_COMMENT;
  private static final Pattern MATCH_ALL = Pattern.compile("(.*)");

  @Mock(answer = Answers.CALLS_REAL_METHODS)
  private TestableFrancaCommentParser commentParser;

  @Mock private CommentFormatter formatter;
  @Mock private FModelElement element;
  @Mock private FAnnotationBlock annotationBlock;
  @Mock private EList<FAnnotation> annotationList;
  @Mock private FAnnotation annotation;
  @Mock private FAnnotation secondAnnotation;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    TestableFrancaCommentParser.fidlCommentsToKeep = MATCH_ALL;
    commentParser.commentFormatter = formatter;
    commentParser.francaElement = element;
    commentParser.comments = new AbstractFrancaCommentParser.Comments();

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
    assertNull(commentParser.comments.mainBodyText);
    assertNull(commentParser.comments.deprecatedText);
    verify(element).getComment();
  }

  @Test
  public void parseCommentBlockWithEmptyComment() {
    when(annotationList.iterator()).thenReturn(Collections.<FAnnotation>emptyList().iterator());

    boolean result = commentParser.parseCommentBlock();

    assertTrue(result);
    assertEquals("", commentParser.comments.mainBodyText);
    assertEquals("", commentParser.comments.deprecatedText);
    verify(element.getComment()).getElements();
  }

  @Test
  public void parseCommentBlockWithOneIrrelevantType() {
    when(annotationList.iterator()).thenReturn(Collections.singletonList(annotation).iterator());
    when(annotation.getType()).thenReturn(FAnnotationType.EXPERIMENTAL);

    boolean result = commentParser.parseCommentBlock();

    assertTrue(result);
    assertEquals("", commentParser.comments.mainBodyText);
    assertEquals("", commentParser.comments.deprecatedText);
    verify(annotationList).iterator();
    verify(annotation, never()).getComment();
  }

  @Test
  public void parseCommentBlockWithOneDescription() {
    when(annotationList.iterator()).thenReturn(Collections.singletonList(annotation).iterator());
    when(annotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);

    commentParser.parseCommentBlock();

    assertEquals(ANNOTATION_COMMENT, commentParser.comments.mainBodyText);
    assertEquals("", commentParser.comments.deprecatedText);
    verify(annotation).getComment();
  }

  @Test
  public void parseCommentBlockWithOneDeprecated() {
    when(annotationList.iterator()).thenReturn(Collections.singletonList(annotation).iterator());
    when(annotation.getType()).thenReturn(FAnnotationType.DEPRECATED);

    commentParser.parseCommentBlock();

    assertEquals("", commentParser.comments.mainBodyText);
    assertEquals(ANNOTATION_COMMENT, commentParser.comments.deprecatedText);
    verify(annotation).getComment();
  }

  @Test
  public void parseCommentBlockWithTwoDescriptions() {
    when(annotationList.iterator())
        .thenReturn(Arrays.asList(annotation, secondAnnotation).iterator());
    when(annotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);
    when(secondAnnotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);

    commentParser.parseCommentBlock();

    assertEquals(CONCATENATED_ANNOTATION_COMMENT, commentParser.comments.mainBodyText);
    assertEquals("", commentParser.comments.deprecatedText);
  }

  @Test
  public void parseCommentBlockWithTwoDeprecateds() {
    when(annotationList.iterator())
        .thenReturn(Arrays.asList(annotation, secondAnnotation).iterator());
    when(annotation.getType()).thenReturn(FAnnotationType.DEPRECATED);
    when(secondAnnotation.getType()).thenReturn(FAnnotationType.DEPRECATED);

    commentParser.parseCommentBlock();

    assertEquals("", commentParser.comments.mainBodyText);
    assertEquals(CONCATENATED_ANNOTATION_COMMENT, commentParser.comments.deprecatedText);
  }

  @Test
  public void parseCommentBlockWithOneEach() {
    FAnnotation thirdAnnotation = mock(FAnnotation.class);

    when(annotationList.iterator())
        .thenReturn(Arrays.asList(annotation, secondAnnotation, thirdAnnotation).iterator());
    when(annotation.getType()).thenReturn(FAnnotationType.DESCRIPTION);
    when(secondAnnotation.getType()).thenReturn(FAnnotationType.DEPRECATED);
    when(thirdAnnotation.getType()).thenReturn(FAnnotationType.EXPERIMENTAL);

    commentParser.parseCommentBlock();

    assertEquals(ANNOTATION_COMMENT, commentParser.comments.mainBodyText);
    assertEquals(SECOND_ANNOTATION_COMMENT, commentParser.comments.deprecatedText);
    verify(thirdAnnotation, never()).getComment();
  }
}
