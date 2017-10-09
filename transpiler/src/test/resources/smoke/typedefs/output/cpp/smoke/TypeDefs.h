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

#include <string>
#include <vector>

namespace smoke {

class TypeDefs {
public:
using PrimitiveTypeDef = double;
struct TestStruct {
    ::std::string something;
};
using StructArray = ::std::vector< ::smoke::TypeDefs::TestStruct >;
using ComplexTypeDef = ::std::vector< ::smoke::TypeDefs::TestStruct >;

public:
/**
 *
 * * @return The result type, containing ::smoke::TypeDefs::PrimitiveTypeDef value.
 */
static ::smoke::TypeDefs::PrimitiveTypeDef methodWithPrimitiveTypeDef( const ::smoke::TypeDefs::PrimitiveTypeDef input );
/**
 *
 * * @return The result type, containing ::smoke::TypeDefs::ComplexTypeDef value.
 */
static ::smoke::TypeDefs::ComplexTypeDef methodWithComplexTypeDef( const ::smoke::TypeDefs::ComplexTypeDef& input );

};

}
