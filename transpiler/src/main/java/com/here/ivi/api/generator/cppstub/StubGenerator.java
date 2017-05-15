package com.here.ivi.api.generator.cppstub;

import com.google.common.collect.Iterables;
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.common.cpp.*;
import com.here.ivi.api.generator.common.templates.CppDelegatorTemplate;
import com.here.ivi.api.generator.common.templates.CppCommentHeaderTemplate;
import com.here.ivi.api.generator.cppstub.templates.EmptyBodyTemplate;
import com.here.ivi.api.generator.cppstub.templates.NotifierBodyTemplate;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.Interface;
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

    private final Interface<? extends CppStubSpec.InterfacePropertyAccessor> iface;
    private final CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel;

    private static Logger logger = java.util.logging.Logger.getLogger(StubGenerator.class.getName());

    public <IA extends CppStubSpec.InterfacePropertyAccessor> StubGenerator(GeneratorSuite<IA, ?> suite,
                         FrancaModel<IA, ? extends CppStubSpec.TypeCollectionPropertyAccessor> coreModel,
                         CppNameRules rules,
                         Interface<IA> iface) {
        this.nameRules = rules;
        this.suite = suite;
        this.coreModel = coreModel;
        this.iface = iface;

        // this is the main type of the file, all namespaces and includes have to be resolved relative to it
        rootModel = new CppModelAccessor<>(iface, nameRules, coreModel);
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
        List<CppNamespace> packageNs = CppGeneratorHelper.packageToCppNamespace(iface.getPackage());

        // add to innermost namespace
        CppNamespace innermostNs = Iterables.getLast(packageNs);


        CppClass stubClass = new CppClass(nameRules.className(iface.getFrancaInterface()));
        AbstractFrancaCommentParser.Comments comment = StubCommentParser.parse(iface.getFrancaInterface());
        stubClass.comment = comment.getMainBodyText();

        CppClass stubListenerClass = new CppClass(CppStubNameRules.listenerName(iface.getFrancaInterface()));
        stubListenerClass.comment = "The listener for @ref " + stubClass.name +
                ". Implement to receive broadcasts and attribute change notifications.";

        // allow creating a shared pointer from within this class
        CppType sharedFromThis = new CppType("std::enable_shared_from_this< " + stubClass.name + " >");
        sharedFromThis.setIncludes(new Includes.SystemInclude("memory"));
        stubClass.inheritances.add(new CppInheritance(sharedFromThis, CppInheritance.Type.Public));

        // TODO reuse TypeCollectionGenerator to generate types in interface definition

        for (FMethod m : iface.getFrancaInterface().getMethods()) {
            appendMethodElements(stubClass, m);
        }

        for (FBroadcast b : iface.getFrancaInterface().getBroadcasts()) {
            appendNotifierElements(stubClass, stubListenerClass, b);
        }

        for (FAttribute a : iface.getFrancaInterface().getAttributes()) {
            appendAttributeAccessorElements(stubClass, stubListenerClass, a);
        }

        // inherit from listener vector if there are any methods on the listener
        if (!stubListenerClass.methods.isEmpty()) {
            stubClass.inheritances.add(new CppInheritance(
                    new CppType("here::internal::ListenerVector< " + stubListenerClass.name + " >",
                            new Includes.SystemInclude("here/internal/ListenerVector.h")), CppInheritance.Type.Public));

            innermostNs.members.add(stubListenerClass);
        }

        FInterface base = iface.getFrancaInterface().getBase();
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

    private void appendMethodElements(CppClass stubClass, FMethod m) {
        String uniqueMethodName = nameRules.methodName(m.getName()) + NameHelper.toUpperCamel(m.getSelector());

        CppType errorType;
        String errorComment = "";
        if (m.getErrorEnum() != null) {
            errorType = CppTypeMapper.mapEnum(rootModel, m.getErrorEnum());
            errorComment = StubCommentParser.FORMATTER.readCleanedErrorComment(m);
        } else {
            logger.severe("Missing error type for method " + m.getName());
            errorType = CppType.Void;
        }

        String returnComment;
        CppType returnType;

        if (m.getOutArgs().isEmpty()) {
            returnType = errorType;
            returnComment = errorComment;
        } else {
            List<CppType> returnTypes = new ArrayList<>();
            returnTypes.add(errorType);

            // documentation for the result type
            String typeComment = "Result type for @ref " + stubClass.name +"::" + uniqueMethodName + "";
            if (!errorComment.isEmpty()) {
                // add error template arg documentation
                typeComment += StubCommentParser.FORMATTER.formatTag("@arg Error", errorComment);
            }

            // create struct for multiple out arguments
            if (m.getOutArgs().size() > 1) {
                CppStruct struct = new CppStruct();
                struct.name = NameHelper.toUpperCamel(uniqueMethodName) + "Result";
                struct.fields = m.getOutArgs().stream().map(a -> {
                    CppType type = CppTypeMapper.map(rootModel, a);
                    if (type.info == CppElements.TypeInfo.InterfaceInstance) {
                        if (isCreator(m)) {
                            type = CppTypeMapper.wrapUniquePtr(type);
                        } else {
                            type = CppTypeMapper.wrapSharedPtr(type);
                        }
                    }

                    CppField field = new CppField(type, NameHelper.toLowerCamel(a.getName()));
                    // document struct field with argument comment
                    field.comment = StubCommentParser.FORMATTER.readCleanedComment(a);
                    return field;
                }).collect(Collectors.toList());

                // document return type, struct and append value information to type documentation
                struct.comment = "Result struct for @ref " + stubClass.name +"::" + uniqueMethodName + ".";
                typeComment += "\n* @arg Value The value struct instance";
                returnComment = "The result type, containing an error and a struct of values.";

                // register with model
                stubClass.structs.add(struct);
                returnTypes.add(new CppType(struct.name));
            }
            // take first & only argument
            else {
                FArgument arg = m.getOutArgs().get(0);
                CppType type = CppTypeMapper.map(rootModel, arg);
                if (type.info == CppElements.TypeInfo.InterfaceInstance) {
                    if (isCreator(m)) {
                        type = CppTypeMapper.wrapUniquePtr(type);
                    } else {
                        type = CppTypeMapper.wrapSharedPtr(type);
                    }
                }

                // document return type and append value information to type documentation
                returnComment = "The result type, containing either an error or the " + type.name +  " value.";
                if (!errorComment.isEmpty()) {
                    typeComment += StubCommentParser.FORMATTER.formatWithTag("@arg Value", arg);
                }

                // register with model
                returnTypes.add(type);
            }

            // always wrap multiple out values (error + outArgs) in their own type
            List<String> names = returnTypes.stream().map(t -> t.name).collect(Collectors.toList());
            Set<Includes.Include> includes = returnTypes.stream()
                    .flatMap(t -> t.includes.stream())
                    .collect(Collectors.toSet());
            includes.add(EXPECTED_INCLUDE);

            returnType = new CppType(
                    rootModel.getDefiner(),
                    "here::internal::Expected< " + String.join(", ", names) + " >",
                    CppElements.TypeInfo.Complex,
                    includes);

            // create & add using for this type with correct documentation
            String usingTypeName = NameHelper.toUpperCamel(uniqueMethodName) + "Expected";
            CppUsing using = new CppUsing(usingTypeName, returnType);
            using.comment = typeComment;
            stubClass.usings.add(using);
            returnType = new CppType(usingTypeName);
        }

        // create & add method, add return value documentation as this is not done in buildStubMethod
        CppMethod method = buildStubMethod(m, returnType);
        if (!returnComment.isEmpty()) {
            method.comment += StubCommentParser.FORMATTER.formatTag("@return", returnComment);
        }
        stubClass.methods.add(method);
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
        String uniqueNotifierName = a.getName() + "Changed";

        CppParameter param = new CppParameter();
        param.name = a.getName();
        param.mode = CppParameter.Mode.Input;

        param.type = CppTypeMapper.map(rootModel, a);
        if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
            param.type = CppTypeMapper.wrapSharedPtr(param.type);
        }

        // generate arguments as input params
        String arguments = StubCommentParser.generateParamDocumentation(
                StubCommentParser.FORMATTER,
                Collections.singletonList(a),
                ICommentFormatter.ParameterType.Input).toString();

        // listener method
        CppMethod listenerMethod = buildListenerMethod(uniqueNotifierName, Collections.singletonList(param));
        listenerMethod.comment = "Called when the attribute " + uniqueNotifierName + " was changed\n*";
        listenerMethod.comment += arguments;

        // notifier method (stub to api layer)
        CppMethod method = buildNotifierMethod(stubListenerClass, uniqueNotifierName, Collections.singletonList(param));
        method.comment = "Notifier for the attribute " + uniqueNotifierName + "\n" +
                "* Invokes @ref " + stubListenerClass.name +"::" + listenerMethod.name + " on all listeners.\n*";
        method.comment += arguments;

        // add to model
        stubListenerClass.methods.add(listenerMethod);
        stubClass.methods.add(method);
    }

    private void appendNotifierElements(CppClass stubClass, CppClass stubListenerClass, FBroadcast b) {
        String uniqueNotifierName = b.getName() + NameHelper.toUpperCamel(b.getSelector());

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

        // generate arguments as input params
        String arguments = StubCommentParser.generateParamDocumentation(
                StubCommentParser.FORMATTER,
                b.getOutArgs(),
                ICommentFormatter.ParameterType.Input).toString();
        
        // listener method
        CppMethod listenerMethod = buildListenerMethod(uniqueNotifierName, params);
        listenerMethod.comment = "Called when the broadcast " + uniqueNotifierName + " is emitted\n*";
        listenerMethod.comment += arguments;

        // notifier method (stub to api layer)
        CppMethod method = buildNotifierMethod(stubListenerClass, uniqueNotifierName, params);
        method.comment = "Notifier for the broadcast " + uniqueNotifierName + "\n" +
                "* Invokes @ref " + stubListenerClass.name +"::" + listenerMethod.name + " on all listeners.\n*";
        method.comment += arguments;

        // add to model
        stubClass.methods.add(method);
        stubListenerClass.methods.add(listenerMethod);
    }

    // they will be called from the cpp implementation
    private CppMethod buildNotifierMethod(CppClass stubListenerClass, String baseName, List<CppParameter> parameters) {
        CppMethod method = new CppMethod();
        method.name = "notify" + NameHelper.toUpperCamel(baseName);
        method.specifiers.add(CppMethod.Specifier.INLINE);
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
        method.specifiers.add(CppMethod.Specifier.VIRTUAL);

        return method;
    }

    private CppMethod buildStubMethod(FMethod m, CppType returnTypeName) {
        CppMethod method = new CppMethod();

        method.name = m.getName() + NameHelper.toUpperCamel(m.getSelector());
        method.returnType = returnTypeName;

        if (rootModel.getAccessor().getStatic(m)) {
            method.specifiers.add(CppMethod.Specifier.STATIC);
        } else {
            if (iface.getPropertyAccessor().getConst(m)) {
                // const needs to be before = 0; This smells more than the = 0 below
                method.qualifiers.add(CppMethod.Qualifier.CONST);
            }
            method.specifiers.add(CppMethod.Specifier.VIRTUAL);
            method.qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);
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

        AbstractFrancaCommentParser.Comments comment = StubCommentParser.parse(m);
        method.comment = comment.getMainBodyText();

        return method;
    }

    private final static Includes.SystemInclude EXPECTED_INCLUDE =
            new Includes.SystemInclude("here/internal/expected.h");

    private enum AttributeAccessorMode {
        GET, SET
    }

    private CppMethod buildAttributeAccessor(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootType,
                                             FAttribute attribute,
                                             AttributeAccessorMode mode) {
        CppMethod m = new CppMethod();
        m.specifiers.add(CppMethod.Specifier.VIRTUAL);

        CppType type = CppTypeMapper.map(rootType, attribute);
        if (type.info == CppElements.TypeInfo.InterfaceInstance) {
            type = CppTypeMapper.wrapSharedPtr(type);
        }

        String attributeName = nameRules.fieldName(attribute.getName());

        switch (mode) {
            case GET: {
                m.name = "get" + NameHelper.toUpperCamel(attributeName);
                m.qualifiers.add(CppMethod.Qualifier.CONST);
                m.returnType = type;
                m.comment = "Reads the " + attributeName + " attribute.\n*" +
                        StubCommentParser.FORMATTER.formatWithTag("@return", attribute);
                break;
            }
            case SET: {
                CppParameter param = new CppParameter();
                param.name = NameHelper.toLowerCamel(attributeName);
                param.mode = CppParameter.Mode.Input;
                param.type = type;

                m.name = "set" +  NameHelper.toUpperCamel(attributeName);
                m.inParameters.add(param);
                m.returnType = CppType.Void;
                m.comment = "Sets the " + attributeName + " attribute.\n*" +
                        StubCommentParser.FORMATTER.formatWithTag("@param " + param.name, attribute);
                break;
            }
        }

        m.qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);

        return m;
    }

    private boolean isCreator(final FMethod m) {
        return rootModel.getAccessor().getCreates(m) != null;
    }
}
