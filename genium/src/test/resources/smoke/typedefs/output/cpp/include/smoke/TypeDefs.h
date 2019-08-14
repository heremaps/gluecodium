// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/VectorHash.h"
#include "smoke/TypeCollection.h"
#include <string>
#include <vector>
namespace smoke {
class _GENIUM_CPP_EXPORT TypeDefs {
public:
    virtual ~TypeDefs() = 0;
public:
using PrimitiveTypeDef = double;
using NestedIntTypeDef = ::smoke::TypeDefs::PrimitiveTypeDef;
struct _GENIUM_CPP_EXPORT StructHavingAliasFieldDefinedBelow {
    ::smoke::TypeDefs::PrimitiveTypeDef field;
    StructHavingAliasFieldDefinedBelow( );
    StructHavingAliasFieldDefinedBelow( const ::smoke::TypeDefs::PrimitiveTypeDef field );
};
struct _GENIUM_CPP_EXPORT TestStruct {
    ::std::string something;
    TestStruct( );
    TestStruct( const ::std::string& something );
};
using StructArray = ::std::vector< ::smoke::TypeDefs::TestStruct >;
using ComplexTypeDef = ::smoke::TypeDefs::StructArray;
using TestStructTypeDef = ::smoke::TypeDefs::TestStruct;
using NestedStructTypeDef = ::smoke::TypeDefs::TestStructTypeDef;
public:
static ::smoke::TypeDefs::PrimitiveTypeDef method_with_primitive_type_def( const ::smoke::TypeDefs::PrimitiveTypeDef input );
static ::smoke::TypeDefs::ComplexTypeDef method_with_complex_type_def( const ::smoke::TypeDefs::ComplexTypeDef& input );
static ::smoke::TypeDefs::NestedIntTypeDef return_nested_int_type_def( const ::smoke::TypeDefs::NestedIntTypeDef input );
static ::smoke::TypeDefs::TestStructTypeDef return_test_struct_type_def( const ::smoke::TypeDefs::TestStructTypeDef& input );
static ::smoke::TypeDefs::NestedStructTypeDef return_nested_struct_type_def( const ::smoke::TypeDefs::NestedStructTypeDef& input );
static ::smoke::PointTypeDef return_type_def_point_from_type_collection( const ::smoke::PointTypeDef& input );
virtual ::std::vector< ::smoke::TypeDefs::PrimitiveTypeDef > get_primitive_type_property(  ) const = 0;
virtual void set_primitive_type_property( const ::std::vector< ::smoke::TypeDefs::PrimitiveTypeDef >& value ) = 0;
};
}