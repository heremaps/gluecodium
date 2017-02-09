package com.here.ivi.api.generator.common;


import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.generator.common.templates.GeneratorNoticeTemplate;

import java.io.IOException;

public class CppGeneratorHelper{
    public static Object generateGeneratorNotice(GeneratorSuite<?,?> suite,
                                                 FrancaModel.FrancaElement element,
                                                 String outputTarget) {
        String inputFile;
        try {
            inputFile = suite.getTool().resolveRelativeToRootPath(element.getModel().getPath());
        } catch (IOException e) {
            inputFile = "Could not resolve";
            System.err.println("Could not resolve input file ");
        }
                                // TODO "TypeCollection or Interface " +
        String inputDefinition =  element.getName() + ':' + element.getVersion();
        return GeneratorNoticeTemplate.generate(suite, inputDefinition, inputFile, outputTarget);
    }
}