#include <memory>
#include <new>
#include "smoke/SimpleInstantiableOne.h"
#include "android/jni/com_example_smoke_SimpleInstantiableOne.h"
#include "android/jni/CppProxyBase.h"
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/JniBase.h"
#include "android/jni/JniCppConversionUtils.h"
#include "smoke/SimpleInstantiableTwo.h"
#include "android/jni/com_example_smoke_SimpleInstantiableTwo.h"
#include "smoke/NestedInstantiableOne.h"
#include "android/jni/com_example_smoke_NestedInstantiableOne.h"
#include "smoke/NestedInstantiableTwo.h"
#include "android/jni/com_example_smoke_NestedInstantiableTwo.h"
#include "smoke/InstanceWithStruct.h"
#include "android/jni/com_example_smoke_InstanceWithStruct.h"
#include "android/jni/InstanceConversion.h"
#include "android/jni/ArrayConversionUtils.h"

namespace transpiler {
namespace jni {

jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleInstantiableOne> & _ninput)
{
    if (!_ninput)
    {
        return nullptr;
    }
    auto javaClass = _jenv->FindClass("com/example/smoke/SimpleInstantiableOne");
    auto pInstanceSharedPointer = new (::std::nothrow) ::std::shared_ptr<::smoke::SimpleInstantiableOne>(_ninput);
    if (pInstanceSharedPointer == nullptr)
    {
        jclass exceptionClass = _jenv->FindClass("java/lang/RuntimeException");
        _jenv->ThrowNew(exceptionClass, "Cannot allocate native memory.");
        _jenv->DeleteLocalRef( exceptionClass );
    }
    jobject jResult = transpiler::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
    _jenv->DeleteLocalRef( javaClass );
    return jResult;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleInstantiableTwo> & _ninput)
{
    if (!_ninput)
    {
        return nullptr;
    }
    auto javaClass = _jenv->FindClass("com/example/smoke/SimpleInstantiableTwo");
    auto pInstanceSharedPointer = new (::std::nothrow) ::std::shared_ptr<::smoke::SimpleInstantiableTwo>(_ninput);
    if (pInstanceSharedPointer == nullptr)
    {
        jclass exceptionClass = _jenv->FindClass("java/lang/RuntimeException");
        _jenv->ThrowNew(exceptionClass, "Cannot allocate native memory.");
        _jenv->DeleteLocalRef( exceptionClass );
    }
    jobject jResult = transpiler::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
    _jenv->DeleteLocalRef( javaClass );
    return jResult;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::NestedInstantiableOne> & _ninput)
{
    if (!_ninput)
    {
        return nullptr;
    }
    auto javaClass = _jenv->FindClass("com/example/smoke/NestedInstantiableOne");
    auto pInstanceSharedPointer = new (::std::nothrow) ::std::shared_ptr<::smoke::NestedInstantiableOne>(_ninput);
    if (pInstanceSharedPointer == nullptr)
    {
        jclass exceptionClass = _jenv->FindClass("java/lang/RuntimeException");
        _jenv->ThrowNew(exceptionClass, "Cannot allocate native memory.");
        _jenv->DeleteLocalRef( exceptionClass );
    }
    jobject jResult = transpiler::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
    _jenv->DeleteLocalRef( javaClass );
    return jResult;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::NestedInstantiableTwo> & _ninput)
{
    if (!_ninput)
    {
        return nullptr;
    }
    auto javaClass = _jenv->FindClass("com/example/smoke/NestedInstantiableTwo");
    auto pInstanceSharedPointer = new (::std::nothrow) ::std::shared_ptr<::smoke::NestedInstantiableTwo>(_ninput);
    if (pInstanceSharedPointer == nullptr)
    {
        jclass exceptionClass = _jenv->FindClass("java/lang/RuntimeException");
        _jenv->ThrowNew(exceptionClass, "Cannot allocate native memory.");
        _jenv->DeleteLocalRef( exceptionClass );
    }
    jobject jResult = transpiler::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
    _jenv->DeleteLocalRef( javaClass );
    return jResult;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::InstanceWithStruct> & _ninput)
{
    if (!_ninput)
    {
        return nullptr;
    }
    auto javaClass = _jenv->FindClass("com/example/smoke/InstanceWithStruct");
    auto pInstanceSharedPointer = new (::std::nothrow) ::std::shared_ptr<::smoke::InstanceWithStruct>(_ninput);
    if (pInstanceSharedPointer == nullptr)
    {
        jclass exceptionClass = _jenv->FindClass("java/lang/RuntimeException");
        _jenv->ThrowNew(exceptionClass, "Cannot allocate native memory.");
        _jenv->DeleteLocalRef( exceptionClass );
    }
    jobject jResult = transpiler::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
    _jenv->DeleteLocalRef( javaClass );
    return jResult;
}

}
}
