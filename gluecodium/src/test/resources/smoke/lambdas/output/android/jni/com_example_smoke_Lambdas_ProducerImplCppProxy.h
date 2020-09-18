/*
 *
 */
#pragma once
#include "smoke/Lambdas.h"
#include <functional>
#include "CppProxyBase.h"
#include "JniReference.h"
namespace gluecodium
{
namespace jni
{
class com_example_smoke_Lambdas_00024ProducerImpl_CppProxy : public CppProxyBase {
public:
    com_example_smoke_Lambdas_00024ProducerImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    com_example_smoke_Lambdas_00024ProducerImpl_CppProxy( const com_example_smoke_Lambdas_00024ProducerImpl_CppProxy& ) = delete;
    com_example_smoke_Lambdas_00024ProducerImpl_CppProxy& operator=( const com_example_smoke_Lambdas_00024ProducerImpl_CppProxy& ) = delete;
    ::std::string operator()(  );
};
}
}
