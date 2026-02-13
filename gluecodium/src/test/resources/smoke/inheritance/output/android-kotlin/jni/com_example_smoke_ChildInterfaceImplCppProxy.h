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

class com_example_smoke_ChildInterface_CppProxy final : public CppProxyBase, public ::smoke::ChildInterface {
public:
    com_example_smoke_ChildInterface_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_ChildInterface_CppProxy( const com_example_smoke_ChildInterface_CppProxy& ) = delete;
    com_example_smoke_ChildInterface_CppProxy& operator=( const com_example_smoke_ChildInterface_CppProxy& ) = delete;


    void root_method(  ) override;


    ::std::string get_root_property(  ) const override;

    void set_root_property( const ::std::string& nvalue ) override;


    void child_method(  ) override;
};

}
}
