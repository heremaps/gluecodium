/*
 *
 */
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_Lambdas.h"
#include "com_example_smoke_Lambdas_ConfuserImpl.h"
#include "com_example_smoke_Lambdas_ConsumerImpl.h"
#include "com_example_smoke_Lambdas_IndexerImpl.h"
#include "com_example_smoke_Lambdas_ProducerImpl.h"
#include "smoke/Lambdas.h"
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
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Lambdas", ::smoke::Lambdas)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::Lambdas> & _ninput)
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
    auto &javaClass = CachedJavaClass<::smoke::Lambdas>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::std::shared_ptr<::smoke::Lambdas>( _ninput );
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Lambdas$ConfuserImpl", ::smoke::Lambdas::Confuser)
::smoke::Lambdas::Confuser
convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Confuser*)
{
    ::smoke::Lambdas::Confuser _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_field_value(
                _env,
                _jobj,
                "nativeHandle",
                (int64_t*)nullptr);
            _nresult = *reinterpret_cast<::smoke::Lambdas::Confuser*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Confuser& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    JniReference<jobject> jResult;
    auto &javaClass = CachedJavaClass<::smoke::Lambdas::Confuser>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::smoke::Lambdas::Confuser(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Lambdas$ConsumerImpl", ::smoke::Lambdas::Consumer)
::smoke::Lambdas::Consumer
convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Consumer*)
{
    ::smoke::Lambdas::Consumer _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_field_value(
                _env,
                _jobj,
                "nativeHandle",
                (int64_t*)nullptr);
            _nresult = *reinterpret_cast<::smoke::Lambdas::Consumer*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Consumer& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    JniReference<jobject> jResult;
    auto &javaClass = CachedJavaClass<::smoke::Lambdas::Consumer>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::smoke::Lambdas::Consumer(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Lambdas$IndexerImpl", ::smoke::Lambdas::Indexer)
::smoke::Lambdas::Indexer
convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Indexer*)
{
    ::smoke::Lambdas::Indexer _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_field_value(
                _env,
                _jobj,
                "nativeHandle",
                (int64_t*)nullptr);
            _nresult = *reinterpret_cast<::smoke::Lambdas::Indexer*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Indexer& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    JniReference<jobject> jResult;
    auto &javaClass = CachedJavaClass<::smoke::Lambdas::Indexer>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::smoke::Lambdas::Indexer(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Lambdas$ProducerImpl", ::smoke::Lambdas::Producer)
::smoke::Lambdas::Producer
convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Producer*)
{
    ::smoke::Lambdas::Producer _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_field_value(
                _env,
                _jobj,
                "nativeHandle",
                (int64_t*)nullptr);
            _nresult = *reinterpret_cast<::smoke::Lambdas::Producer*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Producer& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    JniReference<jobject> jResult;
    auto &javaClass = CachedJavaClass<::smoke::Lambdas::Producer>::java_class;
    auto pInstanceSharedPointer =
        new (::std::nothrow) ::smoke::Lambdas::Producer(_ninput);
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
