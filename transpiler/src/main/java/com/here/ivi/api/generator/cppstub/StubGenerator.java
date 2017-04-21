package com.here.ivi.api.generator.cppstub;


import com.google.common.collect.Iterables;
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.common.templates.CppDelegatorTemplate;
import com.here.ivi.api.generator.common.CppNameRules;
import com.here.ivi.api.generator.common.templates.CppCommentHeaderTemplate;
import com.here.ivi.api.generator.cppstub.templates.EmptyBodyTemplate;
import com.here.ivi.api.generator.cppstub.templates.NotifierBodyTemplate;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.*;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;
import java.util.stream.Collectors;

/**
 * This generator will create the stub interfaces that will then be used by the other generators.
 */
public class StubGenerator {

    private final GeneratorSuite<?, ?> suite;
    private final FrancaModel<?, ?> coreModel;
    private final CppNameRules nameRules;

    private final FrancaModel.Interface<? extends CppStubSpec.InterfacePropertyAccessor> iface;
    private final CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel;

    private static Logger logger = java.util.logging.Logger.getLogger(StubGenerator.class.getName());

    public <IA extends CppStubSpec.InterfacePropertyAccessor> StubGenerator(GeneratorSuite<IA, ?> suite,
                         FrancaModel<IA, ? extends CppStubSpec.TypeCollectionPropertyAccessor> coreModel,
                         CppNameRules rules,
                         FrancaModel.Interface<IA> iface) {
        this.nameRules = rules;
        this.suite = suite;
        this.coreModel = coreModel;
        this.iface = iface;

        // this is the main type of the file, all namespaces and includes have to be resolved relative to it
        rootModel = new CppModelAccessor<>(iface.fInterface, iface.getModel().fModel, iface.accessor, nameRules, coreModel);
    }

    public GeneratedFile generate() {
        CppNamespace model = buildCppModel();

        if (model.isEmpty()) {
            return null;
        }

        List<String> baseDirectories = nameRules.packageToDirectoryStructure(iface.getPackage());
        String outputFile = nameRules.interfaceTarget(baseDirectories, iface);

        // find included files and resolve relative to generated path
        CppIncludeResolver resolver = new CppIncludeResolver(coreModel, iface, nameRules);
        resolver.resolveLazyIncludes(model);

        CharSequence generatorNotice = CppGeneratorHelper.generateGeneratorNotice(suite, iface, outputFile);
        CharSequence innerContent = CppDelegatorTemplate.generate(new CppTemplateDelegator(), model);
        String fileContent = CppCommentHeaderTemplate.generate(generatorNotice, innerContent).toString();

        return new GeneratedFile(fileContent, outputFile);
    }

    private CppNamespace buildCppModel() {
        List<CppNamespace> packageNs = CppGeneratorHelper.packageToNamespace(iface.getPackage());

        // add to innermost namespace
        CppNamespace innermostNs = Iterables.getLast(packageNs);

        CppClass stubListenerClass = new CppClass(CppStubNameRules.listenerName(iface.fInterface));
        CppClass stubClass = new CppClass(nameRules.className(iface.fInterface));

        // allow creating a shared pointer from within this class
        CppType sharedFromThis = new CppType("std::enable_shared_from_this< " + stubClass.name + " >");
        sharedFromThis.setIncludes(new Includes.SystemInclude("memory"));
        stubClass.inheritances.add(new CppInheritance(sharedFromThis, CppInheritance.Type.Public));

        // TODO reuse TypeCollectionGenerator to generate types in interface definition

        for (FMethod m : iface.fInterface.getMethods()) {
            appendMethodElements(stubClass, m);
        }

        for (FBroadcast b : iface.fInterface.getBroadcasts()) {
            appendNotifierElements(stubClass, stubListenerClass, b);
        }

        for (FAttribute a : iface.fInterface.getAttributes()) {
            appendAttributeAccessorElements(stubClass, stubListenerClass, a);
        }

        // inherit from listener vector if there are any methods on the listener
        if (!stubListenerClass.methods.isEmpty()) {
            stubClass.inheritances.add(new CppInheritance(
                    new CppType("here::internal::ListenerVector< " + stubListenerClass.name + " >",
                            new Includes.SystemInclude("here/internal/ListenerVector.h")), CppInheritance.Type.Public));

            innermostNs.members.add(stubListenerClass);
        }

        FInterface base = iface.fInterface.getBase();
        if (base != null) {
            DefinedBy baseDefinition = DefinedBy.getDefinedBy(base);

            stubClass.inheritances.add(new CppInheritance(
                    new CppType(
                            CppNamespaceUtils.getCppTypename(rootModel, baseDefinition,
                                    nameRules.className(base)),
                            new Includes.LazyInternalInclude(baseDefinition, Includes.InternalType.Interface)),
                    CppInheritance.Type.Public));

            // TODO ensure that there is actually a listener for the base class (go through broadcasts & attributes)
            stubListenerClass.inheritances.add(new CppInheritance(
                    new CppType(
                            CppNamespaceUtils.getCppTypename(rootModel, baseDefinition,
                                    CppStubNameRules.listenerName(base)),
                            new Includes.LazyInternalInclude(baseDefinition, Includes.InternalType.Interface)),
                    CppInheritance.Type.Public));
        }

        // add to innermost namespace
        innermostNs.members.add(stubClass);

        // return outermost namespace
        return Iterables.getFirst(packageNs,null);
    }

