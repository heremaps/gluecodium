# Copyright (C) 2016-2021 HERE Europe B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# License-Filename: LICENSE

if(DEFINED includeguard_gluecodium_KnownOptionalProperties)
  return()
endif()
set(includeguard_gluecodium_KnownOptionalProperties ON)

include(${GLUECODIUM_GLUECODIUM_DIR}/details/CheckArguments.cmake)

function(_gluecodium_define_target_property property_name)
  set(_multi_args BRIEF_DOCS FULL_DOCS)

  cmake_parse_arguments(_args "" "" "${_multi_args}" ${ARGN})

  gluecodium_check_no_unparsed_arguments(_args _gluecodium_define_target_property)

  get_property(_known_optional_properties GLOBAL PROPERTY GLUECODIUM_KNOWN_OPTIONAL_PROPERTIES)
  if(${property_name} IN_LIST _known_optional_properties)
    return()
  endif()

  define_property(
    TARGET
    PROPERTY ${property_name}
    BRIEF_DOCS ${_args_BRIEF_DOCS}
    FULL_DOCS ${_args_FULL_DOCS})

  set_property(GLOBAL APPEND PROPERTY GLUECODIUM_KNOWN_OPTIONAL_PROPERTIES ${property_name})

  if (GLUECODIUM_PRINT_KNOWN_PROPERTIES)
    message("\nGluecodium property: ${property_name} - ${_args_BRIEF_DOCS}\n"
            "${_args_FULL_DOCS}")
  endif ()
endfunction()

set(_gluecodium_namerules_doc
    "Naming of method names, classes, parameters, fields, etc. can be changed according to"
    "project's needs. It's especially useful for a public API. Look there for a possible"
    "parameters and more details:"
    "https://github.com/heremaps/gluecodium/blob/master/docs/naming_conventions.md")

