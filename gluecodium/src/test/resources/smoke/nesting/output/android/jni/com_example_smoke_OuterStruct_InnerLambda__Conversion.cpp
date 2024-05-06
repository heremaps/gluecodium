/*

 *
 */

#include "com_example_smoke_OuterStruct_InnerLambda__Conversion.h"
#include "com_example_smoke_OuterStruct_InnerLambdaImplCppProxy.h"
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

REGISTER_JNI_CLASS_CACHE("com/example/smoke/OuterStruct$InnerLambdaImpl", com_example_smoke_OuterStruct_00024InnerLambda, ::smoke::OuterStruct::InnerLambda)

void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::OuterStruct::InnerLambda& result)
{
    std::shared_ptr<com_example_smoke_OuterStruct_00024InnerLambda_CppProxy> _nproxy{};
    CppProxyBase::createProxy<com_example_smoke_OuterStruct_00024InnerLambda_CppProxy, com_example_smoke_OuterStruct_00024InnerLambda_CppProxy>(env, obj, "com_example_smoke_OuterStruct_00024InnerLambda", _nproxy);
    result = std::bind(&com_example_smoke_OuterStruct_00024InnerLambda_CppProxy::operator(), _nproxy);
}


::smoke::OuterStruct::InnerLambda convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::OuterStruct::InnerLambda>)
{
    ::smoke::OuterStruct::InnerLambda _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_class_native_handle(_env, _jobj);
            _nresult = *reinterpret_cast<::smoke::OuterStruct::InnerLambda*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::OuterStruct::InnerLambda& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }

    JniReference<jobject> jResult;

    auto &javaClass = CachedJavaClass<::smoke::OuterStruct::InnerLambda>::java_class;
    auto pInstanceSharedPointer = new (::std::nothrow) ::smoke::OuterStruct::InnerLambda(_ninput);
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
