/*
 *
 */
#pragma once
#include "smoke/ChildInterface.h"
#include "CppProxyBase.h"
#include "JniReference.h"
namespace gluecodium
{
namespace jni
{
class com_example_smoke_ChildInterfaceImpl_CppProxy : public CppProxyBase, public ::smoke::ChildInterface {
public:
    com_example_smoke_ChildInterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    void root_method(  ) override;
    ::std::string get_root_property(  ) const override;
    void set_root_property( const ::std::string& nvalue ) override;
    void child_method(  ) override;
};
}
}
