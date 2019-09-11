/*
 *
 */
#pragma once
#include "com_example_smoke_CalculationResultImplCppProxy.h"
#include "com_example_smoke_CalculatorListenerImplCppProxy.h"
#include "com_example_smoke_InternalListenerImplCppProxy.h"
#include "com_example_smoke_ListenerWithPropertiesImplCppProxy.h"
#include "com_example_smoke_ListenersWithReturnValuesImplCppProxy.h"
namespace genium
{
namespace jni
{
template<class T>
inline void createCppProxy(JNIEnv* env, const ::genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<T>& result) {
}
template<>
inline void createCppProxy(JNIEnv* env, const ::genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculationResult>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::CalculationResult, ::genium::jni::CalculationResultImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculatorListener>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::CalculatorListener, ::genium::jni::CalculatorListenerImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::InternalListener>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::InternalListener, ::genium::jni::InternalListenerImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenerWithProperties>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::ListenerWithProperties, ::genium::jni::ListenerWithPropertiesImpl_CppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const ::genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenersWithReturnValues>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::ListenersWithReturnValues, ::genium::jni::ListenersWithReturnValuesImpl_CppProxy>(env, obj, result);
}
}
}
