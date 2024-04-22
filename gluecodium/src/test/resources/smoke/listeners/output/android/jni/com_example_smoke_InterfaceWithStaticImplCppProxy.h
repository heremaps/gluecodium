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

class com_example_smoke_InterfaceWithStatic_CppProxy final : public CppProxyBase, public ::smoke::InterfaceWithStatic {
public:
    com_example_smoke_InterfaceWithStatic_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_InterfaceWithStatic_CppProxy( const com_example_smoke_InterfaceWithStatic_CppProxy& ) = delete;
    com_example_smoke_InterfaceWithStatic_CppProxy& operator=( const com_example_smoke_InterfaceWithStatic_CppProxy& ) = delete;


    ::std::string regular_function(  ) override;


    ::std::string get_regular_property(  ) const override;

    void set_regular_property( const ::std::string& nvalue ) override;

};

}
}
