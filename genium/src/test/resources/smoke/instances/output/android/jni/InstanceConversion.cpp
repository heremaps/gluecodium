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
#include "JniClassCache.h"
namespace
{
struct DummyNativeBaseType {};
}
namespace genium
{
namespace jni
{
REGISTER_JNI_CLASS_CACHE("com/example/NativeBase", DummyNativeBaseType)
JniReference<jclass>& get_cached_native_base_class()
{
    return CachedJavaClass<DummyNativeBaseType>::java_class;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/SimpleInstantiable", ::smoke::SimpleInstantiable)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleInstantiable> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::genium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::SimpleInstantiable>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::SimpleInstantiable>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/NestedInstantiable", ::smoke::NestedInstantiable)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::NestedInstantiable> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::genium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::NestedInstantiable>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::NestedInstantiable>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/InstanceWithStruct", ::smoke::InstanceWithStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::InstanceWithStruct> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::genium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::InstanceWithStruct>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::InstanceWithStruct>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
}
}
