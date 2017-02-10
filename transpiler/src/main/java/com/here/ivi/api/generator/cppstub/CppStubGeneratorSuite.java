package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.cppstub.templates.CppStubNameRules;
import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.CppStubSpec;

import java.util.List;
import java.util.stream.Collectors;

public class CppStubGeneratorSuite
        implements GeneratorSuite<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor>
{
    private final Transpiler tool;

    public CppStubGeneratorSuite(Transpiler tp) {
        this.tool = tp;
    }

    @Override
    public List<GeneratedFile> generate(
            FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> model) {

        // every interface gets its own file
        //   ? without struct tag it is mapped to class, to a struct otherwise
        // generate one file for each type collection, containing all the typedefs, enums, etc.

        CppStubNameRules rules = new CppStubNameRules();
        
        return model.typeCollections.parallelStream()
                .map(tc -> {
                    CppTypeCollectionGenerator generator = new CppTypeCollectionGenerator(this, model, rules, tc);
                    return generator.generate();
                }).collect(Collectors.toList());
    }

    @Override
    public Transpiler getTool() {
        return tool;
    }

    @Override
    public Version getVersion() {
        return new Version(0, 0, 1);
    }

    @Override
    public String getName() {
        return "com.here.CppStubGenerator";
    }

}
