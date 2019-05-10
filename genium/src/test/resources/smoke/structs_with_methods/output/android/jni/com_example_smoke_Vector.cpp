/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/StructsWithMethods.h"
#include "com_example_smoke_Vector.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniReference.h"
extern "C" {
jdouble
Java_com_example_smoke_Vector_distanceTo(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto _ninstance = ::genium::jni::convert_from_jni(_jenv,
        ::genium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::Vector*)nullptr);
    auto result = _ninstance.distance_to(other);
    return result;
}
jobject
Java_com_example_smoke_Vector_add(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto _ninstance = ::genium::jni::convert_from_jni(_jenv,
        ::genium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::Vector*)nullptr);
    auto result = _ninstance.add(other);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jboolean
Java_com_example_smoke_Vector_validate(JNIEnv* _jenv, jobject _jinstance, jdouble jx, jdouble jy)
{
    double x = jx;
    double y = jy;
    auto result = ::smoke::Vector::validate(x,y);
    return result;
}
jobject
Java_com_example_smoke_Vector_create__DD(JNIEnv* _jenv, jobject _jinstance, jdouble jx, jdouble jy)
{
    double x = jx;
    double y = jy;
    auto result = ::smoke::Vector::create(x,y);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Vector_create__Lcom_example_smoke_Vector_2(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto nativeCallResult = ::smoke::Vector::create(other);
    auto errorCode = nativeCallResult.error();
    if (!nativeCallResult.has_value())
    {
        auto nEnumValue = static_cast<::smoke::ValidationError>(errorCode.value());
        auto jEnumValue = ::genium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::genium::jni::find_class(_jenv, "com/example/smoke/ValidationErrorException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/ValidationError;)V");
        auto exception = ::genium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
        return nullptr;
    }
    auto result = nativeCallResult.safe_value();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
}
