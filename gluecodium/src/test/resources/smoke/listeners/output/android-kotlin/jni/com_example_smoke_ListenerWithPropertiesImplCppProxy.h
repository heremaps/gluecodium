/*

 *
 */

#pragma once

#include "smoke/ListenerWithProperties.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_ListenerWithProperties_CppProxy final : public CppProxyBase, public ::smoke::ListenerWithProperties {
public:
    com_example_smoke_ListenerWithProperties_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_ListenerWithProperties_CppProxy( const com_example_smoke_ListenerWithProperties_CppProxy& ) = delete;
    com_example_smoke_ListenerWithProperties_CppProxy& operator=( const com_example_smoke_ListenerWithProperties_CppProxy& ) = delete;



    ::std::string get_message(  ) const override;

    void set_message( const ::std::string& nvalue ) override;



    ::std::shared_ptr< ::smoke::CalculationResult > get_packed_message(  ) const override;

    void set_packed_message( const ::std::shared_ptr< ::smoke::CalculationResult >& nvalue ) override;



    ::smoke::ListenerWithProperties::ResultStruct get_structured_message(  ) const override;

    void set_structured_message( const ::smoke::ListenerWithProperties::ResultStruct& nvalue ) override;



    ::smoke::ListenerWithProperties::ResultEnum get_enumerated_message(  ) const override;

    void set_enumerated_message( const ::smoke::ListenerWithProperties::ResultEnum nvalue ) override;



    ::std::vector< ::std::string > get_arrayed_message(  ) const override;

    void set_arrayed_message( const ::std::vector< ::std::string >& nvalue ) override;



    ::smoke::ListenerWithProperties::StringToDouble get_mapped_message(  ) const override;

    void set_mapped_message( const ::smoke::ListenerWithProperties::StringToDouble& nvalue ) override;



    ::std::shared_ptr< ::std::vector< uint8_t > > get_buffered_message(  ) const override;

    void set_buffered_message( const ::std::shared_ptr< ::std::vector< uint8_t > >& nvalue ) override;

};

}
}
