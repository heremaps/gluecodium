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
class OuterClass_00024InnerInterfaceImpl_CppProxy : public CppProxyBase, public ::smoke::OuterClass::InnerInterface {
public:
    OuterClass_00024InnerInterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    ::std::string foo( const ::std::string& ninput ) override;
};
}
}
