/*
 *
 */
#pragma once
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
inline void createCppProxy(JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& obj, ::std::shared_ptr<T>& result) {
}
template<>
inline void createCppProxy(JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculationResult>& result) {
    ::gluecodium::jni::CppProxyBase::createProxy<::smoke::CalculationResult, ::gluecodium::jni::CalculationResultImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculatorListener>& result) {
    ::gluecodium::jni::CppProxyBase::createProxy<::smoke::CalculatorListener, ::gluecodium::jni::CalculatorListenerImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::InternalListener>& result) {
    ::gluecodium::jni::CppProxyBase::createProxy<::smoke::InternalListener, ::gluecodium::jni::InternalListenerImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenerWithProperties>& result) {
    ::gluecodium::jni::CppProxyBase::createProxy<::smoke::ListenerWithProperties, ::gluecodium::jni::ListenerWithPropertiesImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::gluecodium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenersWithReturnValues>& result) {
    ::gluecodium::jni::CppProxyBase::createProxy<::smoke::ListenersWithReturnValues, ::gluecodium::jni::ListenersWithReturnValuesImpl_CppProxy>(env, obj, result);
}
}
}
