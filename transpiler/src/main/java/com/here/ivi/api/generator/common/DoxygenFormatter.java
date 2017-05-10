package com.here.ivi.api.generator.common;

import com.google.common.base.Strings;
import org.franca.core.franca.*;

import java.util.regex.Pattern;

final public class DoxygenFormatter implements ICommentFormatter {
    public DoxygenFormatter(String generator) {
        doxygenTagsToKeep =
            Pattern.compile("\\$\\{(?<tag>\\w*)(:" + generator + ")*?}(?<comment>.+?)\\$\\{/\\w*}",
                    Pattern.DOTALL);
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
        String res = commentBody
                .replaceAll("\n\\s+", "\n* ")
                .replaceAll("\n\n", "\n*\n");
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
    public String readCleanedErrorComment(FMethod m) {
        FAnnotationBlock errorComment = m.getErrorComment();
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

        for (FAnnotation annotation: comment.getElements()) {
            // skip all types but description
            if (annotation.getType() == FAnnotationType.DESCRIPTION) {
                return annotation.getComment();
            }
        }

        // TODO warn about missing documentation
        return "";
    }

    /**
     * This needs to be overwritten by each generator if they need to keep some doxygen Comments:
     * for example it needs to be set to:
     * Pattern.compile("\\$\\{(?<tag>\\w*)(:legacy)*?\\}(?<comment>.+?)\\$\\{/\\w*\\}", Pattern.DOTALL);
     * in the legacy generator in order to keep any tags meant only for the legacy generator
     */
    final private Pattern doxygenTagsToKeep;

    /**
     * Match any {fullword}Doxygen comment{/fullword} from the fidl @description tags.
     * This matches both ${tag} and ${tag:<generator_specific>}.
     */
    final static private Pattern doxygenTagsToRemove =
        Pattern.compile(" *\\$\\{\\w*:\\w*}.*\\$\\{/\\w*} *", Pattern.DOTALL);
}
