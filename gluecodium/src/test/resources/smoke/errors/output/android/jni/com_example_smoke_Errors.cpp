/*
 *
 */
#include "com_example_smoke_Errors.h"
#include "com_example_smoke_Errors_ExternalErrors__Conversion.h"
#include "com_example_smoke_Errors_InternalErrorCode__Conversion.h"
#include "com_example_smoke_Errors__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
void
Java_com_example_smoke_Errors_methodWithErrors(JNIEnv* _jenv, jobject _jinstance)
{
    auto nativeCallResult = ::smoke::Errors::method_with_errors();
    auto errorCode = nativeCallResult;
    if (errorCode)
    {
        auto nEnumValue = static_cast<::smoke::Errors::InternalErrorCode>(errorCode.value());
        auto jEnumValue = ::gluecodium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Errors$InternalException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Errors$InternalErrorCode;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
    }
}
void
Java_com_example_smoke_Errors_methodWithExternalErrors(JNIEnv* _jenv, jobject _jinstance)
{
    auto nativeCallResult = ::smoke::Errors::method_with_external_errors();
    auto errorCode = nativeCallResult;
    if (errorCode)
    {
        auto nEnumValue = static_cast<::fire::SomeEnum>(errorCode.value());
        auto jEnumValue = ::gluecodium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Errors$ExternalException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Errors$ExternalErrors;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
    }
}
jstring
Java_com_example_smoke_Errors_methodWithErrorsAndReturnValue(JNIEnv* _jenv, jobject _jinstance)
{
    auto nativeCallResult = ::smoke::Errors::method_with_errors_and_return_value();
    auto errorCode = nativeCallResult.error();
    if (!nativeCallResult.has_value())
    {
        auto nEnumValue = static_cast<::smoke::Errors::InternalErrorCode>(errorCode.value());
        auto jEnumValue = ::gluecodium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Errors$InternalException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Errors$InternalErrorCode;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
        return nullptr;
    }
    auto result = nativeCallResult.unsafe_value();
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Errors_methodWithAliasedError(JNIEnv* _jenv, jobject _jinstance)
{
    auto nativeCallResult = ::smoke::Errors::method_with_aliased_error();
    auto errorCode = nativeCallResult;
    if (errorCode)
    {
        auto nEnumValue = static_cast<::smoke::Errors::InternalErrorCode>(errorCode.value());
        auto jEnumValue = ::gluecodium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Errors$InternalException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Errors$InternalErrorCode;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
    }
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Errors_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Errors>*> (_jpointerRef);
}
}
