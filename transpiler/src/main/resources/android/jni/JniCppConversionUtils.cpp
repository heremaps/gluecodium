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

#include "JniCppConversionUtils.h"

extern "C" {

std::string here::internal::convert_jstring_to_std_string(JNIEnv* env, const jstring jinputString)
{
    return std::string(env->GetStringUTFChars(jinputString, JNI_FALSE));
}

jstring here::internal::convert_std_string_to_jstring(JNIEnv* env, const std::string& inputString)
{
    return env->NewStringUTF(inputString.c_str());
}

}
