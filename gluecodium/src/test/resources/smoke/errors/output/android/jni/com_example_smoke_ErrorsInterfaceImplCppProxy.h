/*

 *
 */

#pragma once

#include "smoke/ErrorsInterface.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_ErrorsInterface_CppProxy final : public CppProxyBase, public ::smoke::ErrorsInterface {
public:
    com_example_smoke_ErrorsInterface_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_ErrorsInterface_CppProxy( const com_example_smoke_ErrorsInterface_CppProxy& ) = delete;
    com_example_smoke_ErrorsInterface_CppProxy& operator=( const com_example_smoke_ErrorsInterface_CppProxy& ) = delete;


    ::std::error_code method_with_errors(  ) override;

    ::std::error_code method_with_external_errors(  ) override;

    ::gluecodium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value(  ) override;
};

}
}
