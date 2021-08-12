/*
 *
 */
#include "com_example_smoke_StandaloneProducer__Conversion.h"
#include "com_example_smoke_StandaloneProducerImplCppProxy.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
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
::smoke::StandaloneProducer com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::StandaloneProducer*)
{
    ::smoke::StandaloneProducer _nresult{};
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
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
optional<::smoke::StandaloneProducer>
com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, optional<::smoke::StandaloneProducer>*) {
    return _jobj
        ? optional<::smoke::StandaloneProducer>(com_example_smoke_StandaloneProducer_convert_from_jni(_env, _jobj, (::smoke::StandaloneProducer*)nullptr))
        : optional<::smoke::StandaloneProducer>{};
}
JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const optional<::smoke::StandaloneProducer>& _ninput) {
    return _ninput ? com_example_smoke_StandaloneProducer_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}
JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const std::vector<::smoke::StandaloneProducer>& _ninput) {
    auto javaClass = find_class(_env, "java/util/ArrayList");
    auto result = create_object(_env, javaClass);
    jmethodID addMethodId = _env->GetMethodID(javaClass.get(), "add", "(Ljava/lang/Object;)Z");
    for (const auto& element : _ninput) {
        auto jElement = com_example_smoke_StandaloneProducer_convert_to_jni(_env, element);
        call_java_method<jboolean>(_env, result, addMethodId, jElement);
    }
    return result;
}
JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const optional<std::vector<::smoke::StandaloneProducer>>& _ninput) {
    return _ninput ? com_example_smoke_StandaloneProducer_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}
std::vector<::smoke::StandaloneProducer>
com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, std::vector<::smoke::StandaloneProducer>*) {
    std::vector<::smoke::StandaloneProducer> _nresult{};
    if (_env->IsSameObject(_arrayList.get(), nullptr)) {
        return _nresult;
    }
    auto javaArrayListClass = find_class(_env, "java/util/List");
    auto sizeMethodId = _env->GetMethodID(javaArrayListClass.get(), "size", "()I");
    jint length = call_java_method<jint>(_env, _arrayList, sizeMethodId);
    _nresult.reserve(length);
    auto getMethodId = _env->GetMethodID(javaArrayListClass.get(), "get", "(I)Ljava/lang/Object;");
    for (jint i = 0; i < length; i++) {
        auto javaListItem = call_java_method<jobject>(_env, _arrayList, getMethodId, i);
        _nresult.push_back(com_example_smoke_StandaloneProducer_convert_from_jni(_env, javaListItem, (::smoke::StandaloneProducer*)nullptr));
    }
    return _nresult;
}
optional<std::vector<::smoke::StandaloneProducer>>
com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, optional<std::vector<::smoke::StandaloneProducer>>*) {
    return _arrayList
        ? optional<std::vector<::smoke::StandaloneProducer>>(com_example_smoke_StandaloneProducer_convert_from_jni(_env, _arrayList, (std::vector<::smoke::StandaloneProducer>*)nullptr))
        : optional<std::vector<::smoke::StandaloneProducer>>{};
}
}
}
