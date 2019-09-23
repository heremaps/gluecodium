/*
 *
 */
#include "ProxyConversion.h"
namespace gluecodium
{
namespace jni
{
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Confuser& result)
{
    std::shared_ptr<Lambdas_00024ConfuserImpl_CppProxy> _nproxy{};
    CppProxyBase::createProxy<Lambdas_00024ConfuserImpl_CppProxy, Lambdas_00024ConfuserImpl_CppProxy>(env, obj, _nproxy);
    result = std::bind(&Lambdas_00024ConfuserImpl_CppProxy::operator(), _nproxy, std::placeholders::_1);
}
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Consumer& result)
{
    std::shared_ptr<Lambdas_00024ConsumerImpl_CppProxy> _nproxy{};
    CppProxyBase::createProxy<Lambdas_00024ConsumerImpl_CppProxy, Lambdas_00024ConsumerImpl_CppProxy>(env, obj, _nproxy);
    result = std::bind(&Lambdas_00024ConsumerImpl_CppProxy::operator(), _nproxy, std::placeholders::_1);
}
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Indexer& result)
{
    std::shared_ptr<Lambdas_00024IndexerImpl_CppProxy> _nproxy{};
    CppProxyBase::createProxy<Lambdas_00024IndexerImpl_CppProxy, Lambdas_00024IndexerImpl_CppProxy>(env, obj, _nproxy);
    result = std::bind(&Lambdas_00024IndexerImpl_CppProxy::operator(), _nproxy, std::placeholders::_1, std::placeholders::_2);
}
void createCppProxy(JNIEnv* env, const JniReference<jobject>& obj, ::smoke::Lambdas::Producer& result)
{
    std::shared_ptr<Lambdas_00024ProducerImpl_CppProxy> _nproxy{};
    CppProxyBase::createProxy<Lambdas_00024ProducerImpl_CppProxy, Lambdas_00024ProducerImpl_CppProxy>(env, obj, _nproxy);
    result = std::bind(&Lambdas_00024ProducerImpl_CppProxy::operator(), _nproxy);
}
}
}
