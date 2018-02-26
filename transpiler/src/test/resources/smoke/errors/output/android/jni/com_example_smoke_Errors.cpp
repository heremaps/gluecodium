/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/Errors.h"
#include "android/jni/com_example_smoke_Errors.h"
#include "android/jni/JniCppConversionUtils.h"
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/CppProxyBase.h"
#include "android/jni/JniBase.h"
#include "android/jni/InstanceConversion.h"
#include "android/jni/StructConversion.h"
#include "android/jni/ProxyConversion.h"
#include "android/jni/EnumConversion.h"
#include "android/jni/ArrayConversionUtils.h"
extern "C" {
void
Java_com_example_smoke_Errors_methodWithErrors(JNIEnv* _jenv, jobject _jinstance)
{
    auto nativeCallResult = ::smoke::Errors::method_with_errors();
    auto errorCode = nativeCallResult;
    if (errorCode)
    {
        auto nEnumValue = static_cast<::smoke::Errors::InternalError>(errorCode.value());
        auto jEnumValue = here::internal::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = _jenv->FindClass("com/example/smoke/InternalErrorException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass, "<init>", "(Lcom/example/smoke/Errors$InternalError;)V");
        auto exception = _jenv->NewObject(exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception));
    }
}
void
Java_com_example_smoke_Errors_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Errors>*> (_jpointerRef);
}
}
