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
        // TODO change to visitor?
        if (root instanceof CppNamespace) {
            CppNamespace ns = ((CppNamespace) root);
            for ( CppElement m : ns.members ) {
                resolveLazyIncludes(m);
            }
        } else if (root instanceof CppStruct) {
            CppStruct struct = ((CppStruct) root);
            for ( CppField f : struct.fields ) {
                resolveLazyIncludes(f.type);
            }
        } else if (root instanceof CppClass) {
            CppClass clazz = ((CppClass) root);
            for ( CppMethod m: clazz.methods ) {
                resolveLazyIncludes(m);
            }
        } else if (root instanceof CppConstant) {
            CppConstant constant = (CppConstant) root;
            resolveLazyIncludes(constant.type);
        } else if (root instanceof CppTypeDef) {
            CppTypeDef td = (CppTypeDef) root;
            resolveLazyIncludes(td.targetType);
        } else if (root instanceof CppMethod) {
            CppMethod method = (CppMethod) root;
            for ( CppParameter p : method.inParameters ) {
                resolveLazyIncludes(p.type);
            }
            for ( CppParameter p : method.outParameters ) {
                resolveLazyIncludes(p.type);
            }
        }
        // TODO go through classes, and methods
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
