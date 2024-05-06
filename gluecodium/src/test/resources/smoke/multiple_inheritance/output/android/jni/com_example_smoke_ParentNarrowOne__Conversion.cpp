/*

 *
 */

#include "com_example_smoke_ParentNarrowOne__Conversion.h"
#include "com_example_smoke_ParentNarrowOneImplCppProxy.h"
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

REGISTER_JNI_CLASS_CACHE("com/example/smoke/ParentNarrowOneImpl", com_example_smoke_ParentNarrowOne, ::smoke::ParentNarrowOne)

template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ParentNarrowOne>& result)
{
    CppProxyBase::createProxy<::smoke::ParentNarrowOne, com_example_smoke_ParentNarrowOne_CppProxy>(env, obj, "com_example_smoke_ParentNarrowOne", result);
}


std::shared_ptr<::smoke::ParentNarrowOne> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::ParentNarrowOne>>)
{
    std::shared_ptr<::smoke::ParentNarrowOne> _nresult{};
    createCppProxy(_env, _jobj, _nresult);
    return _nresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ParentNarrowOne>& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }

    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject(_jenv, _ninput.get());
    if (jResult) return jResult;

    jResult = ::gluecodium::jni::JniWrapperCache::get_cached_wrapper(_jenv, _ninput);
    if (jResult) return jResult;

    auto &javaClass = CachedJavaClass<::smoke::ParentNarrowOne>::java_class;
    auto pInstanceSharedPointer = new (::std::nothrow) std::shared_ptr<::smoke::ParentNarrowOne>(_ninput);
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
