package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.common.templates.CppFileTemplate;
import com.here.ivi.api.generator.common.templates.CppNamespaceTemplate;
import com.here.ivi.api.generator.common.templates.GeneratorNotice;
import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.CppStubSpec;

import java.io.File;
import java.io.IOException;
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


    @Override
    public List<GeneratedFile> generate(
            FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> model) {

        // every interface gets its own file
        //   ? without struct tag it is mapped to class, to a struct otherwise
        // generate one file for each type collection, containing all the typedefs, enums, etc.

        return model.typeCollections.parallelStream()
                .map(this::generate)
                .collect(Collectors.toList());
    }

    public GeneratedFile generate(FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc) {

        String[] packageDesc = CppStubHelpers.modifyPackageNames(tc.getPackage());
        CppElements.CppNamespace packageNs = CppElements.packageToNamespace(packageDesc);

        CppElements.CppNamespace ns = new CppElements.CppNamespace(tc.getName());
        packageNs.subNs.add(ns);

        File fileName = CppStubHelpers.buildTargetFileName(packageDesc, tc);
        String inputFile;
        try {
            inputFile = getTool().resolveRelativeToRootPath(tc.model.getPath());
        } catch (IOException e) {
            inputFile = "Could not resolve";
        }

        Object innerContent = CppNamespaceTemplate.generate(packageNs);
        Object generatorNotice = GeneratorNotice.generate(this, inputFile, fileName.getPath());

        String fileContent = CppFileTemplate.generate(generatorNotice, innerContent).toString();

        return new GeneratedFile(fileContent, fileName);
    }

}
