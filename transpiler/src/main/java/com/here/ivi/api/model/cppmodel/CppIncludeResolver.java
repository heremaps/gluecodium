package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Includes;
import navigation.CppStubSpec;

import java.util.Objects;
import java.util.Optional;
import java.util.logging.Logger;
import java.util.stream.Collectors;

public class CppIncludeResolver {

    static Logger logger = java.util.logging.Logger.getLogger(CppIncludeResolver.class.getName());

    private FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
                        ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel;
    private CppNameRules nameRules;
    private String outputFile;

    public CppIncludeResolver(FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
                                          ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel,
                              FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> forType,
                              CppNameRules nameRules) {
        this.rootModel = rootModel;
        this.nameRules = nameRules;

        String[] packageDesc = nameRules.packageName(forType.getPackage());
        this.outputFile = nameRules.typeCollectionTarget(packageDesc, forType);
    }

    public CppIncludeResolver(FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
                                          ? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel,
                              FrancaModel.Interface<? extends CppStubSpec.InterfacePropertyAccessor> forType,
                              CppNameRules nameRules) {
        this.rootModel = rootModel;
        this.nameRules = nameRules;

        String[] packageDesc = nameRules.packageName(forType.getPackage());
        this.outputFile = nameRules.interfaceTarget(packageDesc, forType);
    }

    public void resolveLazyIncludes(CppElement root) {
        root.streamRecursive()
                .filter(p -> p instanceof CppType)
                .map(CppType.class::cast)
                .forEach(this::resolveLazyIncludes);
    }

    private void resolveLazyIncludes(CppType type) {
        type.includes = type.includes.stream().map(i -> {
            if (i instanceof Includes.LazyInternalInclude) {

                Includes.LazyInternalInclude li = (Includes.LazyInternalInclude)i;

                Optional<? extends FrancaModel.FrancaElement> externalDefinitionOpt = rootModel.find(li.model, li.tc);
                if (!externalDefinitionOpt.isPresent()) {
                    logger.severe("Could not resolve type collection include " + li);
                    return null;
                }

                FrancaModel.FrancaElement externalDefinition = externalDefinitionOpt.get();
                String[] externalPackage = nameRules.packageName(externalDefinition.getPackage());

                String includeName;
                if (externalDefinition instanceof FrancaModel.TypeCollection<?>) {
                    includeName = nameRules.typeCollectionTarget(externalPackage,
                            (FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor>) externalDefinition);
                } else {
                    includeName = nameRules.interfaceTarget(externalPackage,
                            (FrancaModel.Interface<? extends CppStubSpec.InterfacePropertyAccessor>) externalDefinition);
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
