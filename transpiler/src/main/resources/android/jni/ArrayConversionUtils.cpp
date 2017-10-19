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

#include "ArrayConversionUtils.h"

namespace here
{
namespace internal
{

jobject
convert_to_jni( JNIEnv* env, const bool nvalue )
{
    return box_value_in_object( env, "java/lang/Boolean", "(Z)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const double nvalue )
{
    return box_value_in_object( env, "java/lang/Double", "(D)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const float nvalue )
{
    return box_value_in_object( env, "java/lang/Float", "(F)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const int8_t nvalue )
{
    return box_value_in_object( env, "java/lang/Byte", "(B)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const int16_t nvalue )
{
    return box_value_in_object( env, "java/lang/Short", "(S)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const int32_t nvalue )
{
    return box_value_in_object( env, "java/lang/Integer", "(I)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const int64_t nvalue )
{
    return box_value_in_object( env, "java/lang/Long", "(J)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const uint8_t nvalue )
{
    return box_value_in_object( env, "java/lang/Long", "(J)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const uint16_t nvalue )
{
    return box_value_in_object( env, "java/lang/Long", "(J)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const uint32_t nvalue )
{
    return box_value_in_object( env, "java/lang/Long", "(J)V", nvalue );
}

jobject
convert_to_jni( JNIEnv* env, const uint64_t nvalue )
{
    return box_value_in_object( env, "java/lang/Long", "(J)V", nvalue );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, bool& nvalue )
{
    auto javaBooleanClass = env->FindClass( "java/lang/Boolean" );
    auto booleanValueMethodId = env->GetMethodID( javaBooleanClass, "booleanValue", "()Z" );
    nvalue = env->CallBooleanMethod( jvalue, booleanValueMethodId );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, double& nvalue )
{
    auto javaDoubleClass = env->FindClass( "java/lang/Double" );
    auto doubleValueMethodId = env->GetMethodID( javaDoubleClass, "doubleValue", "()D" );
    nvalue = env->CallDoubleMethod( jvalue, doubleValueMethodId );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, float& nvalue )
{
    auto javaFloatClass = env->FindClass( "java/lang/Float" );
    auto floatValueMethodId = env->GetMethodID( javaFloatClass, "floatValue", "()F" );
    nvalue = env->CallFloatMethod( jvalue, floatValueMethodId );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, int8_t& nvalue )
{
    auto javaByteClass = env->FindClass( "java/lang/Byte" );
    auto byteValueMethodId = env->GetMethodID( javaByteClass, "byteValue", "()B" );
    nvalue = env->CallByteMethod( jvalue, byteValueMethodId );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, int16_t& nvalue )
{
    auto javaShortClass = env->FindClass( "java/lang/Short" );
    auto shortValueMethodId = env->GetMethodID( javaShortClass, "shortValue", "()S" );
    nvalue = env->CallShortMethod( jvalue, shortValueMethodId );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, int32_t& nvalue )
{
    nvalue = unbox_int_value( env, jvalue );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, int64_t& nvalue )
{
    nvalue = unbox_long_value( env, jvalue );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, uint8_t& nvalue )
{
    nvalue = unbox_long_value( env, jvalue );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, uint16_t& nvalue )
{
    nvalue = unbox_long_value( env, jvalue );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, uint32_t& nvalue )
{
    nvalue = unbox_long_value( env, jvalue );
}

void
convert_from_jni( JNIEnv* env, const jobject& jvalue, uint64_t& nvalue )
{
    nvalue = unbox_long_value( env, jvalue );
}

jint
unbox_int_value( JNIEnv* env, const jobject& jvalue )
{
    auto javaIntegerClass = env->FindClass( "java/lang/Integer" );
    auto intValueMethodId = env->GetMethodID( javaIntegerClass, "intValue", "()I" );
    return env->CallIntMethod( jvalue, intValueMethodId );
}

jlong
unbox_long_value( JNIEnv* env, const jobject& jvalue )
{
    auto javaLongClass = env->FindClass( "java/lang/Long" );
    auto longValueMethodId = env->GetMethodID( javaLongClass, "longValue", "()J" );
    return env->CallLongMethod( jvalue, longValueMethodId );
}

} // internal

} // here
