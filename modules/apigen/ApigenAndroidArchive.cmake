# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenAndroidArchive)
  return()
endif()
set(includeguard_ApigenAndroidArchive ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenAndroidArchive
# -------------------
#
# This module assembles an Android Archive (*.aar) file for a target.
# It requires that apigen_transpile(), apigen_java_compile() and
# apigen_java_jar() have been invoked on it first.
#
# .. command:: apigen_java_jar
#
# The general form of the command is::
#
#     apigen_java_jar(target)
#

find_package(Java COMPONENTS Development REQUIRED)

function(apigen_android_archive)

    set(options)
    set(oneValueArgs TARGET)
    set(multiValueArgs ASSETS)
    cmake_parse_arguments(apigen_android_archive "${options}" "${oneValueArgs}"
                                                 "${multiValueArgs}" ${ARGN})

    get_target_property(GENERATOR ${apigen_android_archive_TARGET} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(APIGEN_JAVA_OUTPUT_DIR ${apigen_android_archive_TARGET} APIGEN_JAVA_OUTPUT_DIR)
    get_target_property(OUTPUT_DIR ${apigen_android_archive_TARGET} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)
    get_target_property(APIGEN_JAVA_JAR ${apigen_android_archive_TARGET} APIGEN_JAVA_JAR)

    if(${GENERATOR} MATCHES android)

        set(APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-android-archive)
        set(APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/jni/${CMAKE_ANDROID_ARCH_ABI})
        set(APIGEN_ANDROID_ARCHIVE_CLASSES_JAR ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/classes.jar)
        set(APIGEN_ANDROID_ARCHIVE_MANIFEST_XML ${OUTPUT_DIR}/android/AndroidManifest.xml)
        set(APIGEN_ANDROID_ARCHIVE ${CMAKE_CURRENT_BINARY_DIR}/${apigen_android_archive_TARGET}.aar)

        add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
            COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR}
            COMMAND ${CMAKE_COMMAND} ARGS -E copy $<TARGET_FILE:${apigen_android_archive_TARGET}> ${APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR}
            COMMAND ${CMAKE_COMMAND} ARGS -E copy ${APIGEN_JAVA_JAR} ${APIGEN_ANDROID_ARCHIVE_CLASSES_JAR}
            COMMAND ${CMAKE_COMMAND} ARGS -E copy ${APIGEN_ANDROID_ARCHIVE_MANIFEST_XML} ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/
            COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/assets/
            COMMENT "Assembling Android Archive contents...")
        foreach(asset ${apigen_android_archive_ASSETS})
            add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
                COMMAND cp -fR ${asset} ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/assets/)
        endforeach()

        add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
            COMMAND ${Java_JAR_EXECUTABLE} -cfM ${APIGEN_ANDROID_ARCHIVE} .
            WORKING_DIRECTORY ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}
            COMMENT "Generating Android Archive...")
        install(FILES ${APIGEN_ANDROID_ARCHIVE}
            DESTINATION lib)

    endif()

endfunction(apigen_android_archive)
