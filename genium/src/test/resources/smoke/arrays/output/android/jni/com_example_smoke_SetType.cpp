/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/SetType.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_SetType.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jobject
Java_com_example_smoke_SetType_stringSetRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::SetType::StringSet input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::smoke::SetType::StringSet*)nullptr);
    auto result = ::smoke::SetType::string_set_round_trip(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_SetType_enumSetRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::SetType::EnumSet input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::smoke::SetType::EnumSet*)nullptr);
    auto result = ::smoke::SetType::enum_set_round_trip(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_SetType_nullableIntSetRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< ::smoke::SetType::IntSet > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< ::smoke::SetType::IntSet >*)nullptr);
    auto result = ::smoke::SetType::nullable_int_set_round_trip(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_SetType_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::SetType>*> (_jpointerRef);
}
}
