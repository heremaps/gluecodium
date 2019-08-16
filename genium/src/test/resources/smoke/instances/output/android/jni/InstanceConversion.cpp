#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_ExternalClass.h"
#include "com_example_smoke_ExternalInterfaceImpl.h"
#include "com_example_smoke_SimpleClass.h"
#include "com_example_smoke_SimpleInterfaceImpl.h"
#include "foo/Bar.h"
#include "smoke/SimpleClass.h"
#include "smoke/SimpleInterface.h"
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
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ExternalClass", "smoke_::fire::Baz", ::fire::Baz)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::fire::Baz* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::fire::Baz>::get_java_class(id);
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
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/SimpleClass", "smoke_SimpleClass", ::smoke::SimpleClass)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::SimpleClass* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::SimpleClass>::get_java_class(id);
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
}
}