_gluecodium_define_target_property(
  GLUECODIUM_VERSION
  BRIEF_DOCS "The Gluecodium version"
  FULL_DOCS
    "The Version of Gluecodium to generate sources. If not specified the latest is used."
    "This property is initialized by the value of the GLUECODIUM_VERSION_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_JAVA_PACKAGE
  BRIEF_DOCS "The base Java package to use for generated Java sources"
  FULL_DOCS
    "The base Java package to use for generated Java sources, for example \"com.my_company\"."
    "This property is initialized by the value of the GLUECODIUM_JAVA_PACKAGE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_JAVA_INTERNAL_PACKAGE
  BRIEF_DOCS "The package to use for internal Java code"
  FULL_DOCS
    "The subpackage to use for internal Java code. This value is appended with separator '.' to a value passed with GLUECODIUM_JAVA_PACKAGE"
    "This property is initialized by the value of the GLUECODIUM_JAVA_INTERNAL_PACKAGE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_JAVA_NAMERULES
  BRIEF_DOCS "The path to a file with name rules for Java"
  FULL_DOCS
    "The path to a file with name rules for Java."
    ${_gluecodium_namerules_doc}
    "This property is initialized by the value of the GLUECODIUM_JAVA_NAMERULES_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_JAVA_NONNULL_ANNOTATION
  BRIEF_DOCS "The package to use for @NonNull annotation in Java"
  FULL_DOCS
    "The package to use for @NonNull annotation in Java. For example \"androidx.annotation.NonNull\""
    "This property is initialized by the value of the GLUECODIUM_JAVA_NONNULL_ANNOTATION_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_JAVA_NULLABLE_ANNOTATION
  BRIEF_DOCS "The package to use for @Nullable annotation in Java"
  FULL_DOCS
    "The package to use for @Nullable annotation in Java. For example \"androidx.annotation.Nullable\""
    "This property is initialized by the value of the GLUECODIUM_JAVA_NULLABLE_ANNOTATION_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_KOTLIN_PACKAGE
  BRIEF_DOCS "The base Kotlin package to use for generated Kotlin sources"
  FULL_DOCS
    "The base Kotlin package to use for generated Kotlin sources, for example \"com.my_company\"."
    "This property is initialized by the value of the GLUECODIUM_KOTLIN_PACKAGE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_KOTLIN_INTERNAL_PACKAGE
  BRIEF_DOCS "The package to use for internal Kotlin code"
  FULL_DOCS
    "The subpackage to use for internal Kotlin code. This value is appended with separator '.' to a value passed with GLUECODIUM_KOTLIN_PACKAGE"
    "This property is initialized by the value of the GLUECODIUM_KOTLIN_INTERNAL_PACKAGE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_KOTLIN_NAMERULES
  BRIEF_DOCS "The path to a file with name rules for Kotlin"
  FULL_DOCS
    "The path to a file with name rules for Kotlin."
    ${_gluecodium_namerules_doc}
    "This property is initialized by the value of the GLUECODIUM_KOTLIN_NAMERULES_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_COPYRIGHT_HEADER
  BRIEF_DOCS "The path to file with copyright to add in generated source files"
  FULL_DOCS
    "The path to file with copyright to add in generated source files"
    "This property is initialized by the value of the GLUECODIUM_COPYRIGHT_HEADER_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_CPP_NAMERULES
  BRIEF_DOCS "The path to a file with name rules for C++"
  FULL_DOCS
    "The path to a file with name rules for C++."
    ${_gluecodium_namerules_doc}
    "This property is initialized by the value of the GLUECODIUM_CPP_NAMERULES_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_CPP_NAMESPACE
  BRIEF_DOCS "C++ namespace for public (API) headers."
  FULL_DOCS
    "The C++ namespace to use in public headers. For example \"my::module\" or \"my.module\"."
    "This property is initialized by the value of the GLUECODIUM_CPP_NAMESPACE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_CPP_INTERNAL_NAMESPACE
  BRIEF_DOCS "The dot separated C++ namespace to use mostly in COMMON sourceset."
  FULL_DOCS
    "The C++ namespace to use mostly in COMMON (internal) source set. For example \"my::module\" or \"my.module\"."
    "If not set then \"gluecodium\" is used."
    "This property is initialized by the value of the GLUECODIUM_CPP_INTERNAL_NAMESPACE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_CPP_EXPORT_MACRO_NAME
  BRIEF_DOCS "The name of export macro for MAIN sources."
  FULL_DOCS
    "The name of export macro for MAIN sources. If not set then _GLUECODIUM_CPP_EXPORT is used."
    "This property is initialized by the value of the GLUECODIUM_CPP_EXPORT_MACRO_NAME_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_CPP_EXPORT_COMMON_MACRO_NAME
  BRIEF_DOCS "The name of export macro for COMMON sources."
  FULL_DOCS
    "The name of export macro for COMMON sources. If not set then _GLUECODIUM_CPP_EXPORT is used."
    "This property is initialized by the value of the GLUECODIUM_CPP_EXPORT_COMMON_MACRO_NAME_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_SWIFT_NAMERULES
  BRIEF_DOCS "The path to a file with name rules for Swift"
  FULL_DOCS
    "The path to a file with name rules for Swift."
    ${_gluecodium_namerules_doc}
    "This property is initialized by the value of the GLUECODIUM_SWIFT_NAMERULES_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_INTERNAL_PREFIX
  BRIEF_DOCS "Name prefix for internal conversion functions in Swift and Dart"
  FULL_DOCS
    "Name prefix for internal conversion functions in Swift and Dart."
    "This property is initialized by the value of the GLUECODIUM_INTERNAL_PREFIX_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called. Otherwise default value is target's output name."
)

