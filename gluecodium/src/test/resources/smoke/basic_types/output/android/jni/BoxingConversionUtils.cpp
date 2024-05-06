/*

 *
 */

#include "BoxingConversionUtils.h"

#include "JniCallJavaMethod.h"
#include "JniCppConversionUtils.h"

namespace
{
template<typename T>
::gluecodium::jni::JniReference<jobject>
box_value_in_object( JNIEnv* env, const char* className, const char* signature, T param )
{
    auto javaClass = ::gluecodium::jni::find_class(env, className );
    auto theConstructor = env->GetMethodID( javaClass.get(), "<init>", signature );
    return ::gluecodium::jni::new_object(env, javaClass, theConstructor, param );
}

jint
unbox_short_value( JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& jvalue )
{
    auto javaIntegerClass = ::gluecodium::jni::find_class( env, "java/lang/Short" );
    auto intValueMethodId = env->GetMethodID( javaIntegerClass.get(), "shortValue", "()S" );
    return ::gluecodium::jni::call_java_method<jshort>( env, jvalue, intValueMethodId );
}

jint
unbox_int_value( JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& jvalue )
{
    auto javaIntegerClass = ::gluecodium::jni::find_class( env, "java/lang/Integer" );
    auto intValueMethodId = env->GetMethodID( javaIntegerClass.get(), "intValue", "()I" );
    return ::gluecodium::jni::call_java_method<jint>( env, jvalue, intValueMethodId );
}

jlong
unbox_long_value( JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& jvalue )
{
    auto javaLongClass = ::gluecodium::jni::find_class( env, "java/lang/Long" );
    auto longValueMethodId = env->GetMethodID( javaLongClass.get(), "longValue", "()J" );
    return ::gluecodium::jni::call_java_method<jlong>( env, jvalue, longValueMethodId );
}

template<typename T>
::gluecodium::jni::JniReference<jobject>
box_uint_in_object( JNIEnv* env, T param )
{
    auto javaClass = ::gluecodium::jni::find_class(env, "java/lang/Long" );
    auto theConstructor = env->GetMethodID( javaClass.get(), "<init>", "(J)V" );
    return new_object(env, javaClass, theConstructor, static_cast< int64_t >( param ) );
}

template<>
::gluecodium::jni::JniReference<jobject>
box_uint_in_object( JNIEnv* env, uint8_t param )
{
    auto javaClass = ::gluecodium::jni::find_class(env, "java/lang/Short" );
    auto theConstructor = env->GetMethodID( javaClass.get(), "<init>", "(S)V" );
    return new_object(env, javaClass, theConstructor, static_cast< int16_t >( param ) );
}

template<>
::gluecodium::jni::JniReference<jobject>
box_uint_in_object( JNIEnv* env, uint16_t param )
{
    auto javaClass = ::gluecodium::jni::find_class(env, "java/lang/Integer" );
    auto theConstructor = env->GetMethodID( javaClass.get(), "<init>", "(I)V" );
    return new_object(env, javaClass, theConstructor, static_cast< int32_t >( param ) );
}
}

