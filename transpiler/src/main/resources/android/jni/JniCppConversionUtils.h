// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <string>
#include <jni.h>

namespace here
{
namespace internal
{

extern "C" {

/**
 * Converts a JNI jstring to a std string.
 */
std::string convert_jstring_to_std_string(JNIEnv* env, const jstring jinputString);

/**
 * Converts a std string to a JNI jstring
 */
jstring convert_std_string_to_jstring(JNIEnv* env, const std::string& inputString);

}  // extern "C"

}  // internal

}  // here
