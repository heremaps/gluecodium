/*

 *
 */

#pragma once

#include "smoke/Lambdas.h"
#include <functional>
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_Lambdas_00024Producer_CppProxy final : public CppProxyBase {
public:
    com_example_smoke_Lambdas_00024Producer_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_Lambdas_00024Producer_CppProxy( const com_example_smoke_Lambdas_00024Producer_CppProxy& ) = delete;
    com_example_smoke_Lambdas_00024Producer_CppProxy& operator=( const com_example_smoke_Lambdas_00024Producer_CppProxy& ) = delete;


    ::std::string operator()(  );
};

}
}