namespace gluecodium
{
namespace jni
{
JniReference<jobject>
convert_to_jni( JNIEnv* env, const bool nvalue )
{
    return box_value_in_object<jboolean>( env, "java/lang/Boolean", "(Z)V", nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const double nvalue )
{
    return box_value_in_object<jdouble>( env, "java/lang/Double", "(D)V", nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const float nvalue )
{
    return box_value_in_object<jfloat>( env, "java/lang/Float", "(F)V", nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const int8_t nvalue )
{
    return box_value_in_object<jbyte>( env, "java/lang/Byte", "(B)V", nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const int16_t nvalue )
{
    return box_value_in_object<jshort>( env, "java/lang/Short", "(S)V", nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const int32_t nvalue )
{
    return box_value_in_object<jint>( env, "java/lang/Integer", "(I)V", nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const int64_t nvalue )
{
    return box_value_in_object<jlong>( env, "java/lang/Long", "(J)V", nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const uint8_t nvalue )
{
    return box_uint_in_object( env, nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const uint16_t nvalue )
{
    return box_uint_in_object( env, nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const uint32_t nvalue )
{
    return box_uint_in_object( env, nvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, const uint64_t nvalue )
{
    return box_uint_in_object( env, nvalue );
}

bool
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<bool> )
{
    auto javaBooleanClass = find_class( env, "java/lang/Boolean" );
    auto booleanValueMethodId = env->GetMethodID( javaBooleanClass.get(), "booleanValue", "()Z" );
    return call_java_method<jboolean>( env, jvalue, booleanValueMethodId );
}

double
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<double> )
{
    auto javaDoubleClass = find_class( env, "java/lang/Double" );
    auto doubleValueMethodId = env->GetMethodID( javaDoubleClass.get(), "doubleValue", "()D" );
    return call_java_method<jdouble>( env, jvalue, doubleValueMethodId );
}

float
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<float> )
{
    auto javaFloatClass = find_class( env, "java/lang/Float" );
    auto floatValueMethodId = env->GetMethodID( javaFloatClass.get(), "floatValue", "()F" );
    return call_java_method<jfloat>( env, jvalue, floatValueMethodId );
}

int8_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int8_t> )
{
    auto javaByteClass = find_class( env, "java/lang/Byte" );
    auto byteValueMethodId = env->GetMethodID( javaByteClass.get(), "byteValue", "()B" );
    return call_java_method<jbyte>( env, jvalue, byteValueMethodId );
}

int16_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int16_t> )
{
    auto javaShortClass = find_class(env, "java/lang/Short" );
    auto shortValueMethodId = env->GetMethodID( javaShortClass.get(), "shortValue", "()S" );
    return call_java_method<jshort>( env, jvalue, shortValueMethodId );
}

int32_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int32_t> )
{
    return unbox_int_value( env, jvalue );
}

int64_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<int64_t> )
{
    return unbox_long_value( env, jvalue );
}

uint8_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint8_t> )
{
    return unbox_short_value( env, jvalue );
}

uint16_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint16_t> )
{
    return unbox_int_value( env, jvalue );
}

uint32_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint32_t> )
{
    return unbox_long_value( env, jvalue );
}

uint64_t
convert_from_jni( JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<uint64_t> )
{
    return unbox_long_value( env, jvalue );
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<bool> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<float> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<double> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<int8_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<int16_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<int32_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<int64_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<uint8_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<uint16_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<uint32_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

JniReference<jobject>
convert_to_jni( JNIEnv* env, std::optional<uint64_t> nvalue )
{
    return nvalue ? convert_to_jni( env, *nvalue ) : JniReference<jobject>{};
}

std::optional<bool>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<bool>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<jboolean>( env, jvalue, "booleanValue", "()Z" );
    return std::optional<bool>( unboxedValue );
}

std::optional<float>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<float>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<jfloat>( env, jvalue, "floatValue", "()F" );
    return std::optional<float>( unboxedValue );
}

std::optional<double>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<double>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<jdouble>( env, jvalue, "doubleValue", "()D" );
    return std::optional<double>( unboxedValue );
}

std::optional<int8_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int8_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int8_t>( env, jvalue, "byteValue", "()B" );
    return std::optional<int8_t>( unboxedValue );
}

std::optional<int16_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int16_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int16_t>( env, jvalue, "shortValue", "()S" );
    return std::optional<int16_t>( unboxedValue );
}

std::optional<int32_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int32_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int32_t>( env, jvalue, "intValue", "()I" );
    return std::optional<int32_t>( unboxedValue );
}

std::optional<int64_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<int64_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int64_t>( env, jvalue, "longValue", "()J" );
    return std::optional<int64_t>( unboxedValue );
}

std::optional<uint8_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint8_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int16_t>( env, jvalue, "shortValue", "()S" );
    return std::optional<uint8_t>( static_cast<uint8_t>( unboxedValue ) );
}

std::optional<uint16_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint16_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int32_t>( env, jvalue, "intValue", "()I" );
    return std::optional<uint16_t>( static_cast<uint16_t>( unboxedValue ) );
}

std::optional<uint32_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint32_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int64_t>( env, jvalue, "longValue", "()J" );
    return std::optional<uint32_t>( static_cast<uint32_t>( unboxedValue ) );
}

std::optional<uint64_t>
convert_from_jni(
    JNIEnv* env, const JniReference<jobject>& jvalue, TypeId<std::optional<uint64_t>> )
{
    if ( !jvalue )
    {
        return {};
    }
    auto unboxedValue = call_java_method<int64_t>( env, jvalue, "longValue", "()J" );
    return std::optional<uint64_t>( static_cast<uint64_t>( unboxedValue ) );
}

}
}
