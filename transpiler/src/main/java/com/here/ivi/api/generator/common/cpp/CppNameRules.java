package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.model.FrancaModel;

import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FType;

import java.util.List;

public interface CppNameRules {

    /** Returns the cpp namespace of given type */
    List<String> namespace(FType type);

    /** Returns the cpp typename of given type */
    String cppTypename(FType type);

    /** Formats a name as a group of types and constants */
    String typeCollectionName(FTypeCollection base);

    /** Formats a name as a class */
    String className(FTypeCollection base);

    /** Formats a name as a method */
    String methodName(String base);

    /** Formats a name as a argument */
    String argumentName(String base);

    /** Formats a name as a constant */
    String constantName(String base);

    /** Formats a name as a enum */
    String enumName(String base);

    /** Formats a name as a enum entry */
    String enumEntryName(String base);

    /** Formats a name as a field */
    String fieldName(String base);

    /** Formats a name as a struct */
    String structName(String base);

    /** Formats a name as a typedef */
    String typedefName(String base);

    /** Maps fidl package name to directory structure */
    List<String> packageToDirectoryStructure(List<String> packages);

    /** Maps fidl package name to namespace */
    List<String> packageToNamespace(List<String> packages);

    /** Returns the name to use for header files (.h/.hpp) */
    String headerFileSuffix();

    /** Returns the path for typeCollections */
    String typeCollectionTarget(List<String> directories, FrancaModel.TypeCollection<?> tc);

    /** Returns the path for interfaces */
    String interfaceTarget(List<String> directories, FrancaModel.Interface<?> iface);
}