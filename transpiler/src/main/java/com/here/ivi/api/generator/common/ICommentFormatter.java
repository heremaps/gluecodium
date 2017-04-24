package com.here.ivi.api.generator.common;

import org.franca.core.franca.FAnnotationBlock;

public interface ICommentFormatter {
    enum ParameterType {
        Input,
        Output,
        ReturnValue
    }
    String formatParam(FAnnotationBlock parameterComment, String name, ParameterType type);
    String formatTag(String tag, String text);
    String formatComment(String CommentBody);
}
