/*

 *
 */

#pragma once

#include "smoke/DurationInterface.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_DurationInterface_CppProxy final : public CppProxyBase, public ::smoke::DurationInterface {
public:
    com_example_smoke_DurationInterface_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_DurationInterface_CppProxy( const com_example_smoke_DurationInterface_CppProxy& ) = delete;
    com_example_smoke_DurationInterface_CppProxy& operator=( const com_example_smoke_DurationInterface_CppProxy& ) = delete;


    ::std::string duration_function( const ::std::chrono::seconds ninput ) override;
};

}
}
