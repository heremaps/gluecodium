package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.CppStubSpec;

import java.io.File;

import static com.here.ivi.api.generator.common.CppElements.HEADER_FILE_SUFFIX;

public class CppStubHelpers {
    public static String[] modifyPackageNames(String[] _unused) {
        return new String[]{"legacy"};
    }

    public static File buildTargetFileName(String[] packageDesc,
                                    FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc) {
        return new File(String.join("/", packageDesc) + "/" + tc.getName() + HEADER_FILE_SUFFIX);
    }
}
