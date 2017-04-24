package com.here.ivi.api.generator.common;

import com.here.ivi.api.generator.common.ICommentFormatter;

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
    public class Comments {
        public String getMainBodyText() {
            return mainBodyText;
        }
        public String getDeprecatedText() {
            return deprecatedText;
        }

        public String mainBodyText = null;
        public String deprecatedText = null;
    }

    public AbstractFrancaCommentParser(final FMethod method, ICommentFormatter formatter) {
        this.francaElement = method;
        this.parser = this::parseMethodDocumentation;
        this.commentFormatter = formatter;
    }

    public AbstractFrancaCommentParser(final FBroadcast broadcast, ICommentFormatter formatter) {
        this.francaElement = broadcast;
        this.parser = this::parseBroadcastDocumentation;
        this.commentFormatter = formatter;
    }

    public AbstractFrancaCommentParser(final FAttribute attribute, ICommentFormatter formatter) {
        this.francaElement = attribute;
        this.parser = this::parseAttributeDocumentation;
        this.commentFormatter = formatter;
    }

    public AbstractFrancaCommentParser(final FModelElement elem, ICommentFormatter formatter) {
        this.francaElement = elem;
        this.parser = this::parseInterfaceDocumentation;
        this.commentFormatter = formatter;
    }


    @FunctionalInterface
    protected interface FTYpeCollectionParser {
        void parse();
    }

    @FunctionalInterface
    protected interface GeneratorSpecificPattern {
        String match(String fidlText);
    }

    protected GeneratorSpecificPattern generatorSpecificPattern = null;

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
        StringBuilder sb = new StringBuilder();
        for (FAnnotation annotation: annotationBlock.getElements()) {
            switch (annotation.getType().getValue()) {
                case FAnnotationType.DESCRIPTION_VALUE:
                    String franca_comment = annotation.getComment();

                    if (fidlCommentsToKeep != null) {
                        // Keep generator specifc comments
                        Matcher matcher = fidlCommentsToKeep.matcher(franca_comment);
                        if (matcher.find()) {
                            franca_comment = matcher.replaceAll("$1");
                        }
                    }

                    /* Remove comments specific to non-matching generators (anything between
                     * ${generator:word} and ${/generator} where word is different than the actual
                     * generator running.
                     */
                    Matcher matcher = fidlCommentsToRemove.matcher(franca_comment);
                    franca_comment = matcher.replaceAll("");

                    // If any class implementing an AbstractFrancaCommentParser needs to match some
                    // specific tags in the fidls they need to create to assign the method doing
                    // the dirty job in generatorSpecificPattern.
                    if (generatorSpecificPattern != null) {
                        franca_comment = generatorSpecificPattern.match(franca_comment);
                    }
                    sb.append(commentFormatter.formatBody(franca_comment));
                    break;
                case FAnnotationType.DEPRECATED_VALUE:
                    comments.deprecatedText = annotation.getComment();
                    break;
                default:
                    break;
            }
        }
        comments.mainBodyText = sb.toString();
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
    abstract protected void parseMethodDocumentation();
    abstract protected void parseAttributeDocumentation();
    abstract protected void parseBroadcastDocumentation();
    abstract protected void parseInterfaceDocumentation();

    // Everything below needs to be accessible by any class extending this one
    protected FTYpeCollectionParser parser;

    protected FModelElement francaElement;

    protected T comments;
    protected ICommentFormatter commentFormatter;

    /* Try to match comment encapsulated between {tag} and {/tag} blocks in the fidl @description
     * annotation blocks.
     * Input strings for pattern matching include '\n' characters, ignored by default when '.' is
     * used in a regex. In order to be able to replace multi-line fidl tag blocks with
     * their equivalent doxygen tag (for example {see}Multi-line comment{/see} with @see Multi-line
     * comment) we need to add Pattern.DOTALL in the pattern.
     */
    final protected static Pattern fidlCommentsToRemove = Pattern.compile(
            "\\$\\{generator:\\w*}(.*)\\$\\{/generator}", Pattern.DOTALL);

    /* fidlCommentsToKeep should be a pattern similar to:
     * "\\$\\{generator:<concrete_generator>\\}(.*)\\$\\{/generator}"
     * where concrete_generator is the name of in the fidl file of comments that target a specific target.
     * For example in the fidl file there can be:
     * ${generator:legacy}Legacy specific comment${/generator}
     * ${generator:android}Android specific comment${/generator}
     * In this case if concrete_generator was "legacy" the generator file would keep the "Legacy specific comment"
     * and remove the "Android specific comment"
     * As a result the actual pattern for this needs to be defined in the implementing class.
     */
    protected static Pattern fidlCommentsToKeep;

}
