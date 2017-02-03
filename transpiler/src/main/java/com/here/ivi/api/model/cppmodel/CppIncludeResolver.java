package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Includes;
import com.here.navigation.CppStubSpec;

import java.util.Objects;
import java.util.stream.Collectors;

public class CppIncludeResolver {

    private FrancaModel<?, ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel;
    private CppNameRules nameRules;
    private String outputFile;

    public CppIncludeResolver(FrancaModel<?, ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel,
                              FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> forType,
                              CppNameRules nameRules) {
        this.rootModel = rootModel;
        this.nameRules = nameRules;

        String[] packageDesc = nameRules.packageName(forType.getPackage());
        this.outputFile = nameRules.typeCollectionTarget(packageDesc, forType);
    }

    public void resolveLazyIncludes(CppElement root) {
        root.streamRecursive()
                .filter(p -> p instanceof CppType)
                .map(CppType.class::cast)
                .forEach(this::resolveLazyIncludes);
    }

    private void resolveLazyIncludes(CppType type) {
        type.includes = type.includes.stream().map(i -> {
            if (i instanceof Includes.SystemInclude) {
                return i;
            } else if (i instanceof Includes.LazyInternalInclude) {

                Includes.LazyInternalInclude li = (Includes.LazyInternalInclude)i;

                FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> externalTc =
                        rootModel.find(li.model, li.tc);

                if (externalTc == null) {
                    System.err.println("Could not resolve type collection include " + li);
                    return null;
                }

                String[] externalPackage = nameRules.packageName(externalTc.getPackage());
                String includeName = nameRules.typeCollectionTarget(externalPackage, externalTc);

                // no self includes needed
                if (includeName.equals(outputFile)) {
                    return null;
                }

                // TODO think about relative include path resolution and stuff
                return new Includes.InternalPublicInclude(includeName);
            }

            return null;
        }).filter(Objects::nonNull).collect(Collectors.toSet());
    }
}
