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

#include <cstdint>
#include <limits>
#include <string>
#include <vector>

namespace smoke {

class Arrays {
public:
    virtual ~Arrays() = 0;
public:
using UIntArray = ::std::vector< uint8_t >;
using StringArray = ::std::vector< ::std::string >;
using ProfileId = ::std::string;
using ProfileIdList = ::std::vector< ::smoke::Arrays::ProfileId >;
struct BasicStruct {
    double value = std::numeric_limits< double >::quiet_NaN( );
};
using StructArray = ::std::vector< ::smoke::Arrays::BasicStruct >;
struct FancyStruct {
    ::smoke::Arrays::StringArray messages;
    ::std::vector< uint8_t > numbers;
};
using FancyArray = ::std::vector< ::smoke::Arrays::FancyStruct >;

public:
static ::smoke::Arrays::StringArray method_with_array( const ::smoke::Arrays::StringArray& input );
static ::std::vector< uint8_t > method_with_array_inline( const ::std::vector< uint8_t >& input );
static ::smoke::Arrays::StructArray method_with_struct_array( const ::std::vector< ::smoke::Arrays::BasicStruct >& input );
static ::std::vector< ::smoke::Arrays::UIntArray > method_with_array_of_arrays( const ::std::vector< ::smoke::Arrays::UIntArray >& input );
static ::smoke::Arrays::FancyArray merge_arrays_of_structs_with_arrays( const ::std::vector< ::smoke::Arrays::FancyStruct >& inline_fancy_array, const ::smoke::Arrays::FancyArray& fancy_array );
static ::smoke::Arrays::ProfileIdList method_with_array_of_aliases( const ::smoke::Arrays::ProfileIdList& input );

};

}
