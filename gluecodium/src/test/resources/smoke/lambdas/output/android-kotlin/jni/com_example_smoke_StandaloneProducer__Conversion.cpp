/*

 *
 */

#include "com_example_smoke_StandaloneProducer__Conversion.h"
#include "com_example_smoke_StandaloneProducerImplCppProxy.h"
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

REGISTER_JNI_CLASS_CACHE("com/example/smoke/StandaloneProducerImpl", com_example_smoke_StandaloneProducer, ::smoke::StandaloneProducer)

void com_example_smoke_StandaloneProducer_createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::StandaloneProducer& result)
{
    std::shared_ptr<com_example_smoke_StandaloneProducer_CppProxy> _nproxy{};
    CppProxyBase::createProxy<com_example_smoke_StandaloneProducer_CppProxy, com_example_smoke_StandaloneProducer_CppProxy>(env, obj, "com_example_smoke_StandaloneProducer", _nproxy);
    result = std::bind(&com_example_smoke_StandaloneProducer_CppProxy::operator(), _nproxy);
}


::smoke::StandaloneProducer com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::StandaloneProducer>)
{
    ::smoke::StandaloneProducer _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_class_native_handle(_env, _jobj);
            _nresult = *reinterpret_cast<::smoke::StandaloneProducer*>(long_ptr);
        }
    }
    else
    {
        com_example_smoke_StandaloneProducer_createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}

JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _jenv, const ::smoke::StandaloneProducer& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }

    JniReference<jobject> jResult;

    auto &javaClass = CachedJavaClass<::smoke::StandaloneProducer>::java_class;
    auto pInstanceSharedPointer = new (::std::nothrow) ::smoke::StandaloneProducer(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        throw_new_out_of_memory_exception(_jenv);
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );

    return jResult;
}

std::optional<::smoke::StandaloneProducer>
com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::optional<::smoke::StandaloneProducer>>) {
    return _jobj
        ? std::optional<::smoke::StandaloneProducer>(com_example_smoke_StandaloneProducer_convert_from_jni(_env, _jobj, TypeId<::smoke::StandaloneProducer>{}))
        : std::optional<::smoke::StandaloneProducer>{};
}

JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const std::optional<::smoke::StandaloneProducer>& _ninput) {
    return _ninput ? com_example_smoke_StandaloneProducer_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}

JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* const env, const std::vector<::smoke::StandaloneProducer>& input)
{
    JavaArrayListAdder list_appender{env};

    for (const auto& element : input)
    {
        list_appender.add(com_example_smoke_StandaloneProducer_convert_to_jni(env, element));
    }

    return list_appender.fetch_container();
}

JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const std::optional<std::vector<::smoke::StandaloneProducer>>& _ninput) {
    return _ninput ? com_example_smoke_StandaloneProducer_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}

std::vector<::smoke::StandaloneProducer>
com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* const env, const JniReference<jobject>& array_list, TypeId<std::vector<::smoke::StandaloneProducer>>) {
    std::vector<::smoke::StandaloneProducer> result{};
    if (env->IsSameObject(array_list.get(), nullptr))
    {
        return result;
    }

    const JavaListIterator list_iterator(env, array_list);

    const jint length = list_iterator.length();

    result.reserve(length);

    for (jint i = 0; i < length; i++)
    {
        result.emplace_back(com_example_smoke_StandaloneProducer_convert_from_jni(
            env, list_iterator.get(array_list, i), TypeId<::smoke::StandaloneProducer>{}));
    }

    return result;
}

std::optional<std::vector<::smoke::StandaloneProducer>>
com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, TypeId<std::optional<std::vector<::smoke::StandaloneProducer>>>) {
    return _arrayList
        ? std::optional<std::vector<::smoke::StandaloneProducer>>(com_example_smoke_StandaloneProducer_convert_from_jni(_env, _arrayList, TypeId<std::vector<::smoke::StandaloneProducer>>{}))
        : std::optional<std::vector<::smoke::StandaloneProducer>>{};
}
}
}
