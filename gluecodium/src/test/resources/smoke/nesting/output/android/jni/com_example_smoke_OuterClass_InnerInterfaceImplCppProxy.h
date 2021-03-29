/*
 *
 */
#pragma once
#include "smoke/OuterClass.h"
#include "CppProxyBase.h"
#include "JniReference.h"
namespace gluecodium
{
namespace jni
{
class com_example_smoke_OuterClass_00024InnerInterface_CppProxy : public CppProxyBase, public ::smoke::OuterClass::InnerInterface {
public:
    com_example_smoke_OuterClass_00024InnerInterface_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    com_example_smoke_OuterClass_00024InnerInterface_CppProxy( const com_example_smoke_OuterClass_00024InnerInterface_CppProxy& ) = delete;
    com_example_smoke_OuterClass_00024InnerInterface_CppProxy& operator=( const com_example_smoke_OuterClass_00024InnerInterface_CppProxy& ) = delete;
    ::std::string foo( const ::std::string& ninput ) override;
};
}
}