    private CppType buildListenerList(CppClass stubListenerClass) {
        return CppTypeMapper.wrapVector(CppTypeMapper.wrapWeakPtr(new CppType(rootModel, stubListenerClass.name)));
    }

    private void appendMethodElements(CppClass stubClass, FMethod m) {
        String uniqueMethodName = m.getName() + NameHelper.toUpperCamel(m.getSelector()); // TODO use name template

        CppType errorType;
        if (m.getErrorEnum() != null) {
            // TODO do we need to support Errors, instead of ErrorEnum as well - might need to create an inline type
            errorType = CppTypeMapper.mapEnum(rootModel, m.getErrorEnum());
        } else {
            logger.severe("Missing error type for method " + m.getName());
            errorType = CppType.Void;
        }

        CppType returnType;
        if (m.getOutArgs().isEmpty()) {
            returnType = errorType;
        } else {

            List<CppType> returnTypes = new ArrayList<>();
            returnTypes.add(errorType);

            // create struct for multiple out arguments
            if (m.getOutArgs().size() > 1) {
                CppStruct struct = new CppStruct();
                struct.name = NameHelper.toUpperCamel(uniqueMethodName) + "Result";
                struct.fields = m.getOutArgs().stream().map(a -> {
                    CppType type = CppTypeMapper.map(rootModel, a);
                    if (type.info == CppElements.TypeInfo.InterfaceInstance) {
                        type = CppTypeMapper.wrapSharedPtr(type);
                    }
                    return new CppField(type, NameHelper.toLowerCamel(a.getName()));
                }).collect(Collectors.toList());
                stubClass.structs.add(struct);

                returnTypes.add(new CppType(struct.name));
            }
            // take first argument
            else {
                CppType type = CppTypeMapper.map(rootModel, m.getOutArgs().get(0));
                if (type.info == CppElements.TypeInfo.InterfaceInstance) {
                    type = CppTypeMapper.wrapSharedPtr(type);
                }
                returnTypes.add(type);
            }

            // always wrap multiple out values (error + outArgs) in their own type
            List<String> names = returnTypes.stream().map(t -> t.name).collect(Collectors.toList());
            Set<Includes.Include> includes = returnTypes.stream()
                    .flatMap(t -> t.includes.stream())
                    .collect(Collectors.toSet());
            includes.add(EXPECTED_INCLUDE);

            returnType = new CppType(
                    rootModel,
                    "here::internal::Expected< " + String.join(", ", names) + " >",
                    CppElements.TypeInfo.Complex,
                    includes);

            // create using for this type
            String usingTypeName = NameHelper.toUpperCamel(uniqueMethodName) + "Expected"; // TODO use name template
            // add using
            stubClass.usings.add(new CppUsing(usingTypeName, returnType));
            returnType = new CppType(usingTypeName);
        }

        // add method
        stubClass.methods.add(buildStubMethod(m, returnType));
    }

