package com.here.ivi.api.generator.common.templates

import java.util.List
import com.here.ivi.api.model.FrancaModel

interface CppNameRules {
    /** Formats a name as a group of types and constants */
    def String typeCollectionName(String base)

    /** Formats a name as a class */
    def String className(String base)

    /** Formats a name as a method */
    def String methodName(String base)

    /** Formats a name as a argument */
    def String argumentName(String base)

    /** Formats a name as a constant */
    def String constantName(String base)

    /** Formats a name as a enum */
    def String enumName(String base)

    /** Formats a name as a enum entry */
    def String enumEntryName(String base)

    /** Formats a name as a field */
    def String fieldName(String base)

    /** Formats a name as a struct */
    def String structName(String base)

    /** Formats a name as a typedef */
    def String typedefName(String base)

    /** Maps fidl package name to directory structure */
    def List<String> packageToDirectoryStructure(List<String> packages)

    /** Maps fidl package name to namespace */
    def List<String> packageToNamespace(List<String> packages)

    /** Returns the name to use for header files (.h/.hpp) */
    def String headerFileSuffix()

    /** Returns the path for typeCollections */
    def String typeCollectionTarget(List<String> directories, FrancaModel.TypeCollection<?> tc)

    /** Returns the path for interfaces */
    def String interfaceTarget(List<String> directories, FrancaModel.Interface<?> iface)
}