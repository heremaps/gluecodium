/*

 *
 */

#include "com_example_smoke_ChildInterface__Conversion.h"
#include "com_example_smoke_ChildInterfaceImplCppProxy.h"
#include "com_example_smoke_GrandChildInterface__Conversion.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"
#include <new>

namespace gluecodium
{
namespace jni
{

REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ChildInterfaceImpl", com_example_smoke_ChildInterface, "smoke_ChildInterface", ::smoke::ChildInterface)
REGISTER_JNI_CLASS_CACHE_INTERFACE("com/example/smoke/ChildInterface", com_example_smoke_ChildInterface__interface, ::smoke::ChildInterface)

template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ChildInterface>& result)
{
    CppProxyBase::createProxy<::smoke::ChildInterface, com_example_smoke_ChildInterface_CppProxy>(env, obj, "com_example_smoke_ChildInterface", result);
}

std::shared_ptr<::smoke::ChildInterface> try_descendant_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::smoke::ChildInterface>*) {
    if (_env->IsInstanceOf(_jobj.get(), CachedJavaInterface<::smoke::GrandChildInterface>::java_class.get())) {
        return convert_from_jni(_env, _jobj, TypeId<std::shared_ptr<::smoke::GrandChildInterface>>{});
    }
    return {};
}


std::shared_ptr<::smoke::ChildInterface> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::ChildInterface>>)
{
    std::shared_ptr<::smoke::ChildInterface> _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_class_native_handle(_env, _jobj);
            _nresult = *reinterpret_cast<std::shared_ptr<::smoke::ChildInterface>*>(long_ptr);
        }
    }
    else
    {
        _nresult = try_descendant_from_jni(_env, _jobj, (std::shared_ptr<::smoke::ChildInterface>*)nullptr);
        if (_nresult) return _nresult;
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ChildInterface>& _ninput)
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
    const auto& javaClass = CachedJavaClass<::smoke::ChildInterface>::get_java_class(id);
    auto pInstanceSharedPointer = new (::std::nothrow) std::shared_ptr<::smoke::ChildInterface>(_ninput);
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
