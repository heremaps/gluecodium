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


    ::gluecodium::optional< int8_t > method_with_byte( const ::gluecodium::optional< int8_t >& ninput ) override;

    ::gluecodium::optional< uint8_t > method_with_u_byte( const ::gluecodium::optional< uint8_t >& ninput ) override;

    ::gluecodium::optional< int16_t > method_with_short( const ::gluecodium::optional< int16_t >& ninput ) override;

    ::gluecodium::optional< uint16_t > method_with_u_short( const ::gluecodium::optional< uint16_t >& ninput ) override;

    ::gluecodium::optional< int32_t > method_with_int( const ::gluecodium::optional< int32_t >& ninput ) override;

    ::gluecodium::optional< uint32_t > method_with_u_int( const ::gluecodium::optional< uint32_t >& ninput ) override;

    ::gluecodium::optional< int64_t > method_with_long( const ::gluecodium::optional< int64_t >& ninput ) override;

    ::gluecodium::optional< uint64_t > method_with_u_long( const ::gluecodium::optional< uint64_t >& ninput ) override;

    ::gluecodium::optional< bool > method_with_double( const ::gluecodium::optional< bool >& ninput ) override;

    ::gluecodium::optional< float > method_with_float( const ::gluecodium::optional< float >& ninput ) override;

    ::gluecodium::optional< double > method_with_double( const ::gluecodium::optional< double >& ninput ) override;
};

}
}
