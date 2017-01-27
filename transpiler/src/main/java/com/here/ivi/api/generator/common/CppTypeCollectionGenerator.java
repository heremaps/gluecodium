package com.here.ivi.api.generator.common;

import com.here.ivi.api.generator.common.templates.CppFileTemplate;
import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.generator.common.templates.CppNamespaceTemplate;
import com.here.ivi.api.generator.common.templates.GeneratorNoticeTemplate;
import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.io.IOException;

public class CppTypeCollectionGenerator {

    public CppTypeCollectionGenerator(CppNameRules rules) {
        this.nameRules = rules;
    }

    public static Object generateGeneratorNotice( GeneratorSuite<?,?> suite,
                                            FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc,
                                            String outputTarget) {
        String inputFile;
        try {
            inputFile = suite.getTool().resolveRelativeToRootPath(tc.model.getPath());
        } catch (IOException e) {
            inputFile = "Could not resolve";
        }
        String inputDefinition = "TypeCollection " + tc.fTypeCollection.getName() + ':' + Version.create(tc.fTypeCollection.getVersion());
        return GeneratorNoticeTemplate.generate(suite, inputDefinition, inputFile, outputTarget);
    }

    public GeneratedFile generate( GeneratorSuite<?,?> suite,
                                   FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc) {
        CppElements.CppNamespace model = generateCppModel(tc);

        String[] packageDesc = nameRules.packageName(tc.getPackage());
        String outputFile = nameRules.typeCollectionTarget(packageDesc, tc);
        Object generatorNotice = CppTypeCollectionGenerator.generateGeneratorNotice(suite, tc, outputFile);
        Object innerContent = CppNamespaceTemplate.generate(model);
        String fileContent = CppFileTemplate.generate(generatorNotice, innerContent).toString();

        return new GeneratedFile(fileContent, outputFile);
    }

    public CppElements.CppNamespace generateCppModel(FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc) {

        String[] packageDesc = nameRules.packageName(tc.getPackage());
        CppElements.CppNamespace packageNs = CppElements.packageToNamespace(packageDesc);

        CppElements.CppNamespace result = new CppElements.CppNamespace(tc.getName());

        for (FType type : tc.fTypeCollection.getTypes()) {
            // struct
            if (type instanceof FStructType) {
                result.members.add(generateCppStruct((FStructType) type));
            } else if (type instanceof FTypeDef) {
                result.members.add(generateTypeDef((FTypeDef) type));
            } else if (type instanceof FEnumerationType) {
                if (tc.accessor.getIsClass((FEnumerationType) type)) {
                    result.members.add(generateCppEnumClass((FEnumerationType) type));
                } else {
                    result.members.add(generateCppEnum((FEnumerationType) type));
                }
            }
        }

        // constants
        for (FConstantDef constantDef : tc.fTypeCollection.getConstants()) {
            CppElements.CppConstant constant = generateCppConstant(constantDef);

            if (constant.isValid()) {
                result.members.add(constant);
            } else {
                System.out.println("Failed generating constant! " + constantDef.getName() + constantDef.getRhs().getClass());
            }
        }
        // TODO validate constant name uniqueness

        packageNs.members.add(result);
        return packageNs;
    }

    private CppElements.CppElement generateTypeDef(FTypeDef type) {
        CppElements.CppTypeDef typeDef = new CppElements.CppTypeDef();
        typeDef.name = nameRules.typedefName(type.getName());
        typeDef.targetType = CppTypeMapper.map(type.getActualType());

        return typeDef;
    }

    private CppElements.CppStruct generateCppStruct(FStructType structType) {

        CppElements.CppStruct struct = new CppElements.CppStruct();
        struct.name = nameRules.structName(structType.getName());

        for (FField fieldInfo : structType.getElements()) {
            CppElements.CppField field = new CppElements.CppField();

            field.type = CppTypeMapper.map(fieldInfo.getType());
            field.name = nameRules.fieldName(fieldInfo.getName());

            // FIXME No way to do initial values for fields in fidl!!!
            field.initializer = CppDefaultInitializer.map(fieldInfo.getType());

            struct.fields.add(field);
        }

        return struct;
    }

    private CppElements.CppEnum generateCppEnum(FEnumerationType enumerationType) {
        CppElements.CppEnum enumeration = new CppElements.CppEnum();
        enumeration.name = nameRules.enumName(enumerationType.getName());

        for (FEnumerator enumerator : enumerationType.getEnumerators()) {
            CppElements.CppEnumItem item = new CppElements.CppEnumItem();

            item.name = nameRules.fieldName(enumerator.getName());
            item.value = CppValueMapper.map(enumerator.getValue());

            enumeration.items.add(item);
        }

        if (!enumeration.isValid()) {
            System.out.println("Invalid enum: " + enumerationType.getName());
        }

        return enumeration;
    }

    private CppElements.CppEnumClass generateCppEnumClass( FEnumerationType enumerationType ) {
        CppElements.CppEnumClass enumClass = new CppElements.CppEnumClass();
        enumClass.enumeration = generateCppEnum(enumerationType);

        return enumClass;
    }

    private CppElements.CppConstant generateCppConstant(FConstantDef constantDef) {
        CppElements.CppConstant constant = new CppElements.CppConstant();

        // no need to check isArray here, it is redundant
        constant.type = CppTypeMapper.map(constantDef.getType());
        constant.name = nameRules.constantName(constantDef.getName());
        constant.value = CppValueMapper.map(constantDef.getRhs());

        return constant;
    }

    private final CppNameRules nameRules;
}
