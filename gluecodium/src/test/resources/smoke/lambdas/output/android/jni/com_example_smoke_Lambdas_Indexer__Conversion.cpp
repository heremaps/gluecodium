/*
 *
 */
#include "com_example_smoke_Lambdas_Indexer__Conversion.h"
#include "com_example_smoke_Lambdas_IndexerImplCppProxy.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
#include "JniWrapperCache.h"
#include <new>
namespace gluecodium
{
namespace jni
{
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Lambdas$IndexerImpl", com_example_smoke_Lambdas_00024IndexerImpl, ::smoke::Lambdas::Indexer)
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Indexer& result)
{
    std::shared_ptr<com_example_smoke_Lambdas_00024IndexerImpl_CppProxy> _nproxy{};
    CppProxyBase::createProxy<com_example_smoke_Lambdas_00024IndexerImpl_CppProxy, com_example_smoke_Lambdas_00024IndexerImpl_CppProxy>(env, obj, _nproxy);
    result = std::bind(&com_example_smoke_Lambdas_00024IndexerImpl_CppProxy::operator(), _nproxy, std::placeholders::_1, std::placeholders::_2);
}
::smoke::Lambdas::Indexer convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Indexer*)
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
    auto pInstanceSharedPointer = new (::std::nothrow) ::smoke::Lambdas::Indexer(_ninput);
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
