/*

 *
 */

#pragma once

#include "smoke/SimpleClass.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_SimpleClassImpl_CppProxy final : public CppProxyBase, public ::smoke::SimpleClass {
public:
    com_example_smoke_SimpleClassImpl_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_SimpleClassImpl_CppProxy( const com_example_smoke_SimpleClassImpl_CppProxy& ) = delete;
    com_example_smoke_SimpleClassImpl_CppProxy& operator=( const com_example_smoke_SimpleClassImpl_CppProxy& ) = delete;


    ::std::string get_string_value(  ) override;

    ::std::shared_ptr< ::smoke::SimpleClass > use_simple_class( const ::std::shared_ptr< ::smoke::SimpleClass >& ninput ) override;


    ::std::string get_title(  ) const override;

};

}
}
