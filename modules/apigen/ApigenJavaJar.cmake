# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenJavaJar)
  return()
endif()
set(includeguard_ApigenJavaJar ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenJavaJar
# -------------------
#
# This module assembles *.class files into a *.jar file for a target for which
# apigen_java_compile($target) was run.
#
# .. command:: apigen_java_jar
#
# The general form of the command is::
#
#     apigen_java_jar(target)
#

find_package(Java COMPONENTS Development REQUIRED)

function(apigen_java_jar target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(APIGEN_JAVA_OUTPUT_DIR ${target} APIGEN_JAVA_COMPILE_OUTPUT_DIR)

    if(${GENERATOR} MATCHES android)

        # Transpiler invocations for different generators need different output directories
        # as the transpiler currently wipes the directory upon start.
        set(APIGEN_JAVA_JAR_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-java-jar)
        set(APIGEN_JAVA_JAR ${APIGEN_JAVA_JAR_OUTPUT_DIR}/${target}.jar)

        # Attach properties to target for re-use in other modules
        set_target_properties(${target} PROPERTIES
            APIGEN_JAVA_JAR ${APIGEN_JAVA_JAR})

        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_JAVA_JAR_OUTPUT_DIR}
            COMMAND ${Java_JAR_EXECUTABLE} -cfM ${APIGEN_JAVA_JAR} -C ${APIGEN_JAVA_OUTPUT_DIR} .
            COMMENT "Creating Java JAR from class files...")
        # TODO: Installs unconditionally, allow to configure the module:
        #install(FILES ${APIGEN_JAVA_JAR}
        #    DESTINATION lib)

    endif()

endfunction(apigen_java_jar)
