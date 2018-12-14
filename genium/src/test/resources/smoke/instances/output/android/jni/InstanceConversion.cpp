#include <memory>
#include <new>
#include "smoke/SimpleInstantiable.h"
#include "com_example_smoke_SimpleInstantiable.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "smoke/NestedInstantiable.h"
#include "com_example_smoke_NestedInstantiable.h"
#include "smoke/InstanceWithStruct.h"
#include "com_example_smoke_InstanceWithStruct.h"
#include "InstanceConversion.h"
#include "ArrayConversionUtils.h"
namespace genium {
namespace jni {
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleInstantiable> & _ninput)
{
    if ( !_ninput )
    {
        return nullptr;
    }
    auto jResult = genium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult != nullptr )
    {
        return jResult;
    }
    auto javaClass = find_class(_jenv, "com/example/smoke/SimpleInstantiable" );
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::SimpleInstantiable>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/RuntimeException" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::NestedInstantiable> & _ninput)
{
    if ( !_ninput )
    {
        return nullptr;
    }
    auto jResult = genium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult != nullptr )
    {
        return jResult;
    }
    auto javaClass = find_class(_jenv, "com/example/smoke/NestedInstantiable" );
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::NestedInstantiable>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/RuntimeException" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::InstanceWithStruct> & _ninput)
{
    if ( !_ninput )
    {
        return nullptr;
    }
    auto jResult = genium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult != nullptr )
    {
        return jResult;
    }
    auto javaClass = find_class(_jenv, "com/example/smoke/InstanceWithStruct" );
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::InstanceWithStruct>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/RuntimeException" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
}
}