_gluecodium_define_target_property(
  GLUECODIUM_SWIFT_EXPOSE_INTERNALS
  BRIEF_DOCS "Exposes internal entities which were generated for Swift"
  FULL_DOCS
    "Exposes internal classes and functions which were generated for Swift."
    "Those classes and functions are used to convert types between Swift and C++ and exposing is necessary if there are dependant Swift frameworks with generated by Gluecodium code"
    "This property is initialized by the value of the GLUECODIUM_SWIFT_EXPOSE_INTERNALS_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_STRICT_VALIDATION
  BRIEF_DOCS "Enables 'strict' mode for validation"
  FULL_DOCS
    "When validated in 'strict' mode, `@Immutable` structs must have at least one explicit constructor defined."
    "An explicit constructor is either a `field constructor` or a custom `constructor`."
    "This property is initialized by the value of the GLUECODIUM_SWIFT_EXPOSE_INTERNALS variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_DART_LIBRARY_NAME
  BRIEF_DOCS "Name of the generated library for Dart"
  FULL_DOCS
    "Name of the generated library for Dart."
    "This property is initialized by the value of the GLUECODIUM_DART_LIBRARY_NAME_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_DART_FUNCTION_LOOKUP_ERROR_MESSAGE
  BRIEF_DOCS "Custom error message for when Dart FFI function lookup fails"
  FULL_DOCS
    "Custom error message for when Dart FFI function lookup fails."
    "This property is initialized by the value of the GLUECODIUM_DART_FUNCTION_LOOKUP_ERROR_MESSAGE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_DART_DISABLE_FINALIZABLE_MARKER
  BRIEF_DOCS "Disables usage of Dart:FFI 'Finalizable' marker by the generated types"
  FULL_DOCS
    "Disables usage of Dart:FFI 'Finalizable' marker by the generated types"
    "This property is initialized by the value of the GLUECODIUM_DART_DISABLE_FINALIZABLE_MARKER_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_ENABLE_ANDROID_ATTRIBUTES_MISMATCH_WARNING
  BRIEF_DOCS "Enables generation of warnings when attributes for Java and Kotlin do not match."
  FULL_DOCS
    "Enables generation of warnings when attributes for Java and Kotlin do not match. "
    "Option used to ease adjustments of LIME files needed to transition from Java to Kotlin. "
    "This property is initialized by the value of the GLUECODIUM_ENABLE_ANDROID_ATTRIBUTES_MISMATCH_WARNING_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_DART_NAMERULES
  BRIEF_DOCS "The path to a file with name rules for Dart"
  FULL_DOCS
    "The path to a file with name rules for Dart."
    ${_gluecodium_namerules_doc}
    "This property is initialized by the value of the GLUECODIUM_DART_NAMERULES_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_WERROR
  BRIEF_DOCS "The list of warnings to treat as errors."
  FULL_DOCS
    "The list of warnings to treat as errors. Possible values: DocLinks, DeprecatedAttributes, DartOverloads."
    "This property is initialized by the value of the GLUECODIUM_WERROR_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

# TODO: Reference(s) to documentations TODO: Tests
_gluecodium_define_target_property(
  GLUECODIUM_TAGS
  BRIEF_DOCS "The list of tags to skip in generated code."
  FULL_DOCS
    "The list of tags to skip with attribute @Skip(\"<tag>\") in generated code."
    "This property is initialized by the value of the GLUECODIUM_TAGS_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_VERBOSE
  BRIEF_DOCS "Produce more output during during generation."
  FULL_DOCS
    "The generation step produces more detailed output if this option is set to ON."
    "This property is initialized by the value of the GLUECODIUM_VERBOSE_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_VALIDATE_ONLY
  BRIEF_DOCS "Perform validation of input files without generating any code."
  FULL_DOCS
    "Perform validation of input files without generating any code if this option is set to ON."
    "This property is initialized by the value of the GLUECODIUM_VALIDATE_ONLY_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_IMPORT_FRAMEWORKS
  BRIEF_DOCS "The list of frameworks to import all over generated code"
  FULL_DOCS
    "The list of frameworks to import all over generated code. This property might be used to construct dependencies"
    "This property is initialized by the value of the GLUECODIUM_IMPORT_FRAMEWORKS_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_SYNCHRONIZE_ACCESS_CLASS_CACHE
  BRIEF_DOCS "Option to enable synchronization for JNIClassCache hash map."
  FULL_DOCS
    "Generates code for synchronized access to the hash map with cached information about JNI classes if this option is set to ON."
    "This property is initialized by the value of the GLUECODIUM_SYNCHRONIZE_ACCESS_CLASS_CACHE variable if it is set when the function gluecodium_add_generate_command is called."
    "Such synchronisation might be necessary when Java/JNI generated code is located in several libraries and the libraries are loaded on-demand."
)

_gluecodium_define_target_property(
  GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS
  BRIEF_DOCS "Option to enable internal debug checks."
  FULL_DOCS
    "Enables additional debug checks in C++ code. For instance validation of JNI references handling."
    "If property is not set then debug checks are enabled only in debug builds."
    "This property is initialized by the value of the GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_FORCE_USAGE_OF_JNI_FROM_JAVA_GENERATOR
  BRIEF_DOCS "Enforces usage of JNI layer generated by Java generator even for Kotlin"
  FULL_DOCS
    "Enforces usage of JNI layer generated by Java generator even for Kotlin."
    "This flag can be used to generate and compile Kotlin and Java in one pass of Gluecodium."
    "IMPORTANT: the user is responsible for ensuring that input LIME model for Java and Kotlin is compatible (the best case: identical)."
    "This property is initialized by the value of the GLUECODIUM_FORCE_USAGE_OF_JNI_FROM_JAVA_GENERATOR_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_DOCS_PLACEHOLDERS_FILES
  BRIEF_DOCS "The paths to files with placeholders list for documentation."
  FULL_DOCS
    "The paths to files with placeholders list for documentation. Content of listed files is concatenated during the build and content of `GLUECODIUM_DOCS_PLACEHOLDERS` appended to the final file."
    "This property is initialized by the value of the GLUECODIUM_DOCS_PLACEHOLDERS_FILES_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_DOCS_PLACEHOLDERS
  BRIEF_DOCS "The placeholders for documentation."
  FULL_DOCS
    "The placeholders for documentation in form `placeholder_name=\\\"Placeholder text\\\"`. "
    "Pay attention that quotes must be escaped twice because property's value is saved in another cmake file. "
    "Also some symbols can't be used in text, for example semicolon. "
    "It's appended to the file with placeholders, see `GLUECODIUM_DOCS_PLACEHOLDERS_FILES`. "
    "This property is initialized by the value of the GLUECODIUM_DOCS_PLACEHOLDERS_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

_gluecodium_define_target_property(
  GLUECODIUM_DOCS_VALIDATION_RULES
  BRIEF_DOCS "The path to file with rules used to validate documentation comments."
  FULL_DOCS
    "File with rules used to validate documentation comments. Each rule contains list of elements, that need to match certain regular expression."
    "This property is initialized by the value of the GLUECODIUM_DOCS_VALIDATION_RULES_DEFAULT variable if it is set when the function gluecodium_add_generate_command is called."
)

# TODO: Add read-only properties

function(_gluecodium_get_default_value_for_variable result _property)
  if(DEFINED ENV{${_property}_DEFAULT})
    set(${result} "$ENV{${_property}_DEFAULT}" PARENT_SCOPE)
  elseif(DEFINED ${_property}_DEFAULT)
    set(${result} "${${_property}_DEFAULT}" PARENT_SCOPE)
  else()
    get_property(_global_property GLOBAL PROPERTY "${_property}_DEFAULT")
    if(_global_property)
      set(${result} "${_global_property}" PARENT_SCOPE)
    endif()
  endif()
endfunction()

function(_gluecodium_set_property_if_globally_initialised _target _property)
  get_target_property(_existing_property ${_target} ${_property})
  if(NOT _existing_property STREQUAL "_existing_property-NOTFOUND")
    return()
  endif()

  unset(_default_value)
  _gluecodium_get_default_value_for_variable(_default_value ${_property})
  if(_default_value)
    set_target_properties(${_target} PROPERTIES ${_property} "${_default_value}")
  endif()
endfunction()
