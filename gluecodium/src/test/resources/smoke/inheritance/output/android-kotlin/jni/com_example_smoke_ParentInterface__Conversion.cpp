/*

 *
 */

#include "com_example_smoke_ParentInterface__Conversion.h"
#include "com_example_foobar_CrossPackageChildInterface__Conversion.h"
#include "com_example_smoke_ChildInterface__Conversion.h"
#include "com_example_smoke_GrandChildInterface__Conversion.h"
#include "com_example_smoke_ParentInterfaceImplCppProxy.h"
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

REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/ParentInterfaceImpl", com_example_smoke_ParentInterface, "smoke_ParentInterface", ::smoke::ParentInterface)

template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ParentInterface>& result)
{
    CppProxyBase::createProxy<::smoke::ParentInterface, com_example_smoke_ParentInterface_CppProxy>(env, obj, "com_example_smoke_ParentInterface", result);
}

std::shared_ptr<::smoke::ParentInterface> try_descendant_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::smoke::ParentInterface>*) {
    if (_env->IsInstanceOf(_jobj.get(), CachedJavaInterface<::smoke::GrandChildInterface>::java_class.get())) {
        return convert_from_jni(_env, _jobj, TypeId<std::shared_ptr<::smoke::GrandChildInterface>>{});
    }
    if (_env->IsInstanceOf(_jobj.get(), CachedJavaInterface<::foobar::CrossPackageChildInterface>::java_class.get())) {
        return convert_from_jni(_env, _jobj, TypeId<std::shared_ptr<::foobar::CrossPackageChildInterface>>{});
    }
    if (_env->IsInstanceOf(_jobj.get(), CachedJavaInterface<::smoke::ChildInterface>::java_class.get())) {
        return convert_from_jni(_env, _jobj, TypeId<std::shared_ptr<::smoke::ChildInterface>>{});
    }
    return {};
}


std::shared_ptr<::smoke::ParentInterface> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::ParentInterface>>)
{
    std::shared_ptr<::smoke::ParentInterface> _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_class_native_handle(_env, _jobj);
            _nresult = *reinterpret_cast<std::shared_ptr<::smoke::ParentInterface>*>(long_ptr);
        }
    }
    else
    {
        _nresult = try_descendant_from_jni(_env, _jobj, (std::shared_ptr<::smoke::ParentInterface>*)nullptr);
        if (_nresult) return _nresult;
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ParentInterface>& _ninput)
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
    const auto& javaClass = CachedJavaClass<::smoke::ParentInterface>::get_java_class(id);
    auto pInstanceSharedPointer = new (::std::nothrow) std::shared_ptr<::smoke::ParentInterface>(_ninput);
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
