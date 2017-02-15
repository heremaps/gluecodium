package com.here.ivi.api.generator.common;

import org.franca.core.franca.FAnnotationBlock;

public interface ICommentFormatter {
    public enum ParameterType {
        Input,
        Output,
        ReturnValue
    };
    abstract public String addParameter(FAnnotationBlock parameterComment, String name, ParameterType type);
    abstract public String formatTag(String tag, String text);
    abstract public String formatBody(String CommentBody);
}
