package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.*;
import navigation.CppStubSpec;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.logging.Logger;
import java.util.stream.Collectors;

public class CppIncludeResolver {

    static Logger logger = java.util.logging.Logger.getLogger(CppIncludeResolver.class.getName());

    private FrancaModel<?, ?> rootModel;
    private CppNameRules nameRules;
    private String outputFile;

    public CppIncludeResolver(FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
                                          ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel,
                              TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> forType,
                              CppNameRules nameRules) {
        this.rootModel = rootModel;
        this.nameRules = nameRules;

        List<String> directories = nameRules.packageToDirectoryStructure(forType.getPackage());
        this.outputFile = nameRules.typeCollectionTarget(directories, forType);
    }

    public CppIncludeResolver(FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
                                          ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel,
                              Interface<? extends CppStubSpec.InterfacePropertyAccessor> forType,
                              CppNameRules nameRules) {
        this.rootModel = rootModel;
        this.nameRules = nameRules;

        List<String> directories = nameRules.packageToDirectoryStructure(forType.getPackage());
        this.outputFile = nameRules.interfaceTarget(directories, forType);
    }

    public void resolveLazyIncludes(CppElement root) {
        root.streamRecursive()
                .filter(p -> p instanceof CppElementWithIncludes)
                .map(CppElementWithIncludes.class::cast)
                .forEach(this::resolveLazyIncludes);
    }

    private void resolveLazyIncludes(CppElementWithIncludes type) {
        type.includes = type.includes.stream().map(i -> {
            if (i instanceof Includes.LazyInternalInclude) {

                Includes.LazyInternalInclude li = (Includes.LazyInternalInclude)i;

                Optional<? extends FrancaElement> externalDefinitionOpt = rootModel.find(li.model, li.tc);
                if (!externalDefinitionOpt.isPresent()) {
                    logger.severe("Could not resolve type collection include " + li);
                    return null;
                }

                FrancaElement externalDefinition = externalDefinitionOpt.get();
                List<String> externalDirectories = nameRules.packageToDirectoryStructure(externalDefinition.getPackage());

                String includeName;
                if (externalDefinition instanceof TypeCollection<?>) {
                    includeName = nameRules.typeCollectionTarget(externalDirectories,
                            (TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor>) externalDefinition);
                } else {
                    includeName = nameRules.interfaceTarget(externalDirectories,
                            (Interface<? extends CppStubSpec.InterfacePropertyAccessor>) externalDefinition);
                }

                // no self includes needed
                if (includeName.equals(outputFile)) {
                    return null;
                }

                // TODO think about relative include path resolution and stuff
                return new Includes.InternalPublicInclude(includeName);
            }

            return i;
        }).filter(Objects::nonNull).collect(Collectors.toSet());
    }
}
