/*
 *
 */
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_LevelOne.h"
#include "com_example_smoke_LevelOne_LevelTwo.h"
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree.h"
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree_LevelFour.h"
#include "com_example_smoke_NestedReferences.h"
#include "com_example_smoke_OuterClass.h"
#include "com_example_smoke_OuterClass_InnerClass.h"
#include "com_example_smoke_OuterClass_InnerInterfaceImpl.h"
#include "com_example_smoke_OuterInterfaceImpl.h"
#include "com_example_smoke_OuterInterface_InnerClass.h"
#include "com_example_smoke_OuterInterface_InnerInterfaceImpl.h"
#include "com_example_smoke_UseFreeTypes.h"
#include "smoke/LevelOne.h"
#include "smoke/NestedReferences.h"
#include "smoke/OuterClass.h"
#include "smoke/OuterInterface.h"
#include "smoke/UseFreeTypes.h"
#include <memory>
#include <new>
#include "InstanceConversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
namespace
{
struct DummyNativeBaseType {};
}
namespace gluecodium
{
namespace jni
{
REGISTER_JNI_CLASS_CACHE("com/example/NativeBase", DummyNativeBaseType)
JniReference<jclass>& get_cached_native_base_class()
{
    return CachedJavaClass<DummyNativeBaseType>::java_class;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/LevelOne", ::smoke::LevelOne)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::LevelOne> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::LevelOne>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::LevelOne>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/LevelOne$LevelTwo", ::smoke::LevelOne::LevelTwo)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::LevelOne::LevelTwo> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::LevelOne::LevelTwo>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::LevelOne::LevelTwo>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/LevelOne$LevelTwo$LevelThree", ::smoke::LevelOne::LevelTwo::LevelThree)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::LevelOne::LevelTwo::LevelThree>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/NestedReferences", ::smoke::NestedReferences)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::NestedReferences> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::NestedReferences>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::NestedReferences>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/OuterClass", ::smoke::OuterClass)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::OuterClass> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::OuterClass>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::OuterClass>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/OuterClass$InnerClass", ::smoke::OuterClass::InnerClass)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::OuterClass::InnerClass> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::OuterClass::InnerClass>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::OuterClass::InnerClass>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/OuterClass$InnerInterfaceImpl", "smoke_InnerInterface", ::smoke::OuterClass::InnerInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::OuterClass::InnerInterface> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    const auto& id = ::gluecodium::get_type_repository(static_cast< ::smoke::OuterClass::InnerInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::OuterClass::InnerInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::OuterClass::InnerInterface>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/OuterInterfaceImpl", "smoke_OuterInterface", ::smoke::OuterInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::OuterInterface> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    const auto& id = ::gluecodium::get_type_repository(static_cast< ::smoke::OuterInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::OuterInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::OuterInterface>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/OuterInterface$InnerClass", ::smoke::OuterInterface::InnerClass)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::OuterInterface::InnerClass> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::OuterInterface::InnerClass>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::OuterInterface::InnerClass>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/OuterInterface$InnerInterfaceImpl", "smoke_InnerInterface", ::smoke::OuterInterface::InnerInterface)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::OuterInterface::InnerInterface> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    const auto& id = ::gluecodium::get_type_repository(static_cast< ::smoke::OuterInterface::InnerInterface* >(nullptr)).get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::OuterInterface::InnerInterface>::get_java_class(id);
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::OuterInterface::InnerInterface>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/UseFreeTypes", ::smoke::UseFreeTypes)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::UseFreeTypes> & _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::UseFreeTypes>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::UseFreeTypes>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
}
}
