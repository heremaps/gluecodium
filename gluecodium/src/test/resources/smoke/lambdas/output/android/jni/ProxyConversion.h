/*
 *
 */
#pragma once
#include "JniReference.h"
#include "com_example_smoke_Lambdas_ConfuserImplCppProxy.h"
#include "com_example_smoke_Lambdas_ConsumerImplCppProxy.h"
#include "com_example_smoke_Lambdas_IndexerImplCppProxy.h"
#include "com_example_smoke_Lambdas_ProducerImplCppProxy.h"
namespace gluecodium
{
namespace jni
{
template<class T>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<T>& result) {}
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Confuser& result);
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Consumer& result);
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Indexer& result);
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Producer& result);
}
}
