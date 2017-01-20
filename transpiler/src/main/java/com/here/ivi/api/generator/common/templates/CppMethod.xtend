package com.here.ivi.api.generator.common.templates

import org.franca.core.franca.FMethod
import org.franca.core.franca.FAnnotation
import org.franca.core.franca.FAnnotationType

import java.util.ArrayList

public class CppMethod {
    static class MethodDefinition {
        new(FMethod m) {
            input = m
                if (input.getComment() !== null) {
                    for (FAnnotation fa : input.getComment().getElements()) {
                        if (fa.getType() === FAnnotationType.DESCRIPTION ||
                            fa.getType() === FAnnotationType.AUTHOR) {
                            comment += "\n* " + fa.getRawText()
                        }
                    }
                }
        }

        public val FMethod input
        public var name = ""
        public var comment = ""
        public var returnValue = ""
        public var specifiers = new ArrayList<CharSequence>
        public var arguments = new ArrayList<CharSequence>
        public var qualifiers = new ArrayList<CharSequence>
    }

    def static signature(MethodDefinition it) '''
      /**
       * «comment»
       */
      «specifiers.join(' ')» «returnValue» «name»(  «arguments.join(', ')» )«qualifiers.join(' ')»;
    '''

    def static signature(MethodDefinition it, String className)'''
      «returnValue» «className»::«name»(  «arguments.join(', ')» )«qualifiers.join(' ')»
    '''
}
