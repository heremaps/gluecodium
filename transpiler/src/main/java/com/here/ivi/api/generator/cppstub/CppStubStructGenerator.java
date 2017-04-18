package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.generator.legacy.LegacyFrancaCommentParser;
import com.here.ivi.api.generator.legacy.LegacyFrancaCommentParser.LegacyComments;
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.common.templates.CppFileTemplate;
import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.generator.cppstub.templates.ApiStructHeader;
import com.here.ivi.api.generator.cppstub.templates.StructCtor;
import com.here.ivi.api.model.DefaultValuesHelper;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.*;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.util.*;
import java.util.logging.Logger;


public class CppStubStructGenerator {

    private static final String StructName = "type";

    static Logger logger = Logger.getLogger(CppStubStructGenerator.class.getName());

    private final CppNameRules nameRules;

    public static List<AbstractMap.SimpleEntry< FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor>,
                                                FrancaModel.Interface<CppStubSpec.InterfacePropertyAccessor> > >
    collectMethodContainers( final FrancaModel<CppStubSpec.InterfacePropertyAccessor,
                                               CppStubSpec.TypeCollectionPropertyAccessor> model){

        List<AbstractMap.SimpleEntry<
                FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor>,
                FrancaModel.Interface<CppStubSpec.InterfacePropertyAccessor> > > result = new LinkedList<>();

        //for each type collection: search its methods (if any)
        for (FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc : model.typeCollections) {

            if (tc.accessor.getIsStructDefinition(tc.fTypeCollection)) {
                //find real interface
                FInterface fi = tc.accessor.getBelongingMethodContainer(tc.fTypeCollection);
                Optional<FrancaModel.Interface<CppStubSpec.InterfacePropertyAccessor>> fiOptional =
                        fi != null ?
                           model.interfaces.stream()
                               .filter(i -> fi.equals(i.fInterface))
                               .findFirst() :
                           Optional.empty();
                //should never happen
                if (fi != null && !fiOptional.isPresent()) {
                    logger.severe("Error: interface could not be found: " + fi);
                }
                FrancaModel.Interface<CppStubSpec.InterfacePropertyAccessor> fullInterface =
                        fiOptional.orElse(null);

                result.add(new AbstractMap.SimpleEntry<>(tc, fullInterface));
            }
        }
        return result;
    }

    public CppStubStructGenerator(CppNameRules rules) {
        this.nameRules = rules;
    }

    public GeneratedFile generateFiles(final GeneratorSuite<?,?> suite,
                                       final FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
                                                         ? extends CppStubSpec.TypeCollectionPropertyAccessor> model,
                                       final FrancaModel.Interface<CppStubSpec.InterfacePropertyAccessor> methods,
                                       final FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc) {


        CppClass newClass = generateClass(methods,tc,model);

        LegacyComments comments = LegacyFrancaCommentParser.createCommentParser(tc.fTypeCollection);

        newClass.comment = comments.getMainBodyText();

        CppIncludeResolver resolver = new CppIncludeResolver(model, tc, nameRules);
        resolver.resolveLazyIncludes(newClass);

        List<String> directories = nameRules.packageToDirectoryStructure(tc.getPackage());
        String fileName =  nameRules.typeCollectionTarget(directories, tc);

        Object generatorNotice = CppGeneratorHelper.generateGeneratorNotice(suite, tc, fileName);
        String fileContent = CppFileTemplate.generate(generatorNotice, ApiStructHeader.generate(newClass)).toString();
        return new GeneratedFile(fileContent,fileName);
    }

    public CppField generateCppField(CppModelAccessor<CppStubSpec.TypeCollectionPropertyAccessor> rootType,
                                            FField ffield, FFieldInitializer initializer) {

        FTypeRef typeRef = ffield.getType();
        CppField field = new CppField();
        field.name = ffield.getName();
        field.type = CppTypeMapper.map(rootType, typeRef);
        field.initializer = CppValueMapper.map(field.type, initializer.getValue());
        return field;
    }

    public CppClass generateClass(final FrancaModel.Interface<CppStubSpec.InterfacePropertyAccessor> api,
                                  final FrancaModel.TypeCollection<CppStubSpec.TypeCollectionPropertyAccessor> tc,
                                  final FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
                                                    ? extends CppStubSpec.TypeCollectionPropertyAccessor> model) {

        CppModelAccessor<CppStubSpec.TypeCollectionPropertyAccessor> rootType =
                new CppModelAccessor<>(tc.fTypeCollection, tc.model.fModel, tc.accessor,  nameRules, model);

        CppClass newClass = new CppClass(tc.getName());

        // find member struct ///////////////////////////

        // search for a struct inside the type collection of name StructName
        FStructType memberStruct = null;
        for(FType type : tc.fTypeCollection.getTypes())
        {
            if (type.getName().equals(StructName) &&
                    type instanceof FStructType) {
                memberStruct = (FStructType) type;
                break;
            }
        }

        if (memberStruct == null) {
            logger.severe("Failed to find type struct! ");
            return newClass;
        }

        // default values //////////////////////////

        //search for constants from type collection
        FCompoundInitializer defaultInitializer = null;
        for (FConstantDef constantDef : tc.fTypeCollection.getConstants()) {
            // only structs of the same type as belonging interface with correct name will be checked
            if (DefaultValuesHelper.isStructDefaultValueConstant(constantDef) &&
                    constantDef.getType().getDerived().getName().equals(StructName)) {
                // is valid as constantDef was parsed as a struct ...
                defaultInitializer = (FCompoundInitializer) constantDef.getRhs();
                break;
            }
        }

        if (defaultInitializer == null) {
            logger.severe("Failed to find default values of " + memberStruct.getName());
            return newClass;
        }

        // generate fields /////////////////////////////////
        Iterator<FField> memberIterator           = memberStruct.getElements().iterator();
        Iterator<FFieldInitializer> valueIterator = defaultInitializer.getElements().iterator();
        while(memberIterator.hasNext() && valueIterator.hasNext()) {
            CppField field = generateCppField(rootType,memberIterator.next(),valueIterator.next() );
            newClass.fields.add(field);
        }

        //methods ////////////////////////////
        //////////////////////////////////////

        //default constructor is added via xtend template ...

        if (api != null) {
            CppModelAccessor<CppStubSpec.InterfacePropertyAccessor> rootModelIf =
                    new CppModelAccessor<>(api.fInterface, api.model.fModel, api.accessor, nameRules, model);

            //non default-constructors ...
            StructCtor templateCtor = new StructCtor();
            api.fInterface.getMethods()
                    .stream()
                    .filter(method -> method.getName().equals("init"))
                    .forEach(method -> {
                                CppMethod nonDefaultCtor = new CppMethod();
                                nonDefaultCtor.mbt = templateCtor;
                                nonDefaultCtor.name = newClass.name;
                                nonDefaultCtor.returnType = CppType.None;
                                for (FArgument arg : method.getInArgs()) {
                                    CppParameter param = new CppParameter();
                                    param.name = NameHelper.toSnakeCase(arg.getName());
                                    param.type = CppTypeMapper.map(rootModelIf, arg);
                                    param.mode = CppParameter.Mode.Input;
                                    nonDefaultCtor.inParameters.add(param);
                                }
                                newClass.methods.add(nonDefaultCtor);
                            }
                    );
        }

        return newClass;
    }
}
