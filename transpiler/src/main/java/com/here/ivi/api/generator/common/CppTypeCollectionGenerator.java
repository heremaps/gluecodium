package com.here.ivi.api.generator.common;

import com.here.ivi.api.generator.common.templates.*;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.cppmodel.CppEnumItem;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.navigation.CppStubSpec;
import org.franca.core.franca.*;

import static com.here.ivi.api.model.cppmodel.CppElements.packageToNamespace;

public class CppTypeCollectionGenerator {

    public CppTypeCollectionGenerator(CppNameRules rules) {
        this.nameRules = rules;
    }

    public GeneratedFile generate( GeneratorSuite<?,?> suite,
                                   FrancaModel<
                                           ? extends CppStubSpec.InterfacePropertyAccessor,
                                           ? extends CppStubSpec.TypeCollectionPropertyAccessor> coreModel,
                                   FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> tc) {

        CppNamespace model = generateCppModel(tc);


        String[] packageDesc = nameRules.packageName(tc.getPackage());
        String outputFile = nameRules.typeCollectionTarget(packageDesc, tc);

        // find included files and resolve relative to generated path
        CppIncludeResolver resolver = new CppIncludeResolver(coreModel, tc, nameRules);
        resolver.resolveLazyIncludes(model);

        Object generatorNotice = CppGeneratorHelper.generateGeneratorNotice(suite, tc, outputFile);
        Object innerContent = CppTypeCollectionContentTemplate.generate(model);
        String fileContent = CppFileTemplate.generate(generatorNotice, innerContent).toString();

        return new GeneratedFile(fileContent, outputFile);
    }

    public CppNamespace generateCppModel(FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> tc) {

        String[] packageDesc = nameRules.packageName(tc.getPackage());
        CppNamespace packageNs = packageToNamespace(packageDesc);

        CppNamespace result = new CppNamespace(tc.getName());

        for (FType type : tc.fTypeCollection.getTypes()) {
            // struct
            if (type instanceof FStructType) {
                result.members.add(generateCppStruct((FStructType) type));
            } else if (type instanceof FTypeDef) {
                result.members.add(generateTypeDef((FTypeDef) type));
            } else if (type instanceof FArrayType) {
                result.members.add(generateArray((FArrayType) type));
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
            CppConstant constant = generateCppConstant(constantDef);

            if (constant.isValid()) {
                result.members.add(constant);
            } else {
                System.err.println("Failed generating constant! " + constantDef.getName() + " " + constantDef.getRhs().getClass());
            }
        }

        packageNs.members.add(result);

        return packageNs;
    }

    private CppElement generateTypeDef(FTypeDef type) {
        CppTypeDef typeDef = new CppTypeDef();
        typeDef.name = nameRules.typedefName(type.getName());
        typeDef.targetType = CppTypeMapper.map(type.getActualType());

        return typeDef;
    }

    private CppElement generateArray(FArrayType type) {
        CppTypeDef typeDef = new CppTypeDef();
        typeDef.name = nameRules.typedefName(type.getName());
        typeDef.targetType = CppTypeMapper.wrapArrayType(
                CppTypeMapper.getDefinedBy(type),
                CppTypeMapper.map(type.getElementType()));

        return typeDef;
    }

    private CppStruct generateCppStruct(FStructType structType) {

        CppType.DefinedBy structDefiner = CppTypeMapper.getDefinedBy(structType);
        CppStruct struct = new CppStruct();
        struct.name = nameRules.structName(structType.getName());

        for (FField fieldInfo : structType.getElements()) {
            CppField field = new CppField();

            field.type = CppTypeMapper.map(fieldInfo.getType());
            // handle inline array definition
            if (fieldInfo.isArray()) {
                field.type = CppTypeMapper.wrapArrayType(
                        structDefiner,
                        field.type);
            }
            field.name = nameRules.fieldName(fieldInfo.getName());

            // FIXME No way to do initial values for fields in fidl!!!
            field.initializer = CppDefaultInitializer.map(fieldInfo.getType());

            struct.fields.add(field);
        }

        return struct;
    }

    private CppEnum generateCppEnum(FEnumerationType enumerationType) {
        CppEnum enumeration = new CppEnum();
        enumeration.name = nameRules.enumName(enumerationType.getName());

        for (FEnumerator enumerator : enumerationType.getEnumerators()) {
            CppEnumItem item = new CppEnumItem();

            item.name = nameRules.fieldName(enumerator.getName());
            item.value = CppValueMapper.map(enumerator.getValue());

            enumeration.items.add(item);
        }

        if (!enumeration.isValid()) {
            System.out.println("Invalid enum: " + enumerationType.getName());
        }

        return enumeration;
    }

    private CppEnumClass generateCppEnumClass( FEnumerationType enumerationType ) {
        CppEnumClass enumClass = new CppEnumClass();
        enumClass.enumeration = generateCppEnum(enumerationType);

        return enumClass;
    }

    private CppConstant generateCppConstant(FConstantDef constantDef) {
        CppConstant constant = new CppConstant();

        // no need to check isArray here, it is redundant
        constant.type = CppTypeMapper.map(constantDef.getType());
        constant.name = nameRules.constantName(constantDef.getName());
        constant.value = CppValueMapper.map(constant.type, constantDef.getRhs());

        return constant;
    }

    private final CppNameRules nameRules;
}
