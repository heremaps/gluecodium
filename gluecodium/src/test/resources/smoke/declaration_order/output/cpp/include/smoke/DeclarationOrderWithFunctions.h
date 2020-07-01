// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Return.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldStruct {
    ::std::string some_field;
    FieldStruct( );
    FieldStruct( ::std::string some_field );
};
struct _GLUECODIUM_CPP_EXPORT ParameterStruct {
    ::std::string some_field;
    ParameterStruct( );
    ParameterStruct( ::std::string some_field );
};
struct _GLUECODIUM_CPP_EXPORT ReturnStruct {
    ::std::string some_field;
    ReturnStruct( );
    ReturnStruct( ::std::string some_field );
};
struct _GLUECODIUM_CPP_EXPORT ThrownStruct {
    ::std::string some_field;
    ThrownStruct( );
    ThrownStruct( ::std::string some_field );
};
struct _GLUECODIUM_CPP_EXPORT MainStructWithFunctions {
    ::smoke::FieldStruct struct_field;
    MainStructWithFunctions( );
    MainStructWithFunctions( ::smoke::FieldStruct struct_field );
    void with_parameter( const ::smoke::ParameterStruct& input ) const;
    ::smoke::ReturnStruct with_return(  ) const;
    ::gluecodium::Return< void, ::smoke::ThrownStruct > with_thrown(  ) const;
};
}
