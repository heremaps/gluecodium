/*

 *
 */

#include "com_example_smoke_ExternalInterface__Conversion.h"
#include "com_example_smoke_ExternalInterfaceImplCppProxy.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"
#include <new>

namespace gluecodium
{
namespace jni
{

REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ExternalInterfaceImpl", com_example_smoke_ExternalInterface, "smoke_ExternalInterface", ::smoke::ExternalInterface)

template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ExternalInterface>& result)
{
    CppProxyBase::createProxy<::smoke::ExternalInterface, com_example_smoke_ExternalInterface_CppProxy>(env, obj, "com_example_smoke_ExternalInterface", result);
}


std::shared_ptr<::smoke::ExternalInterface> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::smoke::ExternalInterface>*)
{
    std::shared_ptr<::smoke::ExternalInterface> _nresult{};
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
            _nresult = *reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ExternalInterface>& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }

    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject(_jenv, _ninput.get());
    if (jResult) return jResult;

    jResult = ::gluecodium::jni::JniWrapperCache::get_cached_wrapper(_jenv, _ninput);
    if (jResult) return jResult;

    const auto& id = ::gluecodium::get_type_repository().get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::ExternalInterface>::get_java_class(id);
    auto pInstanceSharedPointer = new (::std::nothrow) std::shared_ptr<::smoke::ExternalInterface>(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        throw_new_out_of_memory_exception(_jenv);
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    ::gluecodium::jni::JniWrapperCache::cache_wrapper(_jenv, _ninput, jResult);

    return jResult;
}

}
}
