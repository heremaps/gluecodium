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

// ------------------- JNI to C++ conversion functions ---------------------------------------------

void
here::internal::convert_from_jni( JNIEnv* env, const jstring jvalue, std::string& nresult )
{
    if ( env->IsSameObject( jvalue, nullptr ) )
    {
        nresult.clear( );
        return;
    }
    const char* jbuffer = env->GetStringUTFChars( jvalue, nullptr );
    nresult = std::string( jbuffer );
    env->ReleaseStringUTFChars( jvalue, jbuffer );
}

void
here::internal::convert_from_jni( JNIEnv* env, const jbyteArray& jvalue, std::vector< uint8_t >& nresult )
{
    if ( env->IsSameObject( jvalue, nullptr ) )
    {
        nresult.clear( );
        return;
    }
    size_t size = static_cast< size_t >( env->GetArrayLength( jvalue ) );
    nresult = std::vector< uint8_t >( size );
    jbyte* jbuffer = reinterpret_cast< jbyte* >( nresult.data( ) );
    env->GetByteArrayRegion( jvalue, 0, size, jbuffer );
}

// -------------------- C++ to JNI conversion functions --------------------------------------------

jstring
here::internal::convert_to_jni( JNIEnv* env, const std::string& nvalue )
{
    return env->NewStringUTF( nvalue.c_str( ) );
}

jbyteArray
here::internal::convert_to_jni( JNIEnv* env, const std::vector< uint8_t >& nvalue )
{
    jsize size = static_cast< jsize >( nvalue.size( ) );
    jbyteArray jresult = env->NewByteArray( size );
    const jbyte* jbuffer = reinterpret_cast< const jbyte* >( nvalue.data( ) );
    env->SetByteArrayRegion( jresult, 0, size, jbuffer );

    return jresult;
}
