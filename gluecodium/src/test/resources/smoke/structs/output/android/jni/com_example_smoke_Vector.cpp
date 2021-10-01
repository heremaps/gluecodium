/*
 *
 */
#include "com_example_smoke_ValidationErrorCode__Conversion.h"
#include "com_example_smoke_Vector.h"
#include "com_example_smoke_Vector__Conversion.h"
#include "JniExceptionThrower.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
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
    auto _result = _ninstance.distance_to(other);
    return _result;
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
    auto _result = _ninstance.add(other);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jboolean
Java_com_example_smoke_Vector_validate(JNIEnv* _jenv, jobject _jinstance, jdouble jx, jdouble jy)
{
    double x = jx;
    double y = jy;
    auto _result = ::smoke::Vector::validate(x,y);
    return _result;
}
jobject
Java_com_example_smoke_Vector_create__DD(JNIEnv* _jenv, jobject _jinstance, jdouble jx, jdouble jy)
{
    double x = jx;
    double y = jy;
    auto _result = ::smoke::Vector::create(x,y);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_Vector_create__Lcom_example_smoke_Vector_2(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::gluecodium::jni::JniExceptionThrower _throw_exception(_jenv);
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
        _throw_exception.register_exception(std::move(exception));
        return nullptr;
    }
    auto _result = nativeCallResult.unsafe_value();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
}
