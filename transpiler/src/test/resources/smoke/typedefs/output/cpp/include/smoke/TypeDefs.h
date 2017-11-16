// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "smoke/TypeCollection.h"
#include <string>
#include <vector>

namespace smoke {

class TypeDefs {
public:
    virtual ~TypeDefs() = 0;
public:
using PrimitiveTypeDef = double;
using NestedIntTypeDef = ::smoke::TypeDefs::PrimitiveTypeDef;
struct StructHavingAliasFieldDefinedBelow {
    ::smoke::TypeDefs::PrimitiveTypeDef field;
};
struct TestStruct {
    ::std::string something;
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

virtual ::std::vector< ::smoke::TypeDefs::PrimitiveTypeDef > get_primitive_type_attribute(  ) = 0;
virtual void set_primitive_type_attribute( const ::std::vector< ::smoke::TypeDefs::PrimitiveTypeDef >& value ) = 0;

};

}
