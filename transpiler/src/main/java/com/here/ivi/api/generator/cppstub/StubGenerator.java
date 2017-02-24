package com.here.ivi.api.generator.cppstub;


import com.google.common.collect.Iterables;
import com.here.ivi.api.generator.legacy.LegacyGenerator;
import com.here.ivi.api.generator.legacy.templates.LegacyImpl;
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.common.templates.CppFileTemplate;
import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.generator.common.templates.CppTypeCollectionContentTemplate;
import com.here.ivi.api.generator.cppstub.templates.NotifierBodyTemplate;
import com.here.ivi.api.generator.cppstub.templates.NotifierTypeTemplate;
import com.here.ivi.api.generator.cppstub.templates.SetNotifierBodyTemplate;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.*;
import navigation.CppStubSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FMethod;

import java.util.*;
import java.util.stream.Collectors;

/**
 * This generator will create the stub interfaces that will then be used by the other generators.
 */
public class StubGenerator {

    private final GeneratorSuite<?, ?> suite;
    private final FrancaModel coreModel;
    private final CppNameRules nameRules;

    private final FrancaModel.Interface<? extends CppStubSpec.InterfacePropertyAccessor> iface;
    private final CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel;


    public StubGenerator(GeneratorSuite<?, ?> suite,
                         FrancaModel<
                                 ? extends CppStubSpec.InterfacePropertyAccessor,
                                 ? extends CppStubSpec.TypeCollectionPropertyAccessor> coreModel,
                         CppNameRules rules,
                         FrancaModel.Interface<? extends CppStubSpec.InterfacePropertyAccessor> iface) {
        this.nameRules = rules;
        this.suite = suite;
        this.coreModel = coreModel;
        this.iface = iface;

        // this is the main type of the file, all namespaces and includes have to be resolved relative to it
        rootModel = new CppModelAccessor<>(iface.fInterface, iface.getModel().fModel, iface.accessor);
    }

    public GeneratedFile generate() {
        CppNamespace model = buildCppModel();

        if (model.isEmpty()) {
            return null;
        }

        String[] packageDesc = nameRules.packageName(iface.getPackage());
        String outputFile = nameRules.interfaceStubTarget(packageDesc, iface);

        // find included files and resolve relative to generated path
        CppIncludeResolver resolver = new CppIncludeResolver(coreModel, iface, nameRules);
        resolver.resolveLazyIncludes(model);

        Object generatorNotice = CppGeneratorHelper.generateGeneratorNotice(suite, iface, outputFile);
        Object innerContent = CppTypeCollectionContentTemplate.generate(model);
        String fileContent = CppFileTemplate.generate(generatorNotice, innerContent).toString();

        return new GeneratedFile(fileContent, outputFile);
    }

    private CppNamespace buildCppModel() {

        String[] packageDesc = nameRules.packageName(iface.getPackage());
        List<CppNamespace> packageNs = CppGeneratorHelper.packageToNamespace(packageDesc);

        CppClass result = new CppClass(iface.getName() + "Stub" );

        // TODO reuse TypeCollectionGenerator to generate types in interface definition

        for (FMethod m : iface.fInterface.getMethods()) {
            result.methods.add(buildStubMethod(m));
        }

        for (FBroadcast b : iface.fInterface.getBroadcasts()) {
            appendNotifierElements(result, b);
        }

        for (FAttribute a : iface.fInterface.getAttributes()) {
            appendAttributeAccessorElements(result, a);
        }

        // add to innermost namespace
        Iterables.getLast(packageNs).members.add(result);

        // return outermost namespace
        return Iterables.getFirst(packageNs, null);
    }

    private void appendAttributeAccessorElements(CppClass result, FAttribute a) {
        // getter
        result.methods.add(buildAttributeAccessor(rootModel, a, AttributeAccessorMode.GET));
        // setter if not readonly
        if (!a.isReadonly()) {
            result.methods.add(buildAttributeAccessor(rootModel, a, AttributeAccessorMode.SET));
        }
        // notifier if not subscriptions disabled
        if (!a.isNoSubscriptions()) {
            appendNotifierElements(result, a);
        }
    }

    private void appendNotifierElements(CppClass result, FAttribute a) {
        String uniqueNotifierName = a.getName() + "Changed"; // TODO use name template

        CppParameter param = new CppParameter();
        param.name = a.getName();
        param.mode = CppParameter.Mode.Input;
        param.type = CppTypeMapper.map(rootModel, a);

        appendNotifierElements(result, uniqueNotifierName, Collections.singletonList(param));
    }

    private void appendNotifierElements(CppClass result, FBroadcast b) {
        String uniqueNotifierName = b.getName() + NameHelper.toUpperCamel(b.getSelector()); // TODO use name template

        List<CppParameter> params = b.getOutArgs().stream().map(a -> {
            CppParameter param = new CppParameter();
            param.name = a.getName();
            param.mode = CppParameter.Mode.Input;
            param.type = CppTypeMapper.map(rootModel, a.getType());
            return param;
        }).collect(Collectors.toList());

        appendNotifierElements(result, uniqueNotifierName, params);
    }

