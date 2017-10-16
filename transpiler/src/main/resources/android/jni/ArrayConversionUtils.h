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

#include "JniCppConversionUtils.h"
#include "FieldAccessMethods.h"
#include "StructConversion.h"
#include "InstanceConversion.h"

#include <jni.h>
#include <vector>

namespace here
{
namespace internal
{

// The following functions are converting and boxing primitive values into the corresponding
// java boxing object so that they can be added to java list.

jobject convert_to_jni( JNIEnv* env, const bool nvalue );

jobject convert_to_jni( JNIEnv* env, const double nvalue );

jobject convert_to_jni( JNIEnv* env, const float nvalue );

jobject convert_to_jni( JNIEnv* env, const int8_t nvalue );

jobject convert_to_jni( JNIEnv* env, const int16_t nvalue );

jobject convert_to_jni( JNIEnv* env, const int32_t nvalue );

jobject convert_to_jni( JNIEnv* env, const int64_t nvalue );

jobject convert_to_jni( JNIEnv* env, const uint8_t nvalue );

jobject convert_to_jni( JNIEnv* env, const uint16_t nvalue );

jobject convert_to_jni( JNIEnv* env, const uint32_t nvalue );

jobject convert_to_jni( JNIEnv* env, const uint64_t nvalue );

// The following conversion methods are unboxing and converting primitive values from the
// java boxing object.

void convert_from_jni( JNIEnv* env, const jobject& jvalue, bool& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, double& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, float& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, int8_t& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, int16_t& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, int32_t& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, int64_t& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, uint8_t& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, uint16_t& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, uint32_t& nvalue );

void convert_from_jni( JNIEnv* env, const jobject& jvalue, uint64_t& nvalue );

jint unbox_int_value( JNIEnv* env, const jobject& jvalue );

jlong unbox_long_value( JNIEnv* env, const jobject& jvalue );

// Templated functions to create ArrayLists from C++ vectors and vice versa

template<typename T> jobject
convert_to_jni( JNIEnv* _env, const std::vector< T >& _ninput )
{
    auto javaClass = _env->FindClass( "java/util/ArrayList" );
    auto result = create_object( _env, javaClass );
    jmethodID addMethodId = _env->GetMethodID( javaClass, "add", "(Ljava/lang/Object;)Z" );

    for( const auto& element : _ninput )
    {
        auto jElement = convert_to_jni( _env, element );
        _env->CallBooleanMethod( result, addMethodId, jElement );
    }
    return result;
}

template<typename T> void
convert_from_jni( JNIEnv* _env, const jobject& _arrayList, std::vector< T >& _nresult )
{
    if ( _env->IsSameObject( _arrayList, nullptr ) )
    {
        _nresult.clear( );
        return;
    }

    auto javaArrayListClass = _env->FindClass( "java/util/ArrayList" );
    auto sizeMethodId = _env->GetMethodID( javaArrayListClass, "size", "()I" );
    auto getMethodId  = _env->GetMethodID( javaArrayListClass, "get", "(I)Ljava/lang/Object;" );
    jint length = _env->CallIntMethod( _arrayList, sizeMethodId );
    _nresult.reserve( length );
    for ( jint i = 0; i < length; i++ )
    {
        jobject javaListItem = _env->CallObjectMethod( _arrayList, getMethodId, i );
        T resultItem;
        convert_from_jni( _env, javaListItem, resultItem );
        _nresult.push_back( resultItem );
    }
}

} // internal

} // here
