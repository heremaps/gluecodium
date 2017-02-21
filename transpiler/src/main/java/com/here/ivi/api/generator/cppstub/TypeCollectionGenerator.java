package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.common.templates.*;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppEnumItem;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.navigation.CppStubSpec;
import org.franca.core.franca.*;

/**
 * This generator will create the cpp data types for any type mentioned in a typeCollection.
 * The cpp data structs, enums and typedefs are then used by the CppStubGenerator.
 *
 * Individual generators on top of the CppStubGenerator can then decide to either wrap these types
 * (e.g. Java + JNI, Swift, …) or use them directly (traditional legacy).
 *
 */
public class TypeCollectionGenerator {

    private final GeneratorSuite<?, ?> suite;
    private final FrancaModel coreModel;
    private final CppNameRules nameRules;

    private final FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> tc;
    private final CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel;


    public TypeCollectionGenerator(GeneratorSuite<?, ?> suite,
                                   FrancaModel<
                                              ? extends CppStubSpec.InterfacePropertyAccessor,
                                              ? extends CppStubSpec.TypeCollectionPropertyAccessor> coreModel,
                                   CppNameRules rules,
                                   FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> tc) {
        this.nameRules = rules;
        this.suite = suite;
        this.coreModel = coreModel;
        this.tc = tc;

        // this is the main type of the file, all namespaces and includes have to be resolved relative to it
        rootModel = new CppModelAccessor<>(tc.fTypeCollection, tc.getModel().fModel, tc.accessor);
    }

    public GeneratedFile generate() {
        CppNamespace model = buildCppModel();

        if (model.isEmpty()) {
            return null;
        }

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

    private CppNamespace buildCppModel() {

        String[] packageDesc = nameRules.packageName(tc.getPackage());
        CppNamespace packageNs = CppGeneratorHelper.packageToNamespace(packageDesc);

        CppNamespace result = new CppNamespace(tc.getName());

        for (FType type : tc.fTypeCollection.getTypes()) {
            // struct
            if (type instanceof FStructType) {
                result.members.add(buildCppStruct((FStructType) type));
            } else if (type instanceof FTypeDef) {

                FTypeDef typeDef = (FTypeDef) type;
                // skip the typedefs for external reference and instanceId typedefs
                // as these types are purely internal
                if (CppTypeMapper.isExternalReference(typeDef) ||
                        CppTypeMapper.isInstanceId(typeDef)) {
                    continue;
                }
                result.members.add(buildTypeDef(typeDef));
            } else if (type instanceof FArrayType) {
                result.members.add(buildArray((FArrayType) type));
            } else if (type instanceof FMapType) {
                result.members.add(buildMap((FMapType) type));
            } else if (type instanceof FEnumerationType) {
                if (tc.accessor.getIsClass((FEnumerationType) type)) {
                    result.members.add(buildCppEnumClass((FEnumerationType) type));
                } else {
                    result.members.add(buildCppEnum((FEnumerationType) type));
                }
            } else {
                System.err.println("Missing type map in " + rootModel + " for " + type.getClass().getName());
            }

        }

        // constants
        for (FConstantDef constantDef : tc.fTypeCollection.getConstants()) {
            CppConstant constant = buildCppConstant(constantDef);

            if (constant.isValid()) {
                result.members.add(constant);
            } else {
                System.err.println("Failed generating constant! " + constantDef.getName() + " " + constantDef.getRhs().getClass());
            }
        }

        // ensure to not create empty namespaces
        if (!result.isEmpty()) {
            packageNs.members.add(result);
        }

        return packageNs;
    }

    private CppElement buildMap(FMapType type) {
        CppTypeDef typeDef = new CppTypeDef();
        typeDef.name = nameRules.typedefName(type.getName()); // TODO use name rules
        typeDef.targetType = CppTypeMapper.wrapMapType(
                CppTypeMapper.getDefinedBy(type),
                CppTypeMapper.map(rootModel, type.getKeyType()),
                CppTypeMapper.map(rootModel, type.getValueType()));

        return typeDef;
    }

    private CppElement buildTypeDef(FTypeDef type) {
        CppTypeDef typeDef = new CppTypeDef();
        typeDef.name = nameRules.typedefName(type.getName()); // TODO use name rules
        typeDef.targetType = CppTypeMapper.map(rootModel, type.getActualType());

        return typeDef;
    }

    private CppElement buildArray(FArrayType type) {
        CppTypeDef typeDef = new CppTypeDef();
        typeDef.name = nameRules.typedefName(type.getName());  // TODO use name rules
        typeDef.targetType = CppTypeMapper.wrapArrayType(
                CppTypeMapper.getDefinedBy(type),
                CppTypeMapper.map(rootModel, type.getElementType()),
                CppTypeMapper.ArrayMode.map(rootModel, type));

        return typeDef;
    }

    private CppStruct buildCppStruct(FStructType structType) {

        DefinedBy structDefiner = CppTypeMapper.getDefinedBy(structType);
        CppStruct struct = new CppStruct();
        struct.name = nameRules.structName(structType.getName());

        for (FField fieldInfo : structType.getElements()) {
            CppField field = new CppField();

            field.type = CppTypeMapper.map(rootModel, fieldInfo.getType());
            // handle inline array definition
            if (fieldInfo.isArray()) {
                field.type = CppTypeMapper.wrapArrayType(structDefiner,
                        field.type, CppTypeMapper.ArrayMode.map(rootModel, fieldInfo));
            }
            field.name = nameRules.fieldName(fieldInfo.getName());

            // FIXME No way to do initial values for fields in fidl!!!
            field.initializer = CppDefaultInitializer.map(fieldInfo.getType());

            struct.fields.add(field);
        }

        return struct;
    }

    private CppEnum buildCppEnum(FEnumerationType enumerationType) {
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

    private CppEnumClass buildCppEnumClass(FEnumerationType enumerationType) {
        CppEnumClass enumClass = new CppEnumClass();
        enumClass.enumeration = buildCppEnum(enumerationType);

        return enumClass;
    }

    private CppConstant buildCppConstant(FConstantDef constantDef) {
        CppConstant constant = new CppConstant();

        // no need to check isArray here, it is redundant
        constant.type = CppTypeMapper.map(rootModel, constantDef.getType());
        constant.name = nameRules.constantName(constantDef.getName());
        constant.value = CppValueMapper.map(constant.type, constantDef.getRhs());

        return constant;
    }
}
