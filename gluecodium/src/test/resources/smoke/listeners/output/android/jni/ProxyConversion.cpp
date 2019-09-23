/*
 *
 */
#include "ProxyConversion.h"
namespace gluecodium
{
namespace jni
{
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculationResult>& result)
{
    CppProxyBase::createProxy<::smoke::CalculationResult, CalculationResultImpl_CppProxy>(env, obj, result);
}
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::CalculatorListener>& result)
{
    CppProxyBase::createProxy<::smoke::CalculatorListener, CalculatorListenerImpl_CppProxy>(env, obj, result);
}
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::InternalListener>& result)
{
    CppProxyBase::createProxy<::smoke::InternalListener, InternalListenerImpl_CppProxy>(env, obj, result);
}
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenerWithProperties>& result)
{
    CppProxyBase::createProxy<::smoke::ListenerWithProperties, ListenerWithPropertiesImpl_CppProxy>(env, obj, result);
}
template<>
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::std::shared_ptr<::smoke::ListenersWithReturnValues>& result)
{
    CppProxyBase::createProxy<::smoke::ListenersWithReturnValues, ListenersWithReturnValuesImpl_CppProxy>(env, obj, result);
}
}
}
