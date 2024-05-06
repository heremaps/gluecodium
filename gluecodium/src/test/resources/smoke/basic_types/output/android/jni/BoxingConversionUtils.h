/*

 *
 */

#pragma once

#include "JniReference.h"
#include "JniTypeId.h"

#include <jni.h>
#include <optional>

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

JNIEXPORT bool convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<bool> );
JNIEXPORT double convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<double> );
JNIEXPORT float convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<float> );
JNIEXPORT int8_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int8_t> );
JNIEXPORT int16_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int16_t> );
JNIEXPORT int32_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int32_t> );
JNIEXPORT int64_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int64_t> );
JNIEXPORT uint8_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint8_t> );
JNIEXPORT uint16_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint16_t> );
JNIEXPORT uint32_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint32_t> );
JNIEXPORT uint64_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint64_t> );

// Boxing/unboxing conversion functions for nullable types

JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<bool> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<float> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<double> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<int8_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<int16_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<int32_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<int64_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<uint8_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<uint16_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<uint32_t> nvalue );
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, std::optional<uint64_t> nvalue );

JNIEXPORT std::optional<bool> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<bool>> );
JNIEXPORT std::optional<float> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<float>> );
JNIEXPORT std::optional<double> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<double>> );
JNIEXPORT std::optional<int8_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int8_t>> );
JNIEXPORT std::optional<int16_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int16_t>> );
JNIEXPORT std::optional<int32_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int32_t>> );
JNIEXPORT std::optional<int64_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int64_t>> );
JNIEXPORT std::optional<uint8_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint8_t>> );
JNIEXPORT std::optional<uint16_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint16_t>> );
JNIEXPORT std::optional<uint32_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint32_t>> );
JNIEXPORT std::optional<uint64_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint64_t>> );

}
}
