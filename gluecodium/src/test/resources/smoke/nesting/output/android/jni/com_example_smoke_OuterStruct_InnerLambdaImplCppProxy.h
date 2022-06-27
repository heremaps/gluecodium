/*
 *
 */
#pragma once
#include "smoke/OuterStruct.h"
#include <functional>
#include "CppProxyBase.h"
#include "JniReference.h"
namespace gluecodium
{
namespace jni
{
class com_example_smoke_OuterStruct_00024InnerLambda_CppProxy : public CppProxyBase {
public:
    com_example_smoke_OuterStruct_00024InnerLambda_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    com_example_smoke_OuterStruct_00024InnerLambda_CppProxy( const com_example_smoke_OuterStruct_00024InnerLambda_CppProxy& ) = delete;
    com_example_smoke_OuterStruct_00024InnerLambda_CppProxy& operator=( const com_example_smoke_OuterStruct_00024InnerLambda_CppProxy& ) = delete;
    void operator()(  );
};
}
}
