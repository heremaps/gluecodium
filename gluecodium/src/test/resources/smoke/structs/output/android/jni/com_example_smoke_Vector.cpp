/*
 *
 */
#include "com_example_smoke_ValidationErrorCode__Conversion.h"
#include "com_example_smoke_Vector.h"
#include "com_example_smoke_Vector__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
jdouble
Java_com_example_smoke_Vector_distanceTo(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::Vector*)nullptr);
    auto result = _ninstance.distance_to(other);
    return result;
}
jobject
Java_com_example_smoke_Vector_add(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::Vector*)nullptr);
    auto result = _ninstance.add(other);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
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
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Vector_create__Lcom_example_smoke_Vector_2(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto nativeCallResult = ::smoke::Vector::create(other);
    auto errorCode = nativeCallResult.error();
    if (!nativeCallResult.has_value())
    {
        auto nErrorValue = static_cast<::smoke::ValidationErrorCode>(errorCode.value());
        auto jErrorValue = ::gluecodium::jni::convert_to_jni(_jenv, nErrorValue);
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/ValidationException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/ValidationErrorCode;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jErrorValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
        return nullptr;
    }
    auto result = nativeCallResult.unsafe_value();
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
}
