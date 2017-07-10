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

// ------------------- JNI to C++ conversion functions ---------------------------------------------

std::string here::internal::convert_jstring_to_std_string(JNIEnv* env, const jstring jvalue)
{
    return std::string(env->GetStringUTFChars(jvalue, JNI_FALSE));
}

std::vector<uint8_t> here::internal::convert_jbyte_array_to_byte_vector(JNIEnv* env,
    const jbyteArray& jvalue)
{
    size_t size = static_cast<size_t>(env->GetArrayLength(jvalue));
    std::vector<uint8_t> nresult(size);
    jbyte* jbuffer = reinterpret_cast<jbyte*>(nresult.data());
    env->GetByteArrayRegion(jvalue, 0, size, jbuffer);

    return nresult;
}

// -------------------- C++ to JNI conversion functions --------------------------------------------

jstring here::internal::convert_std_string_to_jstring(JNIEnv* env, const std::string& nvalue)
{
    return env->NewStringUTF(nvalue.c_str());
}

jbyteArray here::internal::convert_byte_vector_to_jbyte_array(JNIEnv* env,
    const std::vector<uint8_t>& nvalue)
{
    jsize size = static_cast<jsize>(nvalue.size());
    jbyteArray jresult = env->NewByteArray(size);
    const jbyte* jbuffer = reinterpret_cast<const jbyte*>(nvalue.data());
    env->SetByteArrayRegion(jresult, 0, size, jbuffer);

    return jresult;
}

}
