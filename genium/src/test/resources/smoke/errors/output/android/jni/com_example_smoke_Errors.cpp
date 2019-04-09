/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/Errors.h"
#include "foo/Bar.h"
#include "com_example_smoke_Errors.h"
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
void
Java_com_example_smoke_Errors_methodWithErrors(JNIEnv* _jenv, jobject _jinstance)
{
    auto nativeCallResult = ::smoke::Errors::method_with_errors();
    auto errorCode = nativeCallResult;
    if (errorCode)
    {
        auto nEnumValue = static_cast<::smoke::Errors::InternalError>(errorCode.value());
        auto jEnumValue = ::genium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::genium::jni::find_class(_jenv, "com/example/smoke/Errors$InternalErrorException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Errors$InternalError;)V");
        auto exception = ::genium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
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
        auto jEnumValue = ::genium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::genium::jni::find_class(_jenv, "com/example/smoke/Errors$ExternalErrorsException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Errors$ExternalErrors;)V");
        auto exception = ::genium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
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
        auto nEnumValue = static_cast<::smoke::Errors::InternalError>(errorCode.value());
        auto jEnumValue = ::genium::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::genium::jni::find_class(_jenv, "com/example/smoke/Errors$InternalErrorException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Errors$InternalError;)V");
        auto exception = ::genium::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
        return nullptr;
    }
    auto result = nativeCallResult.safe_value();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Errors_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Errors>*> (_jpointerRef);
}
}
