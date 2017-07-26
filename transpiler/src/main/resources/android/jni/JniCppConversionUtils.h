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

#include <cstdint>
#include <jni.h>
#include <string>
#include <vector>

namespace here
{
namespace internal
{
// ------------------- JNI to C++ conversion functions ---------------------------------------------

/**
 * Converts a JNI jstring to a std string.
 */
std::string convert_jstring_to_std_string( JNIEnv* env, const jstring jvalue );

/**
 * Converts a jbyteArray to a vector of bytes
 */
std::vector< uint8_t > convert_jbyte_array_to_byte_vector( JNIEnv* env, const jbyteArray& jvalue );

// -------------------- C++ to JNI conversion functions --------------------------------------------

/**
 * Converts a std string to a JNI jstring
 */
jstring convert_to_jni( JNIEnv* env, const std::string& nvalue );

/**
 * Converts a vector of bytes to a jbyteArray
 */
jbyteArray convert_to_jni( JNIEnv* env, const std::vector< uint8_t >& nvalue );

// -------------------- JNI object field getters ---------------------------------------------------

jboolean get_boolean_field( JNIEnv* env,
                            const jclass javaClass,
                            const jobject object,
                            const char* fieldName );

jbyte get_byte_field( JNIEnv* env,
                      const jclass javaClass,
                      const jobject object,
                      const char* fieldName );
jshort get_short_field( JNIEnv* env,
                        const jclass javaClass,
                        const jobject object,
                        const char* fieldName );
jint get_int_field( JNIEnv* env,
                    const jclass javaClass,
                    const jobject object,
                    const char* fieldName );
jlong get_long_field( JNIEnv* env,
                      const jclass javaClass,
                      const jobject object,
                      const char* fieldName );
jfloat get_float_field( JNIEnv* env,
                        const jclass javaClass,
                        const jobject object,
                        const char* fieldName );
jdouble get_double_field( JNIEnv* env,
                          const jclass javaClass,
                          const jobject object,
                          const char* fieldName );
jobject get_object_field( JNIEnv* env,
                          const jclass javaClass,
                          const jobject object,
                          const char* fieldName,
                          const char* fieldSignature );

// -------------------- Create jobject with class definition ---------------------------------------

jobject create_object( JNIEnv* env, jclass javaClass );

// -------------------- JNI object field setters ---------------------------------------------------

void set_boolean_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, bool value );
void set_byte_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int8_t value );
void set_short_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int16_t value );
void set_int_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int32_t value );
void set_long_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, int64_t value );
void set_float_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, float value );
void set_double_field(
    JNIEnv* env, jclass javaClass, jobject object, const char* fieldName, double value );
void set_object_field( JNIEnv* env,
                       jclass javaClass,
                       jobject object,
                       const char* fieldName,
                       const char* fieldSignature,
                       jobject fieldValue );

}  // internal

}  // here
