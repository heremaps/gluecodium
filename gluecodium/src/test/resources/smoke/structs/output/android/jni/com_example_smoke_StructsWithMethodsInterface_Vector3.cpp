/*
 *
 */
#include "com_example_smoke_StructsWithMethodsInterface_Vector3.h"
#include "com_example_smoke_StructsWithMethodsInterface_Vector3__Conversion.h"
#include "com_example_smoke_ValidationErrorCode__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
jdouble
Java_com_example_smoke_StructsWithMethodsInterface_00024Vector3_distanceTo(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::StructsWithMethodsInterface::Vector3 other = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jother),
            (::smoke::StructsWithMethodsInterface::Vector3*)nullptr);
    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::StructsWithMethodsInterface::Vector3*)nullptr);
    auto result = _ninstance.distance_to(other);
    return result;
}
jobject
Java_com_example_smoke_StructsWithMethodsInterface_00024Vector3_add(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::StructsWithMethodsInterface::Vector3 other = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jother),
            (::smoke::StructsWithMethodsInterface::Vector3*)nullptr);
    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::StructsWithMethodsInterface::Vector3*)nullptr);
    auto result = _ninstance.add(other);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jboolean
Java_com_example_smoke_StructsWithMethodsInterface_00024Vector3_validate(JNIEnv* _jenv, jobject _jinstance, jdouble jx, jdouble jy, jdouble jz)
{
    double x = jx;
    double y = jy;
    double z = jz;
    auto result = ::smoke::StructsWithMethodsInterface::Vector3::validate(x,y,z);
    return result;
}
jobject
Java_com_example_smoke_StructsWithMethodsInterface_00024Vector3_create__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput)
{
    ::std::string input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::string*)nullptr);
    auto result = ::smoke::StructsWithMethodsInterface::Vector3::create(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_StructsWithMethodsInterface_00024Vector3_create__Lcom_example_smoke_StructsWithMethodsInterface_00024Vector3_2(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::StructsWithMethodsInterface::Vector3 other = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jother),
            (::smoke::StructsWithMethodsInterface::Vector3*)nullptr);
    auto nativeCallResult = ::smoke::StructsWithMethodsInterface::Vector3::create(other);
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
