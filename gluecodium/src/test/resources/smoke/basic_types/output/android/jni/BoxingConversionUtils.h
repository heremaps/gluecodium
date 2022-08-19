/*
 *
 */
#pragma once
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <jni.h>
namespace gluecodium
{
namespace jni
{
// The following functions are converting and boxing primitive values into Java boxed types.
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const bool nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const double nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const float nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int8_t nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int16_t nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int32_t nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int64_t nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint8_t nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint16_t nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint32_t nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint64_t nvalue );
// The following functions are unboxing and converting primitive values from Java boxed types.
JNIEXPORT bool convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, bool* );
JNIEXPORT double convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, double* );
JNIEXPORT float convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, float* );
JNIEXPORT int8_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, int8_t* );
JNIEXPORT int16_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, int16_t* );
JNIEXPORT int32_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, int32_t* );
JNIEXPORT int64_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, int64_t* );
JNIEXPORT uint8_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, uint8_t* );
JNIEXPORT uint16_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, uint16_t* );
JNIEXPORT uint32_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, uint32_t* );
JNIEXPORT uint64_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, uint64_t* );
// Boxing/unboxing conversion functions for nullable types
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<bool> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<float> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<double> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int8_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int16_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int32_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int64_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint8_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint16_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint32_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint64_t> nvalue );
JNIEXPORT ::gluecodium::optional<bool> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<bool>* );
JNIEXPORT ::gluecodium::optional<float> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<float>* );
JNIEXPORT ::gluecodium::optional<double> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<double>* );
JNIEXPORT ::gluecodium::optional<int8_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<int8_t>* );
JNIEXPORT ::gluecodium::optional<int16_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<int16_t>* );
JNIEXPORT ::gluecodium::optional<int32_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<int32_t>* );
JNIEXPORT ::gluecodium::optional<int64_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<int64_t>* );
JNIEXPORT ::gluecodium::optional<uint8_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<uint8_t>* );
JNIEXPORT ::gluecodium::optional<uint16_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<uint16_t>* );
JNIEXPORT ::gluecodium::optional<uint32_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<uint32_t>* );
JNIEXPORT ::gluecodium::optional<uint64_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, ::gluecodium::optional<uint64_t>* );
}
}
