// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT DeclarationOrderWithFunctions {
    struct _GLUECODIUM_CPP_EXPORT FieldStruct {
        ::std::string some_field;
        FieldStruct( );
        explicit FieldStruct( ::std::string some_field );
    };
    struct _GLUECODIUM_CPP_EXPORT ParameterStruct {
        ::std::string some_field;
        ParameterStruct( );
        explicit ParameterStruct( ::std::string some_field );
    };
    struct _GLUECODIUM_CPP_EXPORT ReturnStruct {
        ::std::string some_field;
        ReturnStruct( );
        explicit ReturnStruct( ::std::string some_field );
    };
    struct _GLUECODIUM_CPP_EXPORT ThrownStruct {
        ::std::string some_field;
        ThrownStruct( );
        explicit ThrownStruct( ::std::string some_field );
    };
    struct _GLUECODIUM_CPP_EXPORT MainStructWithFunctions {
        ::smoke::DeclarationOrderWithFunctions::FieldStruct struct_field;
        MainStructWithFunctions( );
        explicit MainStructWithFunctions( ::smoke::DeclarationOrderWithFunctions::FieldStruct struct_field );
        void with_parameter( const ::smoke::DeclarationOrderWithFunctions::ParameterStruct& input ) const;
        ::smoke::DeclarationOrderWithFunctions::ReturnStruct with_return(  ) const;
        ::gluecodium::Return< void, ::smoke::DeclarationOrderWithFunctions::ThrownStruct > with_thrown(  ) const;
    };
};
}
