#include <memory>
#include <new>
#include "smoke/SimpleInstantiableOne.h"
#include "com_example_smoke_SimpleInstantiableOne.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "smoke/SimpleInstantiableTwo.h"
#include "com_example_smoke_SimpleInstantiableTwo.h"
#include "smoke/NestedInstantiableOne.h"
#include "com_example_smoke_NestedInstantiableOne.h"
#include "smoke/NestedInstantiableTwo.h"
#include "com_example_smoke_NestedInstantiableTwo.h"
#include "smoke/InstanceWithStruct.h"
#include "com_example_smoke_InstanceWithStruct.h"
#include "InstanceConversion.h"
#include "ArrayConversionUtils.h"

namespace genium {
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
    jobject jResult = genium::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
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
    jobject jResult = genium::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
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
    jobject jResult = genium::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
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
    jobject jResult = genium::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
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
    jobject jResult = genium::jni::create_instance_object(_jenv, javaClass, reinterpret_cast<jlong> (pInstanceSharedPointer));
    _jenv->DeleteLocalRef( javaClass );
    return jResult;
}

}
}
