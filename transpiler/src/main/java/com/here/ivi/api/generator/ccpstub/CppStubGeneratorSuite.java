package com.here.ivi.api.generator.ccpstub;

import com.here.ivi.api.generator.GeneratedFile;
import com.here.ivi.api.generator.GeneratorSuite;
import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.CppStubSpec;

import java.util.Collections;
import java.util.List;

public class CppStubGeneratorSuite
        implements GeneratorSuite<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor>
{
    @Override
    public List<GeneratedFile> generate(
            FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> model) {
        return Collections.emptyList();
    }
}
