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

#pragma once // this file will be included in struct conversion utility cpp file

#include <cstdint>
#include <jni.h>

namespace
{

// -------------------- JNI object field getters --------------------------------------------------

jboolean
get_boolean_field( JNIEnv* env,
                   const jclass javaClass,
                   const jobject object,
                   const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "Z" );

    return env->GetBooleanField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jbyte
get_byte_field( JNIEnv* env, const jclass javaClass, const jobject object, const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "B" );

    return env->GetByteField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jshort
get_short_field( JNIEnv* env, const jclass javaClass, const jobject object, const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "S" );

    return env->GetShortField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jint
get_int_field( JNIEnv* env, const jclass javaClass, const jobject object, const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "I" );

    return env->GetIntField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jlong
get_long_field( JNIEnv* env, const jclass javaClass, const jobject object, const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "J" );

    return env->GetLongField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jfloat
get_float_field( JNIEnv* env, const jclass javaClass, const jobject object, const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "F" );

    return env->GetFloatField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jdouble
get_double_field( JNIEnv* env, const jclass javaClass, const jobject object, const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "D" );

    return env->GetDoubleField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jstring
get_string_field( JNIEnv* env, const jclass javaClass, const jobject object, const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "L/java/lang/String;" );

    return ( jstring )env->GetObjectField( object, fieldId );
}

// -------------------------------------------------------------------------------------------------

jobject
get_object_field( JNIEnv* env,
                  const jclass javaClass,
                  const jobject object,
                  const char* fieldName,
                  const char* fieldSignature )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, fieldSignature );

    return env->GetObjectField( object, fieldId );
}

// -------------------- JNI object constructor ----------------------------------------------------

jobject
create_object( JNIEnv* env, jclass javaClass )
{
    const char* name = "<init>";
    const char* signature = "()V";
    auto theConstructor = env->GetMethodID( javaClass, name, signature );

    return env->NewObject( javaClass, theConstructor );
}

// -------------------- JNI object field setters --------------------------------------------------

void
set_boolean_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, bool value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "Z" );
    env->SetBooleanField( object, fieldID, value );
}

// -------------------------------------------------------------------------------------------------

void
set_byte_field( JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int8_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "B" );
    env->SetByteField( object, fieldID, value );
}

// -------------------------------------------------------------------------------------------------

void
set_short_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int16_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "S" );
    env->SetShortField( object, fieldID, value );
}

// -------------------------------------------------------------------------------------------------

void
set_int_field( JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int32_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "I" );
    env->SetIntField( object, fieldID, value );
}

// -------------------------------------------------------------------------------------------------

void
set_long_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int64_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "J" );
    env->SetLongField( object, fieldID, value );
}

// -------------------------------------------------------------------------------------------------

void
set_float_field( JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, float value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "F" );
    env->SetFloatField( object, fieldID, value );
}

// -------------------------------------------------------------------------------------------------

void
set_double_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, double value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "D" );
    env->SetDoubleField( object, fieldID, value );
}

// -------------------------------------------------------------------------------------------------

void
set_string_field( JNIEnv* env,
                  const jclass javaClass,
                  const jobject object,
                  const char* fieldName,
                  jstring fieldValue )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "L/java/lang/String;" );

    return env->SetObjectField( object, fieldId, fieldValue );
}

// -------------------------------------------------------------------------------------------------

void
set_object_field( JNIEnv* env,
                  jclass javaClass,
                  jobject object,
                  const char* fieldName,
                  const char* fieldSignature,
                  jobject fieldValue )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, fieldSignature );
    env->SetObjectField( object, fieldID, fieldValue );
}
} // namespace
