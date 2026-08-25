/*

 *
 */

#pragma once

#include "smoke/StandaloneProducer.h"
#include <functional>
#include "JniCallJavaMethod.h"
#include "JniJavaContainers.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include "gluecodium/Optional.h"
#include <unordered_map>
#include <vector>

namespace gluecodium
{
namespace jni
{

JNIEXPORT ::smoke::StandaloneProducer com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::StandaloneProducer>);
JNIEXPORT JniReference<jobject> com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _jenv, const ::smoke::StandaloneProducer& _ninput);
JNIEXPORT ::gluecodium::optional<::smoke::StandaloneProducer> com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::gluecodium::optional<::smoke::StandaloneProducer>>);
JNIEXPORT JniReference<jobject> com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const ::gluecodium::optional<::smoke::StandaloneProducer>& _ninput);

// Functions to create ArrayLists from C++ vectors and vice versa, for overloaded lambdas.

JNIEXPORT JniReference<jobject> com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const std::vector<::smoke::StandaloneProducer>& _ninput);
JNIEXPORT JniReference<jobject> com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const ::gluecodium::optional<std::vector<::smoke::StandaloneProducer>>& _ninput);
JNIEXPORT std::vector<::smoke::StandaloneProducer> com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, TypeId<std::vector<::smoke::StandaloneProducer>>);
JNIEXPORT ::gluecodium::optional<std::vector<::smoke::StandaloneProducer>> com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _arrayList, TypeId<::gluecodium::optional<std::vector<::smoke::StandaloneProducer>>>);

// Templated functions to create HashMaps from C++ unordered_maps and vice versa, for overloaded lambdas as values.

template <typename K, typename Hash>
JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* const env, const std::unordered_map<K, ::smoke::StandaloneProducer, Hash>& input)
{
    JavaHashMapAdder map_adder{env};

    for (const auto& pair : input)
    {
        map_adder.add(convert_to_jni(env, pair.first),
                      com_example_smoke_StandaloneProducer_convert_to_jni(env, pair.second));
    }

    return map_adder.fetch_hash_map();
}

template <typename K, typename Hash>
JniReference<jobject>
com_example_smoke_StandaloneProducer_convert_to_jni(JNIEnv* _env, const ::gluecodium::optional<std::unordered_map<K, ::smoke::StandaloneProducer, Hash>>& _ninput)
{
    return _ninput ? com_example_smoke_StandaloneProducer_convert_to_jni(_env, *_ninput) : JniReference<jobject>{};
}

template <typename K, typename Hash>
std::unordered_map<K, ::smoke::StandaloneProducer, Hash>
com_example_smoke_StandaloneProducer_convert_from_jni(
    JNIEnv* const env, const JniReference<jobject>& java_map, TypeId<std::unordered_map<K, ::smoke::StandaloneProducer, Hash>>)
{
    std::unordered_map<K, ::smoke::StandaloneProducer, Hash> result{};

    if (env->IsSameObject(java_map.get(), nullptr))
    {
        return result;
    }

    const JavaMapIterator map_iterator(env, java_map);

    while(map_iterator.has_next())
    {
        const auto& key_value = map_iterator.next();
        result.emplace(convert_from_jni(env, key_value.first, TypeId<K>{}),
                       com_example_smoke_StandaloneProducer_convert_from_jni(env, key_value.second, TypeId<::smoke::StandaloneProducer>{}));
    }

    return result;
}

template<typename K, typename Hash>
::gluecodium::optional<std::unordered_map<K, ::smoke::StandaloneProducer, Hash>>
com_example_smoke_StandaloneProducer_convert_from_jni(JNIEnv* _env,
                 const JniReference<jobject>& _jMap,
                 TypeId<::gluecodium::optional<std::unordered_map<K, ::smoke::StandaloneProducer, Hash>>>)
{
    return _jMap
        ? ::gluecodium::optional<std::unordered_map<K, ::smoke::StandaloneProducer, Hash>>(
            com_example_smoke_StandaloneProducer_convert_from_jni(_env, _jMap, TypeId<std::unordered_map<K, ::smoke::StandaloneProducer, Hash>>{})
        ) : ::gluecodium::optional<std::unordered_map<K, ::smoke::StandaloneProducer, Hash>>{};
}

}
}
