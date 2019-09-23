/*
 *
 */
#pragma once
#include <jni.h>
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_Lambdas.h"
#include "com_example_smoke_Lambdas_ConfuserImpl.h"
#include "com_example_smoke_Lambdas_ConsumerImpl.h"
#include "com_example_smoke_Lambdas_IndexerImpl.h"
#include "com_example_smoke_Lambdas_ProducerImpl.h"
#include "smoke/Lambdas.h"
#include <memory>
#include <new>
#include "JniReference.h"
#include "ProxyConversion.h"
namespace gluecodium
{
namespace jni
{
JniReference<jclass>& get_cached_native_base_class();
template < typename T >
::std::shared_ptr< T >
convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::std::shared_ptr< T >* dummy)
{
    ::std::shared_ptr< T > _nresult{};
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
            _nresult = *reinterpret_cast<::std::shared_ptr< T >*>(long_ptr);
        }
    }
    else
    {
        createCppProxy<>( _env, _jobj, _nresult);
    }
    return _nresult;
}
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::Lambdas> & _ninput);
::smoke::Lambdas::Confuser convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Confuser* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Confuser & _ninput);
::smoke::Lambdas::Consumer convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Consumer* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Consumer & _ninput);
::smoke::Lambdas::Indexer convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Indexer* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Indexer & _ninput);
::smoke::Lambdas::Producer convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Producer* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Producer & _ninput);
}
}
