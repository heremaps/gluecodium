/*

 *
 */

#include "com_example_smoke_Lambdas_Confounder__Conversion.h"
#include "com_example_smoke_Lambdas_ConfounderImplCppProxy.h"
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

REGISTER_JNI_CLASS_CACHE("com/example/smoke/Lambdas$ConfounderImpl", com_example_smoke_Lambdas_00024Confounder, ::smoke::Lambdas::Confuser)

void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Confuser& result)
{
    std::shared_ptr<com_example_smoke_Lambdas_00024Confounder_CppProxy> _nproxy{};
    CppProxyBase::createProxy<com_example_smoke_Lambdas_00024Confounder_CppProxy, com_example_smoke_Lambdas_00024Confounder_CppProxy>(env, obj, "com_example_smoke_Lambdas_00024Confounder", _nproxy);
    result = std::bind(&com_example_smoke_Lambdas_00024Confounder_CppProxy::operator(), _nproxy, std::placeholders::_1);
}


::smoke::Lambdas::Confuser convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::Lambdas::Confuser>)
{
    ::smoke::Lambdas::Confuser _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_class_native_handle(_env, _jobj);
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
    auto pInstanceSharedPointer = new (::std::nothrow) ::smoke::Lambdas::Confuser(_ninput);
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
