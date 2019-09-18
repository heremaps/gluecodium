/*
 *
 */
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_ChildClassFromClass.h"
#include "com_example_smoke_ChildClassFromInterface.h"
#include "com_example_smoke_ChildInterfaceImpl.h"
#include "com_example_smoke_InternalChild.h"
#include "com_example_smoke_InternalParent.h"
#include "com_example_smoke_ParentClass.h"
#include "com_example_smoke_ParentInterfaceImpl.h"
#include "smoke/ChildClassFromClass.h"
#include "smoke/ChildClassFromInterface.h"
#include "smoke/ChildInterface.h"
#include "smoke/InternalChild.h"
#include "smoke/InternalParent.h"
#include "smoke/ParentClass.h"
#include "smoke/ParentInterface.h"
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
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ChildClassFromClass", "smoke_ChildClassFromClass", ::smoke::ChildClassFromClass)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::ChildClassFromClass> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::ChildClassFromClass* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::ChildClassFromClass>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::ChildClassFromClass>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ChildClassFromInterface", "smoke_ChildClassFromInterface", ::smoke::ChildClassFromInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::ChildClassFromInterface> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::ChildClassFromInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::ChildClassFromInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::ChildClassFromInterface>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ChildInterfaceImpl", "smoke_ChildInterface", ::smoke::ChildInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::ChildInterface> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::ChildInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::ChildInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::ChildInterface>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/InternalChild", "smoke_InternalChild", ::smoke::InternalChild)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::InternalChild> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::InternalChild* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::InternalChild>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::InternalChild>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/InternalParent", "smoke_InternalParent", ::smoke::InternalParent)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::InternalParent> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::InternalParent* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::InternalParent>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::InternalParent>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ParentClass", "smoke_ParentClass", ::smoke::ParentClass)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::ParentClass> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::ParentClass* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::ParentClass>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::ParentClass>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::genium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ParentInterfaceImpl", "smoke_ParentInterface", ::smoke::ParentInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::ParentInterface> & _ninput)
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
    const auto& id = ::genium::get_type_repository(static_cast< ::smoke::ParentInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::ParentInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::ParentInterface>( _ninput );
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
