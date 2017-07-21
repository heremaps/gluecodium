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

std::string
here::internal::convert_jstring_to_std_string( JNIEnv* env, const jstring jvalue )
{
    const char* jbuffer = env->GetStringUTFChars( jvalue, nullptr );
    std::string nresult = std::string( jbuffer );
    env->ReleaseStringUTFChars( jvalue, jbuffer );

    return nresult;
}

std::vector< uint8_t >
here::internal::convert_jbyte_array_to_byte_vector( JNIEnv* env, const jbyteArray& jvalue )
{
    size_t size = static_cast< size_t >( env->GetArrayLength( jvalue ) );
    std::vector< uint8_t > nresult( size );
    jbyte* jbuffer = reinterpret_cast< jbyte* >( nresult.data( ) );
    env->GetByteArrayRegion( jvalue, 0, size, jbuffer );

    return nresult;
}

// -------------------- C++ to JNI conversion functions --------------------------------------------

jstring
here::internal::convert_std_string_to_jstring( JNIEnv* env, const std::string& nvalue )
{
    return env->NewStringUTF( nvalue.c_str( ) );
}

jbyteArray
here::internal::convert_byte_vector_to_jbyte_array( JNIEnv* env,
                                                    const std::vector< uint8_t >& nvalue )
{
    jsize size = static_cast< jsize >( nvalue.size( ) );
    jbyteArray jresult = env->NewByteArray( size );
    const jbyte* jbuffer = reinterpret_cast< const jbyte* >( nvalue.data( ) );
    env->SetByteArrayRegion( jresult, 0, size, jbuffer );

    return jresult;
}

// -------------------- JNI object field getters --------------------------------------------------

jboolean
here::internal::get_boolean_field( JNIEnv* env,
                                   const jclass javaClass,
                                   const jobject object,
                                   const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "Z" );
    return env->GetBooleanField( object, fieldId );
}

jbyte
here::internal::get_byte_field( JNIEnv* env,
                                const jclass javaClass,
                                const jobject object,
                                const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "B" );
    return env->GetByteField( object, fieldId );
}

jshort
here::internal::get_short_field( JNIEnv* env,
                                 const jclass javaClass,
                                 const jobject object,
                                 const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "S" );
    return env->GetShortField( object, fieldId );
}

jint
here::internal::get_int_field( JNIEnv* env,
                               const jclass javaClass,
                               const jobject object,
                               const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "I" );
    return env->GetIntField( object, fieldId );
}

jlong
here::internal::get_long_field( JNIEnv* env,
                                const jclass javaClass,
                                const jobject object,
                                const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "J" );
    return env->GetLongField( object, fieldId );
}

jfloat
here::internal::get_float_field( JNIEnv* env,
                                 const jclass javaClass,
                                 const jobject object,
                                 const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "F" );
    return env->GetFloatField( object, fieldId );
}

jdouble
here::internal::get_double_field( JNIEnv* env,
                                  const jclass javaClass,
                                  const jobject object,
                                  const char* fieldName )
{
    auto fieldId = env->GetFieldID( javaClass, fieldName, "D" );
    return env->GetDoubleField( object, fieldId );
}

jobject
here::internal::get_object_field( JNIEnv* env,
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
here::internal::create_object( JNIEnv* env, jclass javaClass )
{
    const char* name = "<init>";
    const char* signature = "()V";
    auto theConstructor = env->GetMethodID( javaClass, name, signature );
    return env->NewObject( javaClass, theConstructor );
}

// -------------------- JNI object field setters --------------------------------------------------

void
here::internal::set_boolean_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, bool value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "Z" );
    env->SetBooleanField( object, fieldID, value );
}

void
here::internal::set_byte_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int8_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "B" );
    env->SetByteField( object, fieldID, value );
}

void
here::internal::set_short_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int16_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "S" );
    env->SetShortField( object, fieldID, value );
}

void
here::internal::set_int_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int32_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "I" );
    env->SetIntField( object, fieldID, value );
}

void
here::internal::set_long_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int64_t value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "J" );
    env->SetLongField( object, fieldID, value );
}

void
here::internal::set_float_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, float value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "F" );
    env->SetFloatField( object, fieldID, value );
}

void
here::internal::set_double_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, double value )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, "D" );
    env->SetDoubleField( object, fieldID, value );
}

void
here::internal::set_object_field( JNIEnv* env,
                                  jclass javaClass,
                                  jobject object,
                                  const char* fieldName,
                                  const char* fieldSignature,
                                  jobject fieldValue )
{
    auto fieldID = env->GetFieldID( javaClass, fieldName, fieldSignature );
    env->SetObjectField( object, fieldID, fieldValue );
}
}