    private void appendNotifierElements(CppClass result, String uniqueNotifierName, List<CppParameter> params) {
        String notifierName = NotifierTypeTemplate.generateName(uniqueNotifierName);
        String notifierVariableName = NotifierTypeTemplate.generateNotifier(uniqueNotifierName);

        // notifier method (stub to api layer)
        CppMethod method = buildNotifierMethod(
                uniqueNotifierName,
                params,
                notifierVariableName);
        result.methods.add(method);

        // std::function with all the broadcast arguments
        CppType notifierType = new CppType(rootModel, NotifierTypeTemplate.generateType(method),
                CppElements.TypeInfo.Complex, new Includes.SystemInclude("functional"));
        // declare using for the complex std::function
        result.usings.add(new CppUsing(notifierName, notifierType));

        // named reference to what is defined in the type above
        CppType notifierTypeRef = new CppType(rootModel, notifierName, CppElements.TypeInfo.Complex);

        // add member field for the notifier
        result.fields.add(new CppField(notifierTypeRef, notifierVariableName, new CppValue("nullptr")));

        // add setter for the notifier
        result.methods.add(buildSetNotifierMethod(uniqueNotifierName, notifierTypeRef, notifierVariableName));
    }

    // they will be called from the cpp implementation, and this will then be forwarded in some
    // api specific way to the next level, e.g. by using listeners
    private CppMethod buildNotifierMethod(String baseName, List<CppParameter> parameters, String notifierVariableName) {
        CppMethod method = new CppMethod();
        method.name = "notify" + NameHelper.toUpperCamel(baseName);
        method.inParameters.addAll(parameters);
        method.mbt = new NotifierBodyTemplate(notifierVariableName);
        return method;
    }

    private CppMethod buildSetNotifierMethod(String name, CppType notifierType, String notifierVariableName) {
        CppMethod method = new CppMethod();

        method.name = "set" +  NameHelper.toUpperCamel(name) + "Notifier";

        CppParameter param = new CppParameter();
        param.name = "notifier";
        param.mode = CppParameter.Mode.Input;
        param.type = notifierType;
        method.inParameters.add(param);

        // add method body template
        method.mbt = new SetNotifierBodyTemplate(notifierVariableName, "notifier");

        return method;
    }

    private CppMethod buildStubMethod(FMethod m) {
        CppMethod method = new CppMethod();

        method.name = m.getName() + NameHelper.toUpperCamel(m.getSelector());
        method.returnType = buildStubMethodReturnType(m);
        method.specifiers.add("virtual");

        if (iface.accessor.getConst(m)) {
            // const needs to be before = 0; This smells more than the = 0 below
            method.qualifiers.add(" const");
        }
        method.qualifiers.add(" = 0"); // pure virtual

        for (FArgument inArg : m.getInArgs()) {
            CppParameter param = new CppParameter();
            param.name = inArg.getName();
            param.mode = CppParameter.Mode.Input;
            param.type = CppTypeMapper.map(rootModel, inArg.getType());
            method.inParameters.add(param);
        }
        return method;
    }

    private final static Includes.SystemInclude TUPLE_INCLUDE = new Includes.SystemInclude("tuple");

    private CppType buildStubMethodReturnType(FMethod m) {
        List<CppType> returnTypes = new ArrayList<>();

        // TODO do we need to support Errors, instead of ErrorEnum as well - might need to create an inline type
        if (m.getErrorEnum() != null) {
            CppType mapped = CppTypeMapper.mapEnum(rootModel, m.getErrorEnum());
            returnTypes.add(mapped);
        }

        for (FArgument outArg : m.getOutArgs()) {
            CppType mapped = CppTypeMapper.map(rootModel, outArg);
            returnTypes.add(mapped);
        }

        if (!returnTypes.isEmpty()) {
            if (returnTypes.size() == 1) {
                return returnTypes.get(0);
            } else {
                List<String> names = returnTypes.stream().map(t -> t.name).collect(Collectors.toList());
                Set<Includes.Include> includes = returnTypes.stream()
                        .flatMap(t -> t.includes.stream())
                        .collect(Collectors.toSet());
                includes.add(TUPLE_INCLUDE);

                // TODO still too much string magic!!
                return new CppType(
                        rootModel,
                        "std::tuple< " + String.join(", ", names) + " >",
                        CppElements.TypeInfo.Complex,
                        includes );
            }
        }

        return CppType.Void;
    }

    private enum AttributeAccessorMode {
        GET, SET
    }

    // Intentionally no support for error cases when getting/setting attributes
    private static CppMethod buildAttributeAccessor(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootType,
                                                    FAttribute attribute,
                                                    AttributeAccessorMode mode) {
        CppMethod m = new CppMethod();
        m.specifiers.add("virtual");

        CppType type = CppTypeMapper.map(rootType, attribute);

        switch (mode) {
            case GET: {
                m.name = "get" + NameHelper.toUpperCamel(attribute.getName()); // TODO use name rules
                m.qualifiers.add("const");
                m.returnType = type;
                break;
            }
            case SET: {
                CppParameter param = new CppParameter();
                param.name = NameHelper.toLowerCamel(attribute.getName()); // TODO use name rules
                param.mode = CppParameter.Mode.Input;
                param.type = type;

                m.name = "set" +  NameHelper.toUpperCamel(attribute.getName()); // TODO use name rules
                m.inParameters.add(param);
                m.returnType = CppType.Void;
                break;
            }
        }

        m.qualifiers.add(" = 0"); // pure virtual, add after the const from before

        return m;
    }
}
