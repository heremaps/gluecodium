/*

 *
 */

#include "com_example_smoke_OverloadedLambda__Conversion.h"
#include "com_example_smoke_OverloadedLambdaImplCppProxy.h"
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

REGISTER_JNI_CLASS_CACHE("com/example/smoke/OverloadedLambdaImpl", com_example_smoke_OverloadedLambda, ::smoke::OverloadedLambda)

void com_example_smoke_OverloadedLambda_createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::OverloadedLambda& result)
{
    std::shared_ptr<com_example_smoke_OverloadedLambda_CppProxy> _nproxy{};
    CppProxyBase::createProxy<com_example_smoke_OverloadedLambda_CppProxy, com_example_smoke_OverloadedLambda_CppProxy>(env, obj, "com_example_smoke_OverloadedLambda", _nproxy);
    result = std::bind(&com_example_smoke_OverloadedLambda_CppProxy::operator(), _nproxy, std::placeholders::_1);
}


::smoke::OverloadedLambda com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::OverloadedLambda>)
{
    ::smoke::OverloadedLambda _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_class_native_handle(_env, _jobj);
            _nresult = *reinterpret_cast<::smoke::OverloadedLambda*>(long_ptr);
        }
    }
    else
    {
        com_example_smoke_OverloadedLambda_createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}

JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _jenv, const ::smoke::OverloadedLambda& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }

    JniReference<jobject> jResult;

    auto &javaClass = CachedJavaClass<::smoke::OverloadedLambda>::java_class;
    auto pInstanceSharedPointer = new (::std::nothrow) ::smoke::OverloadedLambda(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        throw_new_out_of_memory_exception(_jenv);
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );

    return jResult;
}

std::optional<::smoke::OverloadedLambda>
com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::optional<::smoke::OverloadedLambda>>) {
    return _jobj
        ? std::optional<::smoke::OverloadedLambda>(com_example_smoke_OverloadedLambda_convert_from_jni(_env, _jobj, TypeId<::smoke::OverloadedLambda>{}))
        : std::optional<::smoke::OverloadedLambda>{};
}

JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<::smoke::OverloadedLambda>& _ninput) {
    return _ninput ? com_example_smoke_OverloadedLambda_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}

JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* const env, const std::vector<::smoke::OverloadedLambda>& input)
{
    JavaArrayListAdder list_appender{env};

    for (const auto& element : input)
    {
        list_appender.add(com_example_smoke_OverloadedLambda_convert_to_jni(env, element));
    }

    return list_appender.fetch_container();
}

JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<std::vector<::smoke::OverloadedLambda>>& _ninput) {
    return _ninput ? com_example_smoke_OverloadedLambda_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}

std::vector<::smoke::OverloadedLambda>
com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* const env, const JniReference<jobject>& array_list, TypeId<std::vector<::smoke::OverloadedLambda>>) {
    std::vector<::smoke::OverloadedLambda> result{};
    if (env->IsSameObject(array_list.get(), nullptr))
    {
        return result;
    }

    const JavaListIterator list_iterator(env, array_list);

    const jint length = list_iterator.length();

    result.reserve(length);

    for (jint i = 0; i < length; i++)
    {
        result.emplace_back(com_example_smoke_OverloadedLambda_convert_from_jni(
            env, list_iterator.get(array_list, i), TypeId<::smoke::OverloadedLambda>{}));
    }

    return result;
}

std::optional<std::vector<::smoke::OverloadedLambda>>
com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, TypeId<std::optional<std::vector<::smoke::OverloadedLambda>>>) {
    return _arrayList
        ? std::optional<std::vector<::smoke::OverloadedLambda>>(com_example_smoke_OverloadedLambda_convert_from_jni(_env, _arrayList, TypeId<std::vector<::smoke::OverloadedLambda>>{}))
        : std::optional<std::vector<::smoke::OverloadedLambda>>{};
}
}
}
