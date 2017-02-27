package com.here.ivi.api.generator.common;

import org.franca.core.franca.FAnnotation;
import org.franca.core.franca.FAnnotationBlock;

import java.util.regex.Pattern;

import com.here.ivi.api.generator.common.ICommentFormatter;

final public class DoxygenFormatter implements ICommentFormatter {
    public DoxygenFormatter(String generator) {
        doxygenTagsToKeep =
            Pattern.compile("\\$\\{(?<tag>\\w*)(:" + generator + ")*?\\}(?<comment>.+?)\\$\\{/\\w*\\}",
                    Pattern.DOTALL);
    }
    @Override
    public String addParameter(FAnnotationBlock parameterComment, String name, ParameterType type)
    {
        if (parameterComment == null) {
            return "";
        }

        String direction = "in";
        if (type == ParameterType.Output) {
            direction = "out";
        }

        String param = "@param[" + direction + "] ";

        String res = "";
        for (FAnnotation c: parameterComment.getElements()) {
            res += "\n*" + formatTag(param + name + " ", c.getComment());
        }
        return res;
    }

    @Override
    public String formatTag(String tag, String text)
    {
        String formatted = "";
        String[] lines = text.split("\n");

        formatted = " " + tag + lines[0];
        for(int i=1; i<lines.length; i++) {
            formatted += "\n* " + tag.replaceAll(".", " ") + lines[i].trim();
        }
        return formatted;
    }

    @Override
    public String formatBody(String commentBody)
    {
        /* Drop Franca spaces and create proper C++/Doxygen comment alignment */
        String res = commentBody.replaceAll("\n +", "\n* ").replaceAll("\n\n", "\n*\n");
        res += "\n*";

        // keep all remaining ${doxygenTag}Text${/doxygenTag} and ${doxygenTag:<generator>} with @doxygenTag Text
        res = doxygenTagsToKeep.matcher(res).replaceAll("@${tag}${comment}");
        // and drop all ${doxygenTag:<other_generators>} tags
        res = doxygenTagsToRemove.matcher(res).replaceAll(" ");
        // remove also trailing whitespaces and return
        return res.replaceAll(" \n", "\n");
    }

    /* This needs to be overwritten by each generator if they need to keep some doxygen Comments:
     * for example it needs to be set to:
     * Pattern.compile("\\$\\{(?<tag>\\w*)(:legacy)*?\\}(?<comment>.+?)\\$\\{/\\w*\\}", Pattern.DOTALL);
     * in the legacy generator in order to keep any tags meant only for the legacy generator */
    final private Pattern doxygenTagsToKeep;
    /* Match any {fullword}Doxygen comment{/fullword} from the fidl @description tags.
     * This matches both ${tag} and ${tag:<generator_specific>}.
     */
    final static private Pattern doxygenTagsToRemove =
        Pattern.compile(" *\\$\\{\\w*:\\w*\\}.*\\$\\{/\\w*\\} *", Pattern.DOTALL);
}
