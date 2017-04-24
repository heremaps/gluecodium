package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.generator.common.DoxygenFormatter;
import com.here.ivi.api.generator.common.ICommentFormatter;
import org.franca.core.franca.*;

import java.util.Collection;

public class StubCommentParser extends AbstractFrancaCommentParser<AbstractFrancaCommentParser.Comments> {

    final static private String GENERATOR_NAME = "stub";
    final static public DoxygenFormatter FORMATTER = new DoxygenFormatter(GENERATOR_NAME);

    public static AbstractFrancaCommentParser.Comments parse(FModelElement elem) {
        StubCommentParser parser = new StubCommentParser(elem);
        return parser.parse();
    }

    public static AbstractFrancaCommentParser.Comments parse(FAttribute attribute) {
        StubCommentParser parser = new StubCommentParser(attribute);
        return parser.parse();
    }

    public static AbstractFrancaCommentParser.Comments parse(FBroadcast broadcast) {
        StubCommentParser parser = new StubCommentParser(broadcast);
        return parser.parse();
    }

    public static AbstractFrancaCommentParser.Comments parse(FMethod method) {
        StubCommentParser parser = new StubCommentParser(method);
        return parser.parse();
    }

    public StubCommentParser(FMethod method) {
        super(method, FORMATTER);
        this.comments = new AbstractFrancaCommentParser.Comments();
    }

    public StubCommentParser(FBroadcast broadcast) {
        super(broadcast, FORMATTER);
        this.comments = new AbstractFrancaCommentParser.Comments();
    }

    public StubCommentParser(FAttribute attribute) {
        super(attribute, FORMATTER);
        this.comments = new AbstractFrancaCommentParser.Comments();
    }

    public StubCommentParser(FModelElement elem) {
        super(elem, FORMATTER);
        this.comments = new AbstractFrancaCommentParser.Comments();
    }

    @Override
    protected void parseMethodDocumentation() {
        if (!parseCommentBlock()) {
            // even though we have no main comment, still add arguments
            comments.mainBodyText = "";
        }

        FMethod method = (FMethod)francaElement;
        StringBuilder sb = generateParamDocumentation(commentFormatter,
                method.getInArgs(),
                ICommentFormatter.ParameterType.Input);
        comments.mainBodyText += sb.toString();
    }

    public static StringBuilder generateParamDocumentation(ICommentFormatter formatter,
                                                           Collection<? extends FModelElement> args,
                                                           ICommentFormatter.ParameterType input) {
        StringBuilder sb = new StringBuilder();

        for (FModelElement parameter : args) {
            sb.append(formatter.formatParam(
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
