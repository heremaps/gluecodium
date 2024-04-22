/*

 *
 */

#pragma once

#include "smoke/SkipSetter.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_SkipSetter_CppProxy final : public CppProxyBase, public ::smoke::SkipSetter {
public:
    com_example_smoke_SkipSetter_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_SkipSetter_CppProxy( const com_example_smoke_SkipSetter_CppProxy& ) = delete;
    com_example_smoke_SkipSetter_CppProxy& operator=( const com_example_smoke_SkipSetter_CppProxy& ) = delete;



    ::std::string get_foo(  ) const override;

    void set_foo( const ::std::string& nvalue ) override;

};

}
}
