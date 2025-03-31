/*

 *
 */

#pragma once

#include "smoke/OverloadedLambda.h"
#include <functional>
#include "JniCallJavaMethod.h"
#include "JniJavaContainers.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>
#include <unordered_map>
#include <vector>

namespace gluecodium
{
namespace jni
{

JNIEXPORT ::smoke::OverloadedLambda com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::OverloadedLambda>);
JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _jenv, const ::smoke::OverloadedLambda& _ninput);
JNIEXPORT std::optional<::smoke::OverloadedLambda> com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::optional<::smoke::OverloadedLambda>>);
JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<::smoke::OverloadedLambda>& _ninput);

// Functions to create ArrayLists from C++ vectors and vice versa, for overloaded lambdas.

JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::vector<::smoke::OverloadedLambda>& _ninput);
JNIEXPORT JniReference<jobject> com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<std::vector<::smoke::OverloadedLambda>>& _ninput);
JNIEXPORT std::vector<::smoke::OverloadedLambda> com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, TypeId<std::vector<::smoke::OverloadedLambda>>);
JNIEXPORT std::optional<std::vector<::smoke::OverloadedLambda>> com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, TypeId<std::optional<std::vector<::smoke::OverloadedLambda>>>);

// Templated functions to create HashMaps from C++ unordered_maps and vice versa, for overloaded lambdas as values.

template <typename K, typename Hash>
JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* const env, const std::unordered_map<K, ::smoke::OverloadedLambda, Hash>& input)
{
    JavaHashMapAdder map_adder{env};

    for (const auto& pair : input)
    {
        map_adder.add(convert_to_jni(env, pair.first),
                      com_example_smoke_OverloadedLambda_convert_to_jni(env, pair.second));
    }

    return map_adder.fetch_hash_map();
}

template <typename K, typename Hash>
JniReference<jobject>
com_example_smoke_OverloadedLambda_convert_to_jni(JNIEnv* _env, const std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>& _ninput)
{
    return _ninput ? com_example_smoke_OverloadedLambda_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}

template <typename K, typename Hash>
std::unordered_map<K, ::smoke::OverloadedLambda, Hash>
com_example_smoke_OverloadedLambda_convert_from_jni(
    JNIEnv* const env, const JniReference<jobject>& java_map, TypeId<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>)
{
    std::unordered_map<K, ::smoke::OverloadedLambda, Hash> result{};

    if (env->IsSameObject(java_map.get(), nullptr))
    {
        return result;
    }

    const JavaMapIterator map_iterator(env, java_map);

    while(map_iterator.has_next())
    {
        const auto& key_value = map_iterator.next();
        result.emplace(convert_from_jni(env, key_value.first, TypeId<K>{}),
                       com_example_smoke_OverloadedLambda_convert_from_jni(env, key_value.second, TypeId<::smoke::OverloadedLambda>{}));
    }

    return result;
}

template<typename K, typename Hash>
std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>
com_example_smoke_OverloadedLambda_convert_from_jni(JNIEnv* _env,
                 const JniReference<jobject>& _jMap,
                 TypeId<std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>>)
{
    return _jMap
        ? std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>(
            com_example_smoke_OverloadedLambda_convert_from_jni(_env, _jMap, TypeId<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>{})
        ) : std::optional<std::unordered_map<K, ::smoke::OverloadedLambda, Hash>>{};
}

}
}