    private void appendAttributeAccessorElements(CppClass stubClass, CppClass stubListenerClass, FAttribute a) {
        // getter
        stubClass.methods.add(buildAttributeAccessor(rootModel, a, AttributeAccessorMode.GET));
        // setter if not readonly
        if (!a.isReadonly()) {
            stubClass.methods.add(buildAttributeAccessor(rootModel, a, AttributeAccessorMode.SET));
        }
        // notifier if not subscriptions disabled
        if (!a.isNoSubscriptions()) {
            appendNotifierElements(stubClass, stubListenerClass, a);
        }
    }

    private void appendNotifierElements(CppClass stubClass, CppClass stubListenerClass, FAttribute a) {
        String uniqueNotifierName = a.getName() + "Changed"; // TODO use name template

        CppParameter param = new CppParameter();
        param.name = a.getName();
        param.mode = CppParameter.Mode.Input;

        param.type = CppTypeMapper.map(rootModel, a);
        if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
            param.type = CppTypeMapper.wrapSharedPtr(param.type);
        }

        appendNotifierElements(stubClass, stubListenerClass, uniqueNotifierName, Collections.singletonList(param));
    }

    private void appendNotifierElements(CppClass stubClass, CppClass stubListenerClass, FBroadcast b) {
        String uniqueNotifierName = b.getName() + NameHelper.toUpperCamel(b.getSelector()); // TODO use name template

        List<CppParameter> params = b.getOutArgs().stream().map(a -> {
            CppParameter param = new CppParameter();
            param.name = a.getName();
            param.mode = CppParameter.Mode.Input;

            param.type = CppTypeMapper.map(rootModel, a.getType());
            if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
                param.type = CppTypeMapper.wrapSharedPtr(param.type);
            }

            return param;
        }).collect(Collectors.toList());

        appendNotifierElements(stubClass, stubListenerClass, uniqueNotifierName, params);
    }

    private void appendNotifierElements(CppClass stubClass, CppClass stubListenerClass, String uniqueNotifierName, List<CppParameter> params) {

        CppMethod listenerMethod = buildListenerMethod(
                uniqueNotifierName,
                params);
        stubListenerClass.methods.add(listenerMethod);

        // notifier method (stub to api layer)
        CppMethod method = buildNotifierMethod(
                stubListenerClass,
                uniqueNotifierName,
                params);
        stubClass.methods.add(method);

    }

    // they will be called from the cpp implementation
    private CppMethod buildNotifierMethod(CppClass stubListenerClass, String baseName, List<CppParameter> parameters) {
        CppMethod method = new CppMethod();
        method.name = "notify" + NameHelper.toUpperCamel(baseName);
        method.specifiers.add("inline");
        method.inParameters.addAll(parameters);
        method.mbt = new NotifierBodyTemplate(stubListenerClass.name, "on" + NameHelper.toUpperCamel(baseName));
        return method;
    }

    // they will be implemented by the next generator or other stubs
    private CppMethod buildListenerMethod(String baseName, List<CppParameter> parameters) {
        CppMethod method = new CppMethod();
        method.name = "on" + NameHelper.toUpperCamel(baseName);
        method.inParameters.addAll(parameters);
        method.mbt = new EmptyBodyTemplate();
        method.specifiers.add("virtual");
        return method;
    }

    private CppMethod buildStubMethod(FMethod m, CppType returnTypeName) {
        CppMethod method = new CppMethod();

        method.name = m.getName() + NameHelper.toUpperCamel(m.getSelector());
        method.returnType = returnTypeName;

        if (rootModel.getAccessor().getStatic(m)) {
            method.specifiers.add("static");
        } else {
            if (iface.accessor.getConst(m)) {
                // const needs to be before = 0; This smells more than the = 0 below
                method.qualifiers.add(" const");
            }
            method.specifiers.add("virtual");
            method.qualifiers.add(" = 0"); // pure virtual
        }

        for (FArgument inArg : m.getInArgs()) {
            CppParameter param = new CppParameter();
            param.name = inArg.getName();
            param.mode = CppParameter.Mode.Input;

            param.type = CppTypeMapper.map(rootModel, inArg.getType());
            if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
                param.type = CppTypeMapper.wrapSharedPtr(param.type);
            }

            method.inParameters.add(param);
        }
        return method;
    }

    private final static Includes.SystemInclude EXPECTED_INCLUDE =
            new Includes.SystemInclude("here/internal/expected.h");

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
        if (type.info == CppElements.TypeInfo.InterfaceInstance) {
            type = CppTypeMapper.wrapSharedPtr(type);
        }

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
