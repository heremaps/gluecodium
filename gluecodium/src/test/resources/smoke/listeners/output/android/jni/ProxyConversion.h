/*
 *
 */
#pragma once
#include "JniReference.h"
#include "com_example_smoke_CalculationResultImplCppProxy.h"
#include "com_example_smoke_CalculatorListenerImplCppProxy.h"
#include "com_example_smoke_InternalListenerImplCppProxy.h"
#include "com_example_smoke_ListenerWithPropertiesImplCppProxy.h"
#include "com_example_smoke_ListenersWithReturnValuesImplCppProxy.h"
namespace gluecodium
{
namespace jni
{
template<class T>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<T>& result) {}
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculationResult>& result);
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculatorListener>& result);
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::InternalListener>& result);
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenerWithProperties>& result);
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenersWithReturnValues>& result);
}
}
