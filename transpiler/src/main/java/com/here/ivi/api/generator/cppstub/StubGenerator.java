package com.here.ivi.api.generator.cppstub;


import com.here.ivi.api.generator.common.CppGeneratorHelper;
import com.here.ivi.api.generator.common.CppTypeMapper;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.templates.CppFileTemplate;
import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.generator.common.templates.CppTypeCollectionContentTemplate;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.*;
import com.here.navigation.CppStubSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FMethod;

import java.util.ArrayList;
import java.util.List;

import static com.here.ivi.api.model.cppmodel.CppElements.packageToNamespace;

/**
 * This generator will create the stub interfaces that will then be used by the other generators.
 */
public class StubGenerator {

    private final GeneratorSuite<?, ?> suite;
    private final FrancaModel coreModel;
    private final CppNameRules nameRules;

    private final FrancaModel.Interface<? extends CppStubSpec.InterfacePropertyAccessor> iface;
    private final CppType.DefinedBy rootType;


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
        rootType = new CppType.DefinedBy(iface.fInterface, iface.getModel().fModel);
    }

    public GeneratedFile generate() {
        CppNamespace model = buildCppModel();

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
        CppNamespace packageNs = packageToNamespace(packageDesc);

        CppClass result = new CppClass(iface.getName() + "Stub"); // TODO use name template

        // TODO reuse TypeCollectionGenerator to generate types in interface definition

        for (FMethod m : iface.fInterface.getMethods()) {
            CppMethod method = buildStubMethod(m);
            result.methods.add(method);
        }

        for (FBroadcast b : iface.fInterface.getBroadcasts()) {
            CppMethod method = buildNotifierMethod(b);
            result.methods.add(method);
        }

        packageNs.members.add(result);

        return packageNs;

    }

    // TODO think about how broadcast can work in a generic way
    // they will be called from the cpp implementation, and this will then be forwarded in some
    // api specific way to the next level
    private CppMethod buildNotifierMethod(FBroadcast b) {
        CppMethod method = new CppMethod();

        // TODO support for selectors

        method.name = "notify_" + b.getName(); // TODO use name template

        for (FArgument outArgs : b.getOutArgs()) {
            CppParameter param = new CppParameter();
            param.name = outArgs.getName(); // TODO use name template
            param.mode = CppParameter.Mode.Input;
            param.type = CppTypeMapper.map(rootType, outArgs.getType());
            method.inParameters.add(param);
        }

        // TODO add method body template (with some interface)


        return method;
    }

    private CppMethod buildStubMethod(FMethod m) {
        CppMethod method = new CppMethod();

        // TODO support for selectors
        method.name = m.getName(); // TODO use name template

        method.returnType = buildStubMethodReturnType(m);
        method.specifiers.add("virtual");
        method.qualifiers.add(" = 0"); // TODO this smells a bit, move to template

        for (FArgument inArg : m.getInArgs()) {
            CppParameter param = new CppParameter();
            param.name = inArg.getName(); // TODO use name template
            param.mode = CppParameter.Mode.Input;
            param.type = CppTypeMapper.map(rootType, inArg.getType());
            method.inParameters.add(param);
        }
        return method;
    }

    private String buildStubMethodReturnType(FMethod m) {
        String returnType = "void";
        List<String> returnTypes = new ArrayList<>();

        // TODO do we need to support Errors, instead of ErrorEnum as well - might need to create an inline type
        if (m.getErrorEnum() != null) {
            CppType mapped = CppTypeMapper.mapEnum(rootType, m.getErrorEnum());
            returnTypes.add(mapped.typeName);
        }

        for (FArgument outArg : m.getOutArgs()) {
            // TODO check for isArray
            CppType mapped = CppTypeMapper.map(rootType, outArg.getType());
            returnTypes.add(mapped.typeName);
        }

        if (!returnTypes.isEmpty()) {
            if (returnTypes.size() == 1) {
                returnType = returnTypes.get(0);
            } else {
                // TODO still too much string magic!!
                // FIXME no way to mark std::tuple as required include, as returnType is String only
                returnType = "std::tuple<" + String.join(", ", returnTypes) + ">";
            }
        }
        return returnType;
    }
}
