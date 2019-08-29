#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_ExternalClass.h"
#include "com_example_smoke_ExternalInterfaceImpl.h"
#include "com_example_smoke_SimpleClass.h"
#include "com_example_smoke_SimpleInterfaceImpl.h"
#include "com_example_smoke_forward_Class1.h"
#include "com_example_smoke_forward_Class2.h"
#include "com_example_smoke_forward_UseForwardImpl.h"
#include "foo/Bar.h"
#include "smoke/SimpleClass.h"
#include "smoke/SimpleInterface.h"
#include "smoke/forward/Class1.h"
#include "smoke/forward/Class2.h"
#include "smoke/forward/UseForward.h"
#include <memory>
#include <new>
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
REGISTER_JNI_CLASS_CACHE("com/example/smoke/ExternalClass", ::fire::Baz)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::fire::Baz> & _ninput)
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
    auto &javaClass = CachedJavaClass<::fire::Baz>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::fire::Baz>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ExternalInterfaceImpl", "smoke_ExternalInterface", ::smoke::ExternalInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::ExternalInterface> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::ExternalInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::ExternalInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::ExternalInterface>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/SimpleClass", ::smoke::SimpleClass)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleClass> & _ninput)
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
    auto &javaClass = CachedJavaClass<::smoke::SimpleClass>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::SimpleClass>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/SimpleInterfaceImpl", "smoke_SimpleInterface", ::smoke::SimpleInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleInterface> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::SimpleInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::SimpleInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::SimpleInterface>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/forward/Class1", ::smoke::forward::Class1)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::forward::Class1> & _ninput)
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
    auto &javaClass = CachedJavaClass<::smoke::forward::Class1>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::forward::Class1>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/forward/Class2", ::smoke::forward::Class2)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::forward::Class2> & _ninput)
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
    auto &javaClass = CachedJavaClass<::smoke::forward::Class2>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::forward::Class2>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/forward/UseForwardImpl", "smoke_forward_UseForward", ::smoke::forward::UseForward)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::forward::UseForward> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::forward::UseForward* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::forward::UseForward>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::forward::UseForward>( _ninput );
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
