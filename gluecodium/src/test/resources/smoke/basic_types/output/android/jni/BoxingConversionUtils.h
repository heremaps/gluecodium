/*

 *
 */

#pragma once

#include "JniReference.h"
#include "JniTypeId.h"

#include <jni.h>
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
// The following functions are converting and boxing primitive values into Java boxed types.

JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const bool nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const double nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const float nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int8_t nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int16_t nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int32_t nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const int64_t nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint8_t nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint16_t nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint32_t nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, const uint64_t nvalue ) noexcept;

// The following functions are unboxing and converting primitive values from Java boxed types.

JNIEXPORT bool convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<bool> ) noexcept;
JNIEXPORT double convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<double> ) noexcept;
JNIEXPORT float convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<float> ) noexcept;
JNIEXPORT int8_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int8_t> ) noexcept;
JNIEXPORT int16_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int16_t> ) noexcept;
JNIEXPORT int32_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int32_t> ) noexcept;
JNIEXPORT int64_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int64_t> ) noexcept;
JNIEXPORT uint8_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint8_t> ) noexcept;
JNIEXPORT uint16_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint16_t> ) noexcept;
JNIEXPORT uint32_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint32_t> ) noexcept;
JNIEXPORT uint64_t convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint64_t> ) noexcept;

// Boxing/unboxing conversion functions for nullable types

JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<bool> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<float> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<double> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int8_t> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int16_t> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int32_t> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<int64_t> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint8_t> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint16_t> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint32_t> nvalue ) noexcept;
JNIEXPORT JniReference<jobject> convert_to_jni( JNIEnv* env, ::gluecodium::optional<uint64_t> nvalue ) noexcept;

JNIEXPORT ::gluecodium::optional<bool> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<bool>> ) noexcept;
JNIEXPORT ::gluecodium::optional<float> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<float>> ) noexcept;
JNIEXPORT ::gluecodium::optional<double> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<double>> ) noexcept;
JNIEXPORT ::gluecodium::optional<int8_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<int8_t>> ) noexcept;
JNIEXPORT ::gluecodium::optional<int16_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<int16_t>> ) noexcept;
JNIEXPORT ::gluecodium::optional<int32_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<int32_t>> ) noexcept;
JNIEXPORT ::gluecodium::optional<int64_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<int64_t>> ) noexcept;
JNIEXPORT ::gluecodium::optional<uint8_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<uint8_t>> ) noexcept;
JNIEXPORT ::gluecodium::optional<uint16_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<uint16_t>> ) noexcept;
JNIEXPORT ::gluecodium::optional<uint32_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<uint32_t>> ) noexcept;
JNIEXPORT ::gluecodium::optional<uint64_t> convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<::gluecodium::optional<uint64_t>> ) noexcept;

}
}
