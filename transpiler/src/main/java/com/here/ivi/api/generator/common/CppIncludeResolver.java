package com.here.ivi.api.generator.common;

import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.CppStubSpec;

import java.util.stream.Collectors;

public class CppIncludeResolver {

    private FrancaModel<?, ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel;
    private FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> forType;
    private CppNameRules nameRules;
    private String[] packageDesc;
    private String outputFile;

    public CppIncludeResolver(FrancaModel<?, ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel,
                              FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> forType,
                              CppNameRules nameRules) {
        this.rootModel = rootModel;
        this.forType = forType;
        this.nameRules = nameRules;

        this.packageDesc = nameRules.packageName(forType.getPackage());
        this.outputFile = nameRules.typeCollectionTarget(packageDesc, forType);
    }

    public void resolveLazyIncludes(CppElements.CppElement root) {
        // TODO change to visitor?
        if (root instanceof CppElements.CppNamespace) {
            CppElements.CppNamespace ns = ((CppElements.CppNamespace) root);
            for ( CppElements.CppElement m : ns.members ) {
                resolveLazyIncludes(m);
            }
        } else if (root instanceof CppElements.CppStruct) {
            CppElements.CppStruct struct = ((CppElements.CppStruct) root);
            for ( CppElements.CppField f : struct.fields ) {
                resolveLazyIncludes(f.type);
            }
        } else if (root instanceof CppElements.CppConstant) {
            CppElements.CppConstant constant = (CppElements.CppConstant) root;
            resolveLazyIncludes(constant.type);
        }
        // TODO go through classes, and methods
    }

    private void resolveLazyIncludes(CppElements.CppType type) {
        type.includes = type.includes.stream().map(i -> {
            if (i instanceof CppElements.SystemInclude) {
                return i;
            } else if (i instanceof CppElements.LazyInternalInclude) {

                CppElements.LazyInternalInclude li = (CppElements.LazyInternalInclude)i;

                FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> externalTc =
                        rootModel.find(li.model, li.tc);

                if (externalTc == null) {
                    System.err.println("Could not resolve type collection include " + li);
                    return null; // TODO handle invalid include in some way
                }

                String[] externalPackage = nameRules.packageName(externalTc.getPackage());
                String includeName = nameRules.typeCollectionTarget(externalPackage, externalTc);

                // TODO think about relative include path resolution and stuff
                return new CppElements.InternalPublicInclude(includeName);
            }

            return null;
        }).collect(Collectors.toSet());
    }
}
