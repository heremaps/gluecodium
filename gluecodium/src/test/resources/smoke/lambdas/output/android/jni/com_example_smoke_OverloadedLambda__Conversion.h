/*
 *
 */
#pragma once
#include "smoke/OverloadedLambda.h"
#include <functional>
#include "JniCallJavaMethod.h"
#include "JniReference.h"
#include <memory>
#include <optional>
#include <unordered_map>
#include <vector>
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::OverloadedLambda com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::OverloadedLambda*);
JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _jenv, const ::smoke::OverloadedLambda& _ninput);
JNIEXPORT std::optional<::smoke::OverloadedLambda> com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::optional<::smoke::OverloadedLambda>*);
JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<::smoke::OverloadedLambda>& _ninput);
// Functions to create ArrayLists from C++ vectors and vice versa, for overloaded lambdas.
JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::vector<::smoke::OverloadedLambda>& _ninput);
JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<std::vector<::smoke::OverloadedLambda>>& _ninput);
JNIEXPORT std::vector<::smoke::OverloadedLambda> com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, std::vector<::smoke::OverloadedLambda>*);
JNIEXPORT std::optional<std::vector<::smoke::OverloadedLambda>> com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, std::optional<std::vector<::smoke::OverloadedLambda>>*);
// Templated functions to create HashMaps from C++ unordered_maps and vice versa, for overloaded lambdas as values.
template <typename K, typename Hash>
JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::unordered_map<K, ::smoke::OverloadedLambda, Hash>& _ninput) {
    auto javaClass = find_class(_env, "java/util/HashMap");
    auto result = create_object(_env, javaClass);
    jmethodID putMethodId = _env->GetMethodID(javaClass.get(), "put", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;");
    for (const auto& pair : _ninput) {
        auto jKey = convert_to_jni(_env, pair.first);
        auto jValue = com_example_smoke_OverloadedLambda_convert_to_jni(_env, pair.second);
        call_java_method<jobject>(_env, result, putMethodId, jKey, jValue);
    }
    return result;
}
template <typename K, typename Hash>
JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>& _ninput) {
    return _ninput ? com_example_smoke_OverloadedLambda_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}
template <typename K, typename Hash>
std::unordered_map<K, ::smoke::OverloadedLambda, Hash>
com_example_smoke_OverloadedLambda_convert_from_jni(
    JNIEnv* _env, const JniReference<jobject>& _jMap, std::unordered_map<K, ::smoke::OverloadedLambda, Hash>*
) {
    std::unordered_map<K, ::smoke::OverloadedLambda, Hash> _nresult{};
    if (_env->IsSameObject(_jMap.get(), nullptr)) {
        return _nresult;
    }
    auto javaMapClass = find_class(_env, "java/util/Map");
    auto entrySetMethodId = _env->GetMethodID(javaMapClass.get(), "entrySet", "()Ljava/util/Set;");
    auto jEntrySet = call_java_method<jobject>(_env, _jMap, entrySetMethodId);
    auto javaSetClass = find_class(_env, "java/util/Set");
    auto iteratorMethodId = _env->GetMethodID(javaSetClass.get(), "iterator", "()Ljava/util/Iterator;");
    auto jIterator = call_java_method<jobject>(_env, jEntrySet, iteratorMethodId);
    auto javaIteratorClass = find_class(_env, "java/util/Iterator");
    auto hasNextMethodId = _env->GetMethodID(javaIteratorClass.get(), "hasNext", "()Z");
    auto nextMethodId = _env->GetMethodID(javaIteratorClass.get(), "next", "()Ljava/lang/Object;");
    auto javaMapEntryClass = find_class(_env, "java/util/Map$Entry");
    auto getKeyMethodId = _env->GetMethodID(javaMapEntryClass.get(), "getKey", "()Ljava/lang/Object;");
    auto getValueMethodId = _env->GetMethodID(javaMapEntryClass.get(), "getValue", "()Ljava/lang/Object;");
    while (call_java_method<jboolean>(_env, jIterator, hasNextMethodId)) {
        auto jEntry = call_java_method<jobject>(_env, jIterator, nextMethodId);
        auto jKey = call_java_method<jobject>(_env, jEntry, getKeyMethodId);
        K nKey = convert_from_jni(_env, jKey, (K*)nullptr);
        auto jValue = call_java_method<jobject>(_env, jEntry, getValueMethodId);
        auto nValue = com_example_smoke_OverloadedLambda_convert_from_jni(_env, jValue, (::smoke::OverloadedLambda*)nullptr);
        _nresult.emplace(std::move(nKey), std::move(nValue));
    }
    return _nresult;
}
template<typename K, typename Hash>
std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>
com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env,
                 const JniReference<jobject>& _jMap,
                 std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>*)
{
    return _jMap
        ? std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>(
            com_example_smoke_OverloadedLambda_convert_from_jni(_env, _jMap, (std::unordered_map<K, ::smoke::OverloadedLambda, Hash>*)nullptr)
        ) : std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>{};
}
}
}
