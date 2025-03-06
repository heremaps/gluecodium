/*

 *
 */

#pragma once

#include "smoke/ListenerWithNullable.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_ListenerWithNullable_CppProxy final : public CppProxyBase, public ::smoke::ListenerWithNullable {
public:
    com_example_smoke_ListenerWithNullable_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_ListenerWithNullable_CppProxy( const com_example_smoke_ListenerWithNullable_CppProxy& ) = delete;
    com_example_smoke_ListenerWithNullable_CppProxy& operator=( const com_example_smoke_ListenerWithNullable_CppProxy& ) = delete;


    std::optional< int8_t > method_with_byte( const std::optional< int8_t >& ninput ) override;

    std::optional< uint8_t > method_with_u_byte( const std::optional< uint8_t >& ninput ) override;

    std::optional< int16_t > method_with_short( const std::optional< int16_t >& ninput ) override;

    std::optional< uint16_t > method_with_u_short( const std::optional< uint16_t >& ninput ) override;

    std::optional< int32_t > method_with_int( const std::optional< int32_t >& ninput ) override;

    std::optional< uint32_t > method_with_u_int( const std::optional< uint32_t >& ninput ) override;

    std::optional< int64_t > method_with_long( const std::optional< int64_t >& ninput ) override;

    std::optional< uint64_t > method_with_u_long( const std::optional< uint64_t >& ninput ) override;

    std::optional< bool > method_with_double( const std::optional< bool >& ninput ) override;

    std::optional< float > method_with_float( const std::optional< float >& ninput ) override;

    std::optional< double > method_with_double( const std::optional< double >& ninput ) override;
};

}
}
