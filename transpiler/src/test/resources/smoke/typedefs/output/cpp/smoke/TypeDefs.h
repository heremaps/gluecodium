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

#include "cpp/smoke/TypeCollection.h"
#include <string>
#include <vector>

namespace smoke {

class TypeDefs {
public:
using PrimitiveTypeDef = double;
using NestedIntTypeDef = ::smoke::TypeDefs::PrimitiveTypeDef;
struct TestStruct {
    ::std::string something;
};
using StructArray = ::std::vector< ::smoke::TypeDefs::TestStruct >;
using ComplexTypeDef = ::std::vector< ::smoke::TypeDefs::TestStruct >;
using TestStructTypeDef = ::smoke::TypeDefs::TestStruct;
using NestedStructTypeDef = ::smoke::TypeDefs::TestStructTypeDef;

public:
static ::smoke::TypeDefs::PrimitiveTypeDef methodWithPrimitiveTypeDef( const ::smoke::TypeDefs::PrimitiveTypeDef input );
static ::smoke::TypeDefs::ComplexTypeDef methodWithComplexTypeDef( const ::smoke::TypeDefs::ComplexTypeDef& input );
static ::smoke::TypeDefs::NestedIntTypeDef returnNestedIntTypeDef( const ::smoke::TypeDefs::NestedIntTypeDef input );
static ::smoke::TypeDefs::TestStructTypeDef returnTestStructTypeDef( const ::smoke::TypeDefs::TestStructTypeDef& input );
static ::smoke::TypeDefs::NestedStructTypeDef returnNestedStructTypeDef( const ::smoke::TypeDefs::NestedStructTypeDef& input );
static ::smoke::PointTypeDef returnTypeDefPointFromTypeCollection( const ::smoke::PointTypeDef& input );

};

}
