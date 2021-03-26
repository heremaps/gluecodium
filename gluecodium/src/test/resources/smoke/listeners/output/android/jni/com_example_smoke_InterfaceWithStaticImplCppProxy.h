/*
 *
 */
#pragma once
#include "smoke/InterfaceWithStatic.h"
#include "CppProxyBase.h"
#include "JniReference.h"
namespace gluecodium
{
namespace jni
{
class com_example_smoke_InterfaceWithStatic_CppProxy : public CppProxyBase, public ::smoke::InterfaceWithStatic {
public:
    com_example_smoke_InterfaceWithStatic_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    com_example_smoke_InterfaceWithStatic_CppProxy( const com_example_smoke_InterfaceWithStatic_CppProxy& ) = delete;
    com_example_smoke_InterfaceWithStatic_CppProxy& operator=( const com_example_smoke_InterfaceWithStatic_CppProxy& ) = delete;
    ::std::string regular_function(  ) override;
    ::std::string get_regular_property(  ) const override;
    void set_regular_property( const ::std::string& nvalue ) override;
};
}
}
