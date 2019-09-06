/*
 *
 */
#pragma once
#include <jni.h>
#include "JniReference.h"
#include "smoke/OuterClass.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_OuterClass_InnerInterfaceImpl.h"
namespace genium
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
