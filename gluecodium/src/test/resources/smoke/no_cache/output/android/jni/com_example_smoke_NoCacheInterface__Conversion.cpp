/*

 *
 */

#include "com_example_smoke_NoCacheInterface__Conversion.h"
#include "com_example_smoke_NoCacheInterfaceImplCppProxy.h"
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

REGISTER_JNI_CLASS_CACHE_INHERITANCE("com/example/smoke/NoCacheInterfaceImpl", com_example_smoke_NoCacheInterface, "smoke_NoCacheInterface", ::smoke::NoCacheInterface)

template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::NoCacheInterface>& result)
{
    CppProxyBase::createProxyNoCache<::smoke::NoCacheInterface, com_example_smoke_NoCacheInterface_CppProxy>(env, obj, "com_example_smoke_NoCacheInterface", result);
}


std::shared_ptr<::smoke::NoCacheInterface> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::NoCacheInterface>>)
{
    std::shared_ptr<::smoke::NoCacheInterface> _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_class_native_handle(_env, _jobj);
            _nresult = *reinterpret_cast<std::shared_ptr<::smoke::NoCacheInterface>*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::NoCacheInterface>& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }

    JniReference<jobject> jResult;

    const auto& id = ::gluecodium::get_type_repository().get_id(_ninput.get());
    const auto& javaClass = CachedJavaClass<::smoke::NoCacheInterface>::get_java_class(id);
    auto pInstanceSharedPointer = new (::std::nothrow) std::shared_ptr<::smoke::NoCacheInterface>(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        throw_new_out_of_memory_exception(_jenv);
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );

    return jResult;
}

}
}
