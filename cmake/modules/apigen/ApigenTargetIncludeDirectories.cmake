# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenTargetIncludeDirectories)
  return()
endif()
set(includeguard_ApigenTargetIncludeDirectories ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenTargetIncludeDirectories
# ------------------------------
#
# This module attaches additional include directories to the provided target.
# These might differ depending on the previously used generator (stub, android,
# swift, etc.). This module depends on apigen_transpile() to have been run on
# the target first.
#
# .. command:: apigen_target_include_directories
#
# The general form of the command is::
#
#     apigen_target_include_directories(target)
#

function(apigen_target_include_directories target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)

    if(${GENERATOR} STREQUAL stub)

        # If generator exactly matches 'stub' the user intended stub
        target_include_directories(${target}
            PUBLIC ${OUTPUT_DIR}
            INTERFACE $<INSTALL_INTERFACE:${STUB_INCLUDE_DIR}>)

    elseif(${GENERATOR} MATCHES android)

        # Android library targets need the stub and JNI headers to compile
        # but should not expose those to the public.
        target_include_directories(${target}
            PRIVATE ${OUTPUT_DIR}
            PRIVATE ${JNI_LIBRARIES})

    elseif(${GENERATOR} MATCHES swift)

        # Swift targets need the stub and c_bridge headers to compile
        # but should not expose those to the public.
        target_include_directories(${target}
            PRIVATE ${OUTPUT_DIR})

    endif()

endfunction(apigen_target_include_directories)
