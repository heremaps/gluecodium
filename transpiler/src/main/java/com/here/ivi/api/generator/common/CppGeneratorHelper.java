package com.here.ivi.api.generator.common;


import com.here.ivi.api.generator.legacy.templates.LegacyAssignOp;
import com.here.ivi.api.generator.legacy.templates.LegacyCopyCtor;
import com.here.ivi.api.generator.legacy.templates.LegacyCtor;
import com.here.ivi.api.generator.legacy.templates.LegacyDtor;
import com.here.ivi.api.generator.common.templates.GeneratorNoticeTemplate;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.*;

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

        String inputDefinition =  element.getName() + ':' + element.getVersion();
        return GeneratorNoticeTemplate.generate(suite, inputDefinition, inputFile, outputTarget);
    }

    public static CppMethod generateDtor(String className){
        CppMethod dtor = new CppMethod();
        dtor.name = "~" + className;
        dtor.mbt = new LegacyDtor();
        dtor.returnType = "";
        dtor.specifiers.add("virtual");
        return dtor;
    }

    public static CppMethod generateEmptyCtor(String className){
        CppMethod ctor = new CppMethod();
        ctor.mbt = new LegacyCtor();
        ctor.name = className;
        ctor.returnType = "";
        return ctor;
    }

    public static CppMethod generateCopyCtor(String className){
        CppMethod ctor = new CppMethod();
        ctor.mbt = new LegacyCopyCtor();
        ctor.name = className;
        ctor.returnType = "";
        ctor.inParameters.add(generateClassParam(className));
        return ctor;
    }

    public static CppMethod generateAssignOp(String className){
        CppMethod ctor = new CppMethod();
        ctor.mbt = new LegacyAssignOp();
        ctor.name = "operator=";
        ctor.returnType = className + "&"; //TODO ugly ref here...
        ctor.inParameters.add(generateClassParam(className));
        return ctor;
    }

    private static CppParameter generateClassParam(String className) {
        CppParameter other = new CppParameter();
        other.name = "other";
        other.type = new CppType(null, className, CppElements.TypeInfo.Complex);
        other.mode = CppParameter.Mode.Input;
        return other;
    }

    public static CppNamespace packageToNamespace(String[] packages) {
        CppNamespace lastNs = null;
        for (String p : packages) {
            lastNs = new CppNamespace(p, lastNs);
        }

        if (lastNs != null) {
            return lastNs;
        }

        return new CppNamespace();
    }
}