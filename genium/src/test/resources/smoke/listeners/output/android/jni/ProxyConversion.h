#pragma once
#include "com_example_smoke_ListenerWithAttributesImplCppProxy.h"
#include "com_example_smoke_CalculatorListenerImplCppProxy.h"
#include "com_example_smoke_CalculationResultImplCppProxy.h"
#include "com_example_smoke_ListenersWithReturnValuesImplCppProxy.h"
template<class T>
inline void createCppProxy(JNIEnv* env, const genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<T>& result) {
}
template<>
inline void createCppProxy(JNIEnv* env, const genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenerWithAttributes>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::ListenerWithAttributes, ::smoke::ListenerWithAttributesCppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculatorListener>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::CalculatorListener, ::smoke::CalculatorListenerCppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculationResult>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::CalculationResult, ::smoke::CalculationResultCppProxy>(env, obj, result);
}
template<>
inline void createCppProxy(JNIEnv* env, const genium::jni::JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenersWithReturnValues>& result) {
    ::genium::jni::CppProxyBase::createProxy<::smoke::ListenersWithReturnValues, ::smoke::ListenersWithReturnValuesCppProxy>(env, obj, result);